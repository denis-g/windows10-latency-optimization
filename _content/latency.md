[![](https://github.com/denis-g/windows10-latency-optimization/blob/master/images/header_small.png)](https://github.com/denis-g/windows10-latency-optimization#содержание)

---

### :traffic_light: Оптимизация задержек

- [Отключение таймера HPET](https://github.com/denis-g/windows10-latency-optimization/blob/master/_content/latency.md#отключение-таймера-hpet)
- [Включение MSI mode](https://github.com/denis-g/windows10-latency-optimization/blob/master/_content/latency.md#включение-msi-mode)
- [Приоритизация прерываний](https://github.com/denis-g/windows10-latency-optimization/blob/master/_content/latency.md#приоритизация-прерываний)
- [Приоритизация драйверов](https://github.com/denis-g/windows10-latency-optimization/blob/master/_content/latency.md#приоритизация-драйверов)
- [Распараллеливание драйверов по ядрам](https://github.com/denis-g/windows10-latency-optimization/blob/master/_content/latency.md#распараллеливание-драйверов-по-ядрам)

![](https://github.com/denis-g/windows10-latency-optimization/blob/master/images/hr.png)


### Отключение таймера HPET

Основная проблема в Windows с которой нам нужно бороться – это использование таймера `HPET` <sup>[[?]](https://ru.qaz.wiki/wiki/High_Precision_Event_Timer)</sup>, что уже создаёт лишнюю абстракцию, т.к. это является заменой стандартного таймера `RTC` <sup>[[?]](https://ru.wikipedia.org/wiki/Часы_реального_времени)</sup> или того же `HPET` (реализаций много, это не так важно), который уже встроен во все современные материнские платы и является аппаратным. В этом и кроется проблема – Windows всё равно тянет одеяло на себя и использует свой программный таймер, так или иначе.

Изначально идея нового таймера здравая и хорошая – добиться более высокой точности для управления прерываниями <sup>[[?]](https://ru.wikipedia.org/wiki/Прерывание)</sup> для мультимедийных программ, хотя у него и намного больше применений, в том числе он отвечает за счёт времени и многое другое. Но мы бы тут не собрались, если бы он работал так как задумывалось. Проблем таймер создаёт достаточно <sup>[[Проблемы с HPET]](https://ru.qaz.wiki/wiki/High_Precision_Event_Timer#Problems)</sup>. Если вкратце, то значение выдаваемое таймером должно быть строго фиксированным, но в виду своей странной реализации оно имеет плавающее значение и переодически меняется, из-за чего прерывания происходят в разное время, что и вызывает запоздания, а они в свою очередь микрофризы и микролаги, особенно это заметно при использовании игр или высоконагруженных приложений (рендер, обработка фотографий и т.п.).

Некоторые мультимедийные программы, а так же игры могут сами фиксировать данный параметр для увеличения плавности <sup>[[?]](https://randomascii.wordpress.com/2013/07/08/windows-timer-resolution-megawatts-wasted/)</sup>, поэтому мы его сами зафиксируем на минимально возможном значении в `0.5ms`, для всей системы в том числе.

> :bangbang: Ни в коем случае **не отключайте данный таймер в BIOS** – там он должен быть **включён** для корректной работы системы в целом. В новых версиях BIOS подобная настройка включена по-умолчанию и зачастую её изменение не возможно. *Подробную информацию как изменить параметры в BIOS можно найти в руководстве к материнской плате или в интернете.*

Для того чтобы отключить `HPET` в Windows необходимо использовать встроенную утилиту `bcdedit`. Но сперва нам надо убедиться, что таймер в Windows активен:

```cmd
bcdedit /enum
```

![Проверка активности таймера HPET с помощью BCDEdit](https://github.com/denis-g/windows10-latency-optimization/blob/master/screenshots/bcdedit_01.png)

Если у вас нет значений `useplatformtick` и `disabledynamictick` или они установлены как `No`, то первым шагом для нас будет их отключение:

```cmd
bcdedit /set disabledynamictick yes
bcdedit /set useplatformtick yes
```

<details>
<summary>Сброс значений по-умолчанию</summary>

```cmd
bcdedit /set disabledynamictick no > nul
bcdedit /set useplatformtick no > nul
```

</details>

Пример правильного отключения таймера HPET в Windows:

![Пример правильного отключения таймера HPET в Windows с помощью BCDEdit](https://github.com/denis-g/windows10-latency-optimization/blob/master/screenshots/bcdedit_01.png)

![](https://github.com/denis-g/windows10-latency-optimization/blob/master/images/reboot.png)

---

Теперь, отключив таймер в Windows, нам надо зафиксировать его в значении `0.5ms` –  для этого необходимо использовать утилиту `Intelligent Standby List Cleaner` <sup>[[скачать]](https://github.com/denis-g/windows10-latency-optimization/blob/master/_content/links.md#утилиты-используемые-в-гайде)</sup>. Здесь можно увидеть, что значение нашего таймера `Current timer resolution` постоянно изменяется, что не есть хорошо и именно это нам надо исправлять.

Пример не настроенного таймера в `Intelligent Standby List Cleaner`:

![Пример не настроенного таймера в Intelligent Standby List Cleaner](https://github.com/denis-g/windows10-latency-optimization/blob/master/screenshots/islc_01.png)

Для правильной настройки необходимо установить следующие параметры:

- `Start ISCL minimized and auto-Start monitoring` включено
- `Launch ISCL on user logon (TaskSheduler)` включено
- `Enable custom timer resolution` включено
- `Wanted timer resolution` установлено в `0.50`

Так же здесь можно настроить очищение системного кэша памяти. Для этого необходимо изменить параметр `Free memory is lower than`, который отвечает за минимальное значение свободной памяти – оптимальным значением является размер вашей памяти разделённый на 2, после достижения которого кэш памяти будет очищен. Параметр `The list size is at least` отвечает за минимальный размер кэшированный памяти и его рекомендуется оставлять дефолтным равным `1024 Mb`.

<details>
<summary>Если лень считать</summary>

```
(4 Gb)  4096  /2 = 2048
(8 Gb)  8192  /2 = 4096
(16 Gb) 16384 /2 = 8192
(24 Gb) 24576 /2 = 12288
(32 Gb) 32768 /2 = 16384
```

</details>

> :warning: Во избежание дополнительных микрофризов при очищении кэша памяти, если у вас её мало или же её очень активно используют программы, данную настройку лучше протестировать с разными параметрами и найти оптимальную для вашего сценария использования.

После настройки надо нажать `Start` и проверить зафиксирован ли таймер – значение `Current timer resolution` **должно быть строго равно `0.5ms`** и не изменяться. Значение может обновится с задержкой!

Пример правильной настройки `Intelligent Standby List Cleaner`:

![Пример правильной настройки Intelligent Standby List Cleaner](https://github.com/denis-g/windows10-latency-optimization/blob/master/screenshots/islc_02.png)

![](https://github.com/denis-g/windows10-latency-optimization/blob/master/images/reboot.png)

![](https://github.com/denis-g/windows10-latency-optimization/blob/master/images/hr.png)

### Включение MSI mode

> :bulb: Для дальнейшей настройки необходимо ознакомиться c
[Определение IRQ](https://github.com/denis-g/windows10-latency-optimization/blob/master/_content/_detect-irq.md),
[Определение USB Host Controller](https://github.com/denis-g/windows10-latency-optimization/blob/master/_content/_detect-uhc.md).

А зачем нам ещё включать какой-то `MSI mode` <sup>[[?]](https://ru.wikipedia.org/wiki/Message_Signaled_Interrupts)</sup>? Всё очень просто, если раньше на одно устройство выделялось всего 4 прерывания <sup>[[Страдания по IRQ]](https://faqhard.ru/articles/13/08.php)</sup>, то с помощью `MSI` стало возможным увеличить их до 32, что значительно ускоряет общение между устройствами.

Почти все последние драйверы, от нормальных производителей, используют изначально режим прерывания `MSI`, тем более это обязательное условие для `PCI Express` железок. Но для ускорения всей системы так же не лишним будет включение `MSI` и для `USB Host Controller`.

Для включения `MSI mode` мы будем использовать утилиту `MSI Util v2` <sup>[[скачать]](https://github.com/denis-g/windows10-latency-optimization/blob/master/_content/links.md#утилиты-используемые-в-гайде)</sup>. Ищем здесь нашу видеокарту и `USB Host Controller` (если по названию не получается найти, то в строке с именем так же указан `Device ID`). Ставим галочку в столбце `MSI`, так же меняем `Interrupt priority` на `Hight`, после чего жмём кнопку `Apply`.

Пример настройки `MSI` с помощью `MSI Util v2`:

![Пример настройки MSI с помощью MSI Util v2](https://github.com/denis-g/windows10-latency-optimization/blob/master/screenshots/msiutilv2_01.png)

> :bangbang: **Нельзя** устанавливать использование `MSI mode` для всех ваших устройств, иначе устройства могут работать не корректно. 

![](https://github.com/denis-g/windows10-latency-optimization/blob/master/images/reboot.png)

![](https://github.com/denis-g/windows10-latency-optimization/blob/master/images/hr.png)

### Приоритизация прерываний

> :bulb: Для дальнейшей настройки необходимо ознакомиться c
[Работа с реестром](https://github.com/denis-g/windows10-latency-optimization/blob/master/_content/_howto-regedit.md),
[Определение IRQ](https://github.com/denis-g/windows10-latency-optimization/blob/master/_content/_detect-irq.md).

Продолжая тему прерываний, далее нам необходимо настроить приоритет прерываний для конкретно заданных устройств – этим в Windows занимается `IRQL` <sup>[[?]](https://ru.wikipedia.org/wiki/IRQL)</sup>. Проблема приоритизации всегда имеет место быть, т.к. каждое устройство считает себя важней остальных и это порождает некоторые проблемы <sup>[[Проблемы IRQL]](https://ru.wikipedia.org/wiki/IRQL#Соблюдение_системных_соглашений)</sup>.

```reg
Windows Registry Editor Version 5.00

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\PriorityControl]
; видеокарта
"IRQ***Priority"=dword:00000001 ; none
; USB Host Controller
"IRQ***Priority"=dword:00000002 ; none
```

<details><summary>Значения по-умолчанию:</summary>

```reg
Windows Registry Editor Version 5.00

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\PriorityControl]
"IRQ***Priority"=-
"IRQ***Priority"=-
```

</details>

В качестве имени параметра мы используем `IRQ***Priority`, где `***` надо заменить на IRQ (несколько цифр) нашей видеокарты и `USB Host Controller`.

> :sparkles: Для видеокарты рекомендуется ставить значение равным `1`, для `USB Host Controller` – значение `2` <sup>[[Приоритеты IRQ]](https://ru.wikipedia.org/wiki/IRQL)</sup>.

![](https://github.com/denis-g/windows10-latency-optimization/blob/master/images/reboot.png)

![](https://github.com/denis-g/windows10-latency-optimization/blob/master/images/hr.png)

### Приоритизация драйверов

> :bulb: Для дальнейшей настройки необходимо ознакомиться c
[Работа с реестром](https://github.com/denis-g/windows10-latency-optimization/blob/master/_content/_howto-regedit.md).

Следующим шагом после настройки приоритетов `IRQL` <sup>[[?]](https://ru.wikipedia.org/wiki/IRQL)</sup> необходимо указать приоритет для каких сервисов (в нашем случае драйверов) необходимо выполнять прерывания в первую очередь. Когда происходит прерывание, Windows, используя `IRQL` для определения приоритета прерывания, проверяет может ли прерывание обслуживаться в данный момент или нет, если условие выполняется, то приоритет потока начинает его выполнение. Всё что ниже по приоритету – ставиться в очередь. Таким образом мы зафиксируем критически важные сервисы, прерывания от которых необходимо обрабатывать в первую очередь.

```reg
Windows Registry Editor Version 5.00

; DirectX Graphics Kernel
[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\DXGKrnl\Parameters]
"ThreadPriority"=dword:0000000f

; драйвер видеокарты nVidia
[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\nvlddmkm\Parameters]
"ThreadPriority"=dword:0000001f

; USB3 HUB Driver
[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\USBHUB3\Parameters]
"ThreadPriority"=dword:0000000f

; USB xHCI Compliant Host Controller
[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\USBXHCI\Parameters]
"ThreadPriority"=dword:0000000f
```

<details><summary>Значения по-умолчанию:</summary>

```reg
Windows Registry Editor Version 5.00

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\DXGKrnl\Parameters]
"ThreadPriority"=-

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\nvlddmkm\Parameters]
"ThreadPriority"=-

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\USBHUB3\Parameters]
"ThreadPriority"=-

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\USBXHCI\Parameters]
"ThreadPriority"=-
```

</details>

 > :sparkles: В качестве параметра установите значения равным 15 (`f`) (что соответсвует `Hight`), если система работает стабильно, то можно повысить приоритет установив параметр равным 31 (`1f`) (что соответсвует `Realtime`) <sup>[[Процессы и потоки в Windows]](https://www.microsoftpressstore.com/articles/article.aspx?p=2233328&seqNum=7)</sup> для `nvlddmkm`.

![](https://github.com/denis-g/windows10-latency-optimization/blob/master/images/reboot.png)

![](https://github.com/denis-g/windows10-latency-optimization/blob/master/images/hr.png)

### Распараллеливание драйверов по ядрам

> :bulb: Для дальнейшей настройки необходимо ознакомиться c
[Определение IRQ](https://github.com/denis-g/windows10-latency-optimization/blob/master/_content/_detect-irq.md),
[Определение USB Host Controller](https://github.com/denis-g/windows10-latency-optimization/blob/master/_content/_detect-uhc.md).

Самое сложное осталось позади и теперь мы будет освобождать первое ядро, куда Windows зачем-то добавляет почти все драйверы. Этим мы с одной стороны разгрузим ядро, а с другой так же уменьшим задержки.

Для этого нам понадобиться утилита `Interrupt Affinity Policy Tool` <sup>[[скачать]](https://github.com/denis-g/windows10-latency-optimization/blob/master/_content/links.md#утилиты-используемые-в-гайде)</sup>.

> :sparkles: При использовании утилиты будут переодически появляться сообщения об ошибке – их можно спокойно игнорировать, т.к. программа давно не обновлялась и на работу программы они никак не влияют.
> 
> ![Сообщение об ошибке в утилите Interrupt Affinity Policy Tool](https://github.com/denis-g/windows10-latency-optimization/blob/master/screenshots/interruptaffinitypolicytool_01.png)

Пример списка устройств в утилите `Interrupt Affinity Policy Tool`:

![Пример списка устройств в утилите Interrupt Affinity Policy Tool](https://github.com/denis-g/windows10-latency-optimization/blob/master/screenshots/interruptaffinitypolicytool_02.png)

В этом списке надо найти свою видеокарту и `USB Host Controller` (название может не соответствовать, поэтому искать лучше по полю `Location Info`), нажать `Set Mask` и выбрать ядро на которое будет назначен драйвер. **Выбирать надо на любое ядро отличное от первого**.

![Пример установки ядра для драйвера устройства в утилите Interrupt Affinity Policy Tool](https://github.com/denis-g/windows10-latency-optimization/blob/master/screenshots/interruptaffinitypolicytool_03.png)

> :warning: На CPU, где включен `Hyper-Threading` <sup>[[?]](https://ru.wikipedia.org/wiki/Hyper-threading)</sup> / `SMT` <sup>[[?]](https://ru.wikipedia.org/wiki/Simultaneous_multithreading)</sup>, ядра и потоки в программе чередуются – `CPU 0` - Ядро 1, `CPU 1` - Поток 1, `CPU 2` - Ядро 2, `CPU 3` - Поток 2 и т.д., соответственно, чтобы выбрать третье ядро надо указать `CPU 4` и `CPU 5`. На CPU без `Hyper-Threading`/`SMT` ядра, само собой, указаны без потоков.

![Сообщение о перезагрузке драйвера в утилите Interrupt Affinity Policy Tool](https://github.com/denis-g/windows10-latency-optimization/blob/master/screenshots/interruptaffinitypolicytool_04.png)

После выбора ядра появится сообщение о том, что можно перезагрузить драйвер – нажимаем `Yes`. В зависимости от устройства может моргнуть экран или произойти переопределение устройств – это нормально, после этого утилита сообщит, что всё прошло успешно.

> :bangbang: **Нельзя** переносить все драйверы на другие ядра, этим вы лишь можете добиться появления `BSOD` <sup>[[?]](https://ru.wikipedia.org/wiki/Синий_экран_смерти)</sup>!

![](https://github.com/denis-g/windows10-latency-optimization/blob/master/images/reboot.png)
