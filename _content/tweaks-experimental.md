[![](https://github.com/denis-g/windows10-latency-optimization/blob/master/images/header_small.png)](https://github.com/denis-g/windows10-latency-optimization#содержание)

---

### Экспериментальные твики

Данные настройки не обязательны, но в них есть немного для каждого.

- [Отключение патчей Meltdown, Spectre, Zombieload v2](https://github.com/denis-g/windows10-latency-optimization/blob/master/_content/tweaks-experimental.md#отключение-патчей-meltdown-spectre-zombieload-v2)
- [Настройка сети](https://github.com/denis-g/windows10-latency-optimization/blob/master/_content/tweaks-experimental.md#настройка-сети)

![](https://github.com/denis-g/windows10-latency-optimization/blob/master/images/hr.png)

### Отключение патчей Meltdown, Spectre, Zombieload v2

> :bulb: Для дальнейшей настройки необходимо ознакомиться c
[Работа с реестром](https://github.com/denis-g/windows10-latency-optimization/blob/master/_content/_howto-regedit.md).

```reg
Windows Registry Editor Version 5.00

; отключение патчей Meltdown и Spectre
[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management]
"FeatureSettings"=dword:00000001
"FeatureSettingsOverride"=dword:00000003
"FeatureSettingsOverrideMask"=dword:00000003

; отключение патча Zombieload v2
[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Kernel]
"DisableTsx"=dword:00000001
```

<details><summary>Значения по-умолчанию:</summary>

```reg
Windows Registry Editor Version 5.00

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management]
"FeatureSettings"=dword:00000000
"FeatureSettingsOverride"=-
"FeatureSettingsOverrideMask"=-

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Kernel]
"DisableTsx"=-
```

</details>

В своё время обнаружение Meltdown <sup>[[?]](https://ru.wikipedia.org/wiki/Meltdown_%28уязвимость%29)</sup> и Spectre <sup>[[?]](https://ru.wikipedia.org/wiki/Spectre_%28уязвимость%29)</sup> наделало не мало шума, и зачастую противники этих патчей выдвигают основной аргумент в пользу его отключения – уменьшение производительности CPU. С одной стороны некоторое падение производительности действительно есть <sup>[[?]](https://www.youtube.com/watch?v=cqsU-u0KmFI)</sup>, тоже самое касается и Zombieload <sup>[[?]](https://www.phoronix.com/scan.php?page=article&item=zombieload-v2-taa)</sup> – что-то в районе пары процентов, что не критично и в пределах погрешности, с другой стороны это всё же потенциальная дыра и в приличном обществе такое выставлять на показ не принято.

> :sparkles: На слабых CPU есть смысл поэкспериментировать с данной настройкой. 

![](https://github.com/denis-g/windows10-latency-optimization/blob/master/images/hr.png)

### Настройка сети

> :bulb: Для дальнейшей настройки необходимо ознакомиться c
[Работа с реестром](https://github.com/denis-g/windows10-latency-optimization/blob/master/_content/_howto-regedit.md),
[Определение Class GUID](https://github.com/denis-g/windows10-latency-optimization/blob/master/_content/_detect-class-guid.md).

> :warning: Все настройки сети **необходимо тестировать**, чтобы определить оптимальные для вашего качества соединения.

```reg
Windows Registry Editor Version 5.00

[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile]
"NetworkThrottlingIndex"=dword:ffffffff
```

<details><summary>Значения по-умолчанию:</summary>

```reg
Windows Registry Editor Version 5.00

[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile]
"NetworkThrottlingIndex"=dword:0000000a
```

</details>

По-умолчанию в Windows используется механизм регулирования сети, где ограничивается обработка не мультимедийного сетевого трафика до 10 пакетов в миллисекунду (чуть больше 100 Mb/s). Смысл такого регулирования заключается в том, что обработка сетевых пакетов может быть ресурсоёмкой задачей, и может потребоваться регулирование, чтобы обеспечить приоритетный доступ CPU к мультимедийным программам. Но т.к. мы хотим избавиться от дополнительных вмешательств, то данную настройку так же рекомендуется отключить, особенно при наличии гигабитной сети.

---

```reg
Windows Registry Editor Version 5.00

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\***]
"TCPNoDelay"=dword:00000001
"TcpAckFrequency"=dword:00000001
"TcpDelAckTicks"=dword:00000000
"MTU"=dword:000005dc
```

<details><summary>Значения по-умолчанию:</summary>

```reg
Windows Registry Editor Version 5.00

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\***]
"TCPNoDelay"=-
"TcpAckFrequency"=-
"TcpDelAckTicks"=-
"MTU"=-
```

</details>

В качестве части имени ветки мы используем `***`, где `***` надо заменить на Class GUID нашего сетевого адаптера.

Параметр `TCPNoDelay` отвечает за включение Алгоритма Нейгла <sup>[[?]](https://ru.wikipedia.org/wiki/Алгоритм_Нейгла)</sup>, который предназначен для повышения эффективности протокола TCP <sup>[[?]](https://ru.wikipedia.org/wiki/Transmission_Control_Protocol)</sup> за счёт уменьшения количества сетевых пакетов, путём объединения несколько небольших пакетов в один крупный пакет для более эффективной передачи (`nagling`). Однако было доказано <sup>[[?]](https://www.speedguide.net/articles/windows-7-vista-2008-tweaks-2574)</sup>, что в некоторых играх он увеличивает сетевую задержку, поэтому рекомендуется отключить его.

> :warning: Имейте в виду, что отключение данной функции уменьшит скорость загрузки/отдачи из-за меньшего количества данных, передаваемых за пакет.

Параметр `TcpAckFrequency` определяет количество подтверждений TCP (ACK), чтобы уменьшить количество пакетов <sup>[[?]](https://docs.microsoft.com/en-us/troubleshoot/windows-server/networking/registry-entry-control-tcp-acknowledgment-behavior)</sup>. Для увеличения пропускной способности можете поэкспериментировать с небольшими значениями, превышающими `2`. Производительность Wi-Fi также может немного улучшиться, если с отключить данную функцию установив `1`.

Параметр `TcpDelAckTicks` служит для настройки тайм-аута TCP (ACK) <sup>[[?]](https://docs.microsoft.com/en-us/troubleshoot/windows-server/networking/slow-performance-copy-data-tcp-server-sockets-api)</sup>. Если вы отключили `nagling`, то данный параметр так же стоит отключить установив параметр в `0`.

> :warning: Вы также можете установить значение параметра `1`, чтобы уменьшить `nagling` с 200ms по умолчанию, не отключая его.

Параметр `MTU`, как ясно из названия, явно задаёт использовать `MTU` <sup>[[?]](https://ru.wikipedia.org/wiki/Maximum_transmission_unit)</sup> равный `1500` байт <sup>[[?]](https://habr.com/ru/post/489340/)</sup> для избежания авто-установки в не правильное значение, т.к. по-умолчанию все сетевые устройства используют это значение равное 1500, а разные значения на устройствах могут привести с потери пакетов.

---

`Congestion Control Provider` <sup>[[?]](https://docs.microsoft.com/en-us/previous-versions/windows/it-pro/windows-server-2008-R2-and-2008/cc731258(v=ws.10))</sup> – специальные алгоритмы используемые чтобы улучшить пропускную способность. Доступны несколько вариантов:
- `CTCP` <sup>[[?]](https://ru.wikipedia.org/wiki/Compound_TCP)</sup> – может улучшить пропускную способность при более высоких задержках или широкополосном соединении.
- `DCTCP` – используется для повышения пропускной способности на локальных каналах с низкой задержкой, если у вас есть LAN-сеть или гигабитное соединение. Используется на серверах.
- `NewReno` – аналогичен `CTCP`, но так же использует дополнительные алгоритмы Fast Retransmit & Fast Recovery.

<details><summary>Включение CTCP:</summary>

```cmd
netsh int tcp set supplemental Internet congestionprovider=ctcp > nul
netsh int tcp set heuristics disabled > nul
```

</details>

<details><summary>Включение DCTCP:</summary>

```cmd
netsh int tcp set supplemental Internet congestionprovider=dctcp > nul
netsh int tcp set heuristics disabled > nul
```

</details>

<details><summary>Включение NewReno (по-умолчанию):</summary>

```cmd
netsh int tcp set supplemental Internet congestionprovider=NewReno > nul
netsh int tcp set heuristics disabled > nul
```

</details>

---

Автоматическая настройка TCP <sup>[[?]](https://docs.microsoft.com/en-us/previous-versions/windows/it-pro/windows-server-2008-R2-and-2008/cc731258(v=ws.10))</sup> - поможет улучшить пропускную способность в сетях с высокой пропускной способностью и большими задержками. Отключение фиксирует значение для TCP Window ограничивая его до 64Kb. `Normal` обычно является лучшим выбором, но, возможно, стоит попробовать отключить эту настройку.

Отключение:

```cmd
netsh int tcp set global autotuninglevel=disabled > nul
netsh int tcp set global chimney=disabled > nul
netsh int tcp set global rss=enabled > nul
netsh int tcp set global rsc=disabled > nul
```

<details><summary>Режим Normal (по-умолчанию):</summary>

```cmd
netsh int tcp set global autotuninglevel=normal > nul
netsh int tcp set global chimney=disabled > nul
netsh int tcp set global rss=enabled > nul
netsh int tcp set global rsc=disabled > nul
```

</details>

---

`ECN Capability` <sup>[[?]](https://docs.microsoft.com/en-us/previous-versions/windows/it-pro/windows-server-2008-R2-and-2008/cc731258(v=ws.10))</sup> – это механизм, который предоставляет маршрутизаторам альтернативный метод сообщения о перегрузке сети. Используется для уменьшения повторных передач пакетов. `ECN` предполагает, что причиной потери пакетов является перегрузка маршрутизатора, что позволяет маршрутизаторам, испытывающим перегрузку, маркировать пакеты, из-за чего клиенты автоматически снижают скорость передачи данных, чтобы избежать дальнейшую потерю пакетов.

Включить `ECN Capability`:

```cmd
netsh int tcp set global ecncapability=enabled > nul
netsh int tcp set global timestamps=disabled > nul
```

<details><summary>Отключить ECN Capability (по-умолчанию):</summary>

```cmd
netsh int tcp set global ecncapability=disabled > nul
netsh int tcp set global timestamps=disabled > nul
```

</details>

Рекомендуется включать только при наличии перегрузки, потери пакетов или при нестабильном подключении.

> :warning: **Не включайте** эту настройку, если вы используете старый маршрутизатор или компьютер.

---

`Retransmit TimeOut (RTO)` <sup>[[?]](https://docs.microsoft.com/en-us/powershell/module/nettcpip/set-nettcpsetting?view=win10-ps)</sup> – сколько времени неподтвержденные пакеты будут бегать по сети, прежде чем соединение будет прервано. В сетях с высокой задержкой это может увеличить количество повторных передач пакетов.

Установить таймаут в `2s`:

```cmd
netsh int tcp set global initialRto=2000 > nul
powershell -Command "Set-NetTCPSetting -SettingName InternetCustom -MinRto 300" > nul
```

<details><summary>Установить таймаут в 3s (по-умолчанию):</summary>

```cmd
netsh int tcp set global initialRto=3000 > nul
powershell -Command "Set-NetTCPSetting -SettingName InternetCustom -MinRto 300" > nul
```

</details>

> :warning: Рекомендуется уменьшить таймаут для современных широкополосных сетей с малой задержкой.

![](https://github.com/denis-g/windows10-latency-optimization/blob/master/images/reboot.png)
