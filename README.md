GoodbyeDPI — Модификация от KetaruCorp
=========================

Это программное обеспечение предназначено для обхода систем глубокой проверки пакетов, используемых многими интернет-провайдерами, которые блокируют доступ к определенным веб-сайтам.

Он обрабатывает DPI, подключенный с помощью оптического разветвителя или зеркалирования портов (**Пассивный DPI**), который не блокирует какие-либо данные, а просто отвечает быстрее, чем запрошенный пункт назначения, и **Активный DPI**, подключенный последовательно.

# Особенности модификации
<ul>
 <li>[x] Расширенный обход замедления <b>YouTube</b> </li>
 <li>[x] Обход замедления <b>Discord</b></li>
 <li>[x] Обход замедления <b>PornHub</b></li>
 <li>[x] Обход возможной блокировки <b>Telegram</b></li>
</ul>

**Windows 7, 8, 8.1, 10 or 11** с необходимыми правами администратора.

# Быстрый старт

* **Для России**: Скачать [последнюю версию со страницы «Релизы»](https://github.com/ValdikSS/GoodbyeDPI/releases), распакуйте файл и запустите **installer.cmd** Скрипт.

Эти скрипты запускают GoodbyeDPI в рекомендованном режиме с перенаправлением DNS-резольвера на DNS Яндекса на нестандартный порт (во избежание отравления DNS).  
Если это работает — поздравляю! Вы можете использовать его как есть или настроить дальше.

```
Usage: goodbyedpi.exe [OPTION...]
 -p          block passive DPI
 -q          block QUIC/HTTP3
 -r          replace Host with hoSt
 -s          remove space between host header and its value
 -m          mix Host header case (test.com -> tEsT.cOm)
 -f <value>  set HTTP fragmentation to value
 -k <value>  enable HTTP persistent (keep-alive) fragmentation and set it to value
 -n          do not wait for first segment ACK when -k is enabled
 -e <value>  set HTTPS fragmentation to value
 -a          additional space between Method and Request-URI (enables -s, may break sites)
 -w          try to find and parse HTTP traffic on all processed ports (not only on port 80)
 --port        <value>    additional TCP port to perform fragmentation on (and HTTP tricks with -w)
 --ip-id       <value>    handle additional IP ID (decimal, drop redirects and TCP RSTs with this ID).
                          This option can be supplied multiple times.
 --dns-addr    <value>    redirect UDP DNS requests to the supplied IP address (experimental)
 --dns-port    <value>    redirect UDP DNS requests to the supplied port (53 by default)
 --dnsv6-addr  <value>    redirect UDPv6 DNS requests to the supplied IPv6 address (experimental)
 --dnsv6-port  <value>    redirect UDPv6 DNS requests to the supplied port (53 by default)
 --dns-verb               print verbose DNS redirection messages
 --blacklist   <txtfile>  perform circumvention tricks only to host names and subdomains from
                          supplied text file (HTTP Host/TLS SNI).
                          This option can be supplied multiple times.
 --allow-no-sni           perform circumvention if TLS SNI can't be detected with --blacklist enabled.
 --frag-by-sni            if SNI is detected in TLS packet, fragment the packet right before SNI value.
 --set-ttl     <value>    activate Fake Request Mode and send it with supplied TTL value.
                          DANGEROUS! May break websites in unexpected ways. Use with care (or --blacklist).
 --auto-ttl    [a1-a2-m]  activate Fake Request Mode, automatically detect TTL and decrease
                          it based on a distance. If the distance is shorter than a2, TTL is decreased
                          by a2. If it's longer, (a1; a2) scale is used with the distance as a weight.
                          If the resulting TTL is more than m(ax), set it to m.
                          Default (if set): --auto-ttl 1-4-10. Also sets --min-ttl 3.
                          DANGEROUS! May break websites in unexpected ways. Use with care (or --blacklist).
 --min-ttl     <value>    minimum TTL distance (128/64 - TTL) for which to send Fake Request
                          in --set-ttl and --auto-ttl modes.
 --wrong-chksum           activate Fake Request Mode and send it with incorrect TCP checksum.
                          May not work in a VM or with some routers, but is safer than set-ttl.
 --wrong-seq              activate Fake Request Mode and send it with TCP SEQ/ACK in the past.
 --native-frag            fragment (split) the packets by sending them in smaller packets, without
                          shrinking the Window Size. Works faster (does not slow down the connection)
                          and better.
 --reverse-frag           fragment (split) the packets just as --native-frag, but send them in the
                          reversed order. Works with the websites which could not handle segmented
                          HTTPS TLS ClientHello (because they receive the TCP flow "combined").
 --max-payload [value]    packets with TCP payload data more than [value] won't be processed.
                          Use this option to reduce CPU usage by skipping huge amount of data
                          (like file transfers) in already established sessions.
                          May skip some huge HTTP requests from being processed.
                          Default (if set): --max-payload 1200.


LEGACY modesets:
 -1          -p -r -s -f 2 -k 2 -n -e 2 (most compatible mode)
 -2          -p -r -s -f 2 -k 2 -n -e 40 (better speed for HTTPS yet still compatible)
 -3          -p -r -s -e 40 (better speed for HTTP and HTTPS)
 -4          -p -r -s (best speed)

Modern modesets (more stable, more compatible, faster):
 -5          -f 2 -e 2 --auto-ttl --reverse-frag --max-payload
 -6          -f 2 -e 2 --wrong-seq --reverse-frag --max-payload
 -7          -f 2 -e 2 --wrong-chksum --reverse-frag --max-payload
 -8          -f 2 -e 2 --wrong-seq --wrong-chksum --reverse-frag --max-payload
 -9          -f 2 -e 2 --wrong-seq --wrong-chksum --reverse-frag --max-payload -q (this is the default)

 Note: combination of --wrong-seq and --wrong-chksum generates two different fake packets.
```

Чтобы проверить, можно ли обойти DPI вашего интернет-провайдера, сначала убедитесь, что ваш провайдер не искажает ответы DNS, включив опцию «Безопасный DNS (DNS через HTTPS)» в вашем браузере.

***Chrome**: Настройки → [Конфиденциальность и безопасность](chrome://settings/security) → Использовать безопасный DNS → С помощью: NextDNS.
***Firefox**: [Настройки](about:preferences) → Настройки сети → Включить DNS через HTTPS → Использовать провайдера: NextDNS.

Затем запустите `goodbyedpi.exe` исполняемый без каких-либо опций. Если это работает — поздравляю! Вы можете использовать его как есть или настроить дальше, например, с помощью `--blacklist` вариант, если список заблокированных веб-сайтов известен и доступен для вашей страны.

Если ваш провайдер перехватывает DNS-запросы, вы можете использовать `--dns-addr` вариант общедоступного преобразователя DNS, работающего на нестандартном порту (например, Яндекс DNS `77.88.8.8:1253`) или настройте DNS через HTTPS/TLS с помощью сторонних приложений.

Проверьте сценарии .cmd и измените их в соответствии со своими предпочтениями и условиями сети.

# Как это работает

### Пассивный DPI

Большинство пассивных DPI отправляют перенаправление HTTP 302, если вы пытаетесь получить доступ к заблокированному веб-сайту через HTTP, и сброс TCP в случае HTTPS быстрее, чем целевой веб-сайт. Пакеты, отправляемые DPI, обычно имеют поле идентификации IP, равное`0x0000`Или`0x0001`, как это видно у российских провайдеров. Эти пакеты, если они перенаправляют вас на другой веб-сайт (страницу цензуры), блокируются GoodbyeDPI.

### Активный DPI

Активный DPI сложнее обмануть. На данный момент программа использует 7 методов обхода Active DPI:

* Фрагментация на уровне TCP для первого пакета данных
* Фрагментация на уровне TCP для постоянных (поддерживающих активность) HTTP-сессий.
* Замена `Host` заголовок с `hoSt`
* Удаление пробела между именем и значением заголовка в `Host` Заголовок
* Добавление дополнительного пространства между методом HTTP (GET, POST и т. д.) и URI.
* Случай смешивания значения заголовка Host
* Отправка поддельных пакетов HTTP/HTTPS с низким значением времени жизни, неправильной контрольной суммой или неверными номерами последовательности/подтверждения TCP, чтобы обмануть DPI и предотвратить их доставку по назначению.

Эти методы не должны нарушить работу любого веб-сайта, поскольку они полностью совместимы со стандартами TCP и HTTP, но при этом достаточны для предотвращения классификации данных DPI и обхода цензуры. Дополнительное пространство может привести к поломке некоторых веб-сайтов, хотя это приемлемо по спецификации HTTP/1.1 (см. 19.3 Толерантные приложения).

Программа загружает драйвер WinDivert, который использует платформу фильтрации Windows для установки фильтров и перенаправления пакетов в пространство пользователя. Он работает до тех пор, пока видно окно консоли, и завершается, когда вы закрываете окно.

# Похожие проекты

- **[zapret](https://github.com/bol-van/zapret)** от @bol-van (для MacOS, Linux и Windows)
- **[Green Tunnel](https://github.com/SadeghHayeri/GreenTunnel)** от @SadeghHayeri (для MacOS, Linux и Windows)
- **[DPI Tunnel CLI](https://github.com/nomoresat/DPITunnel-cli)** от @zhenyolka (для Linux и роутеров)
- **[DPI Tunnel for Android](https://github.com/nomoresat/DPITunnel-android)** от @zhenyolka (для Android)
- **[PowerTunnel](https://github.com/krlvm/PowerTunnel)** от @krlvm (для Windows, MacOS и Linux)
- **[PowerTunnel for Android](https://github.com/krlvm/PowerTunnel-Android)** от @krlvm (для Android)
- **[SpoofDPI](https://github.com/xvzc/SpoofDPI)** от @xvzc (для macOS и Linux)
- **[GhosTCP](https://github.com/macronut/ghostcp)** от @macronut (для Windows)
- **[ByeDPI](https://github.com/hufrea/byedpi)** для Linux/Windows + **[ByeDPIAndroid](https://github.com/dovecoteescapee/ByeDPIAndroid/)** для Android (без рута)
- **[youtubeUnblock](https://github.com/Waujito/youtubeUnblock/)** от @Waujito (для маршрутизаторов OpenWRT/Entware и Linux)

# Kudos

Спасибо @basil00 за [WinDivert](https://github.com/basil00/Divert). Это основная часть этой программы.

Спасибо всем участникам [BlockCheck](https://github.com/ValdikSS/blockcheck). Без этой утилиты было бы невозможно понять поведение DPI.
