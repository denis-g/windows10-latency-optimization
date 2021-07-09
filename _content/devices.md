[![](https://github.com/denis-g/windows10-latency-optimization/blob/master/images/header_small.png)](https://github.com/denis-g/windows10-latency-optimization#содержание)

---

### :nut_and_bolt: Настройки устройств

- [Настройка мыши и клавиатуры](https://github.com/denis-g/windows10-latency-optimization/blob/master/_content/devices.md#настройка-мыши-и-клавиатуры)
- [Настройка видеокарты](https://github.com/denis-g/windows10-latency-optimization/blob/master/_content/devices.md#настройка-видеокарты)

![](https://github.com/denis-g/windows10-latency-optimization/blob/master/images/hr.png)

### Настройка мыши и клавиатуры

> :bulb: Для дальнейшей настройки необходимо ознакомиться c
[Работа с реестром](https://github.com/denis-g/windows10-latency-optimization/blob/master/_content/_howto-regedit.md).

```reg
Windows Registry Editor Version 5.00

[HKEY_CURRENT_USER\Control Panel\Mouse]
"MouseSpeed"="0"
"MouseThreshold1"="0"
"MouseThreshold2"="0"
```

<details><summary>Значения по-умолчанию:</summary>

```reg
Windows Registry Editor Version 5.00

[HKEY_CURRENT_USER\Control Panel\Mouse]
"MouseSpeed"="1"
"MouseThreshold1"="6"
"MouseThreshold2"="10"
```

</details>

Эти параметры отключают опцию `Повысить точность указателя` – его функция состоит в том, что когда физическая скорость мыши увеличивается, то и скорость указателя так же увеличивается. Зачем это нужно? Возможно, при обычном использовании это имеет смысл, но для игр подобное поведение вносит больше проблем с позиционированием курсора. **Рекомендуется всегда отключать** данный параметр.

---

В Windows 10 есть древнейший баг <sup>[[?]](https://donewmouseaccel.blogspot.com/2010/03/markc-windows-7-mouse-acceleration-fix.html)</sup>, когда разница между физическим перемещением мыши и перемещением курсора на экране так же зависит от того включена ли у вас опция `Масштабирование экрана`.

Чтобы исправить это поведение, помогает только отключение этой функции, но мы также может немного улучшить ситуацию изменив параметры `SmoothMouseXCurve` и `SmoothMouseYCurve`, которые отвечает за ускорение мыши по горизонтали и вертикали соответственно. Далее будут представлены настройки для разных значений масштабирования.

<details><summary>Масштабирование 100%:</summary>

```reg
Windows Registry Editor Version 5.00

[HKEY_CURRENT_USER\Control Panel\Mouse]
"SmoothMouseXCurve"=hex:\
  00,00,00,00,00,00,00,00,\
  C0,CC,0C,00,00,00,00,00,\
  80,99,19,00,00,00,00,00,\
  40,66,26,00,00,00,00,00,\
  00,33,33,00,00,00,00,00
"SmoothMouseYCurve"=hex:\
  00,00,00,00,00,00,00,00,\
  00,00,38,00,00,00,00,00,\
  00,00,70,00,00,00,00,00,\
  00,00,A8,00,00,00,00,00,\
  00,00,E0,00,00,00,00,00
```

</details>

<details><summary>Масштабирование 125%:</summary>

```reg
Windows Registry Editor Version 5.00

[HKEY_CURRENT_USER\Control Panel\Mouse]
"SmoothMouseXCurve"=hex:\
  00,00,00,00,00,00,00,00,\
  00,00,10,00,00,00,00,00,\
  00,00,20,00,00,00,00,00,\
  00,00,30,00,00,00,00,00,\
  00,00,40,00,00,00,00,00
"SmoothMouseYCurve"=hex:\
  00,00,00,00,00,00,00,00,\
  00,00,38,00,00,00,00,00,\
  00,00,70,00,00,00,00,00,\
  00,00,A8,00,00,00,00,00,\
  00,00,E0,00,00,00,00,00
 ```

</details>

<details><summary>Масштабирование 150%:</summary>

```reg
Windows Registry Editor Version 5.00

[HKEY_CURRENT_USER\Control Panel\Mouse]
"SmoothMouseXCurve"=hex:\
  00,00,00,00,00,00,00,00,\
  30,33,13,00,00,00,00,00,\
  60,66,26,00,00,00,00,00,\
  90,99,39,00,00,00,00,00,\
  C0,CC,4C,00,00,00,00,00
"SmoothMouseYCurve"=hex:\
  00,00,00,00,00,00,00,00,\
  00,00,38,00,00,00,00,00,\
  00,00,70,00,00,00,00,00,\
  00,00,A8,00,00,00,00,00,\
  00,00,E0,00,00,00,00,00
 ```

</details>

<details><summary>Масштабирование 175%:</summary>

```reg
Windows Registry Editor Version 5.00

[HKEY_CURRENT_USER\Control Panel\Mouse]
"SmoothMouseXCurve"=hex:\
  00,00,00,00,00,00,00,00,\
  60,66,16,00,00,00,00,00,\
  C0,CC,2C,00,00,00,00,00,\
  20,33,43,00,00,00,00,00,\
  80,99,59,00,00,00,00,00
"SmoothMouseYCurve"=hex:\
  00,00,00,00,00,00,00,00,\
  00,00,38,00,00,00,00,00,\
  00,00,70,00,00,00,00,00,\
  00,00,A8,00,00,00,00,00,\
  00,00,E0,00,00,00,00,00
 ```

</details>

<details><summary>Масштабирование 200%:</summary>

```reg
Windows Registry Editor Version 5.00

[HKEY_CURRENT_USER\Control Panel\Mouse]
"SmoothMouseXCurve"=hex:\
  00,00,00,00,00,00,00,00,\
  90,99,19,00,00,00,00,00,\
  20,33,33,00,00,00,00,00,\
  B0,CC,4C,00,00,00,00,00,\
  40,66,66,00,00,00,00,00
"SmoothMouseYCurve"=hex:\
  00,00,00,00,00,00,00,00,\
  00,00,38,00,00,00,00,00,\
  00,00,70,00,00,00,00,00,\
  00,00,A8,00,00,00,00,00,\
  00,00,E0,00,00,00,00,00
 ```

</details>

<details><summary>Масштабирование 225%:</summary>

```reg
Windows Registry Editor Version 5.00

[HKEY_CURRENT_USER\Control Panel\Mouse]
"SmoothMouseXCurve"=hex:\
  00,00,00,00,00,00,00,00,\
  C0,CC,1C,00,00,00,00,00,\
  80,99,39,00,00,00,00,00,\
  40,66,56,00,00,00,00,00,\
  00,33,73,00,00,00,00,00
"SmoothMouseYCurve"=hex:\
  00,00,00,00,00,00,00,00,\
  00,00,38,00,00,00,00,00,\
  00,00,70,00,00,00,00,00,\
  00,00,A8,00,00,00,00,00,\
  00,00,E0,00,00,00,00,00
 ```

</details>

<details><summary>Масштабирование 250%:</summary>

```reg
Windows Registry Editor Version 5.00

[HKEY_CURRENT_USER\Control Panel\Mouse]
"SmoothMouseXCurve"=hex:\
  00,00,00,00,00,00,00,00,\
  00,00,20,00,00,00,00,00,\
  00,00,40,00,00,00,00,00,\
  00,00,60,00,00,00,00,00,\
  00,00,80,00,00,00,00,00
"SmoothMouseYCurve"=hex:\
  00,00,00,00,00,00,00,00,\
  00,00,38,00,00,00,00,00,\
  00,00,70,00,00,00,00,00,\
  00,00,A8,00,00,00,00,00,\
  00,00,E0,00,00,00,00,00
 ```

</details>

<details><summary>Масштабирование 300%:</summary>

```reg
Windows Registry Editor Version 5.00

[HKEY_CURRENT_USER\Control Panel\Mouse]
"SmoothMouseXCurve"=hex:\
  00,00,00,00,00,00,00,00,\
  60,66,26,00,00,00,00,00,\
  C0,CC,4C,00,00,00,00,00,\
  20,33,73,00,00,00,00,00,\
  80,99,99,00,00,00,00,00
"SmoothMouseYCurve"=hex:\
  00,00,00,00,00,00,00,00,\
  00,00,38,00,00,00,00,00,\
  00,00,70,00,00,00,00,00,\
  00,00,A8,00,00,00,00,00,\
  00,00,E0,00,00,00,00,00
 ```

</details>

<details><summary>Масштабирование 350%:</summary>

```reg
Windows Registry Editor Version 5.00

[HKEY_CURRENT_USER\Control Panel\Mouse]
"SmoothMouseXCurve"=hex:\
  00,00,00,00,00,00,00,00,\
  C0,CC,2C,00,00,00,00,00,\
  80,99,59,00,00,00,00,00,\
  40,66,86,00,00,00,00,00,\
  00,33,B3,00,00,00,00,00
"SmoothMouseYCurve"=hex:\
  00,00,00,00,00,00,00,00,\
  00,00,38,00,00,00,00,00,\
  00,00,70,00,00,00,00,00,\
  00,00,A8,00,00,00,00,00,\
  00,00,E0,00,00,00,00,00
 ```

</details>

<details><summary>Значения по-умолчанию</summary>

```reg
Windows Registry Editor Version 5.00

[HKEY_CURRENT_USER\Control Panel\Mouse]
"SmoothMouseXCurve"=hex:\
  00,00,00,00,00,00,00,00,\
  15,6e,00,00,00,00,00,00,\
  00,40,01,00,00,00,00,00,\
  29,dc,03,00,00,00,00,00,\
  00,00,28,00,00,00,00,00
"SmoothMouseYCurve"=hex:\
  00,00,00,00,00,00,00,00,\
  fd,11,01,00,00,00,00,00,\
  00,24,04,00,00,00,00,00,\
  00,fc,12,00,00,00,00,00,\
  00,c0,bb,01,00,00,00,00
```

</details>

---

```reg
Windows Registry Editor Version 5.00

[HKEY_CURRENT_USER\Control Panel\Mouse]
"MouseSensitivity"="10"
```

<details><summary>Значения по-умолчанию:</summary>

```reg
Windows Registry Editor Version 5.00

[HKEY_CURRENT_USER\Control Panel\Mouse]
"MouseSensitivity"="10"
```

</details>

Данный параметр отвечает за скорость перемещения курсора, его **не рекомендуется изменять**, т.к. он него зависят все параметры для расчёта движения мыши. Поэтому он **всегда должен быть равен `10`**, что соответствует среднему значению.

Пример правильной настройки мыши:

![Пример правильной настройки мыши](https://github.com/denis-g/windows10-latency-optimization/blob/master/screenshots/mousesettings_01.png)

---

Для того чтобы проверить чувствительность (`sensitivity`) мыши можно использовать утилиту `Mouse Movement Recorder` <sup>[[скачать]](https://github.com/denis-g/windows10-latency-optimization/blob/master/_content/links.md#утилиты-используемые-в-гайде)</sup>, где при движении мыши будут изменяться следующие параметры:

- `Mouse Movement` – отображает физическое смещение мыши
- `Pointer Movement` – отображает смещение курсора
- `EnPtPr` – включена или отключена опция `Повысить точность указателя`

![Пример работы Mouse Movement Recorder](https://github.com/denis-g/windows10-latency-optimization/blob/master/screenshots/mousemovementrecorder_01.png)

Значения `Mouse Movement` и `Pointer Movement` **должны совпадать**.

Пример правильной настройки мыши и работы `Mouse Movement Recorder`:

![Пример правильной настройки мыши и работы Mouse Movement Recorder](https://github.com/denis-g/windows10-latency-optimization/blob/master/screenshots/mousemovementrecorder_02.png)

---

```reg
Windows Registry Editor Version 5.00

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\mouclass\Parameters]
"MouseDataQueueSize"=dword:00000014

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\kbdclass\Parameters]
"KeyboardDataQueueSize"=dword:00000014
```

<details><summary>Значения по-умолчанию:</summary>

```reg
Windows Registry Editor Version 5.00

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\mouclass\Parameters]
"MouseDataQueueSize"=-

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\kbdclass\Parameters]
"KeyboardDataQueueSize"=-
```

</details>

Параметры `MouseDataQueueSize` и `KeyboardDataQueueSize` задают количество событий, которые хранятся в буфере драйвера мыши и клавиатуры. Он также используется при вычислении размера внутреннего буфера драйвера – чем меньше значение, тем быстрей новая информация будет обрабатываться. В нашем случае это оптимальные `20` событий.

---

```reg
Windows Registry Editor Version 5.00

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\mouclass\Parameters]
"ThreadPriority"=dword:0000001f

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\kbdclass\Parameters]
"ThreadPriority"=dword:0000001f
```

<details><summary>Значения по-умолчанию:</summary>

```reg
Windows Registry Editor Version 5.00

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\mouclass\Parameters]
"ThreadPriority"=-

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\kbdclass\Parameters]
"ThreadPriority"=-
```

</details>

Этим параметром мы установим приоритет для наших драйверов мыши и клавиатуры в `Realtime` <sup>[[Процессы и потоки в Windows]](https://www.microsoftpressstore.com/articles/article.aspx?p=2233328&seqNum=7)</sup>.

---

```reg
Windows Registry Editor Version 5.00

[HKEY_CURRENT_USER\Control Panel\Accessibility]
"StickyKeys"="506"

[HKEY_CURRENT_USER\Control Panel\Accessibility\ToggleKeys]
"Flags"="58"

[HKEY_CURRENT_USER\Control Panel\Accessibility\Keyboard Response]
"DelayBeforeAcceptance"="0"
"AutoRepeatRate"="0"
"AutoRepeatDelay"="0"
"Flags"="122"
```

<details><summary>Значения по-умолчанию:</summary>

```reg
Windows Registry Editor Version 5.00

[HKEY_CURRENT_USER\Control Panel\Accessibility]
"StickyKeys"="510"

[HKEY_CURRENT_USER\Control Panel\Accessibility\ToggleKeys]
"Flags"="62"

[HKEY_CURRENT_USER\Control Panel\Accessibility\Keyboard Response]
"DelayBeforeAcceptance"="1000"
"AutoRepeatRate"="500"
"AutoRepeatDelay"="1000"
"Flags"="126"
```

</details>

Эти параметры отключают из категории "Специальные возможности" надоедливую функцию залипания клавиш при многократном нажатии Shift, а так же задержку при вводе символов.


![](https://github.com/denis-g/windows10-latency-optimization/blob/master/images/reboot.png)

![](https://github.com/denis-g/windows10-latency-optimization/blob/master/images/hr.png)

### Настройка видеокарты

> :bulb: Для дальнейшей настройки необходимо ознакомиться c
[Работа с реестром](https://github.com/denis-g/windows10-latency-optimization/blob/master/_content/_howto-regedit.md).

```reg
Windows Registry Editor Version 5.00

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers]
"HwSchMode"=dword:00000002
```

<details><summary>Значения по-умолчанию:</summary>

```reg
Windows Registry Editor Version 5.00

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers]
"HwSchMode"=-
```

</details>

Параметр `HwSchMode` отвечает за оптимизацию выполнения вычислительных операций на аппаратном уровне за счет оптимизированного планирования операций (`Hardware Accelerated GPU Scheduling`), что в целом положительно влияет на снижение задержек <sup>[[?]](https://3dnews.ru/1014265)</sup> на младших видеокартах.

> :bangbang: Данная настройка доступна **только** начиная с Windows 10 2004 и **только** с драйверами nVidia начиная с 451.48 <sup>[[?]](https://ru.wikipedia.org/wiki/Windows_Display_Driver_Model#WDDM_2.7)</sup>.

### nVidia Control Panel

Большинство настроек здесь индивидуальны и зависят от конкретно вашей видеокарты и всей системы в частности. Но всё же есть несколько параметров, которые **желательно применить** для уменьшения инпут-лага.

Пример настройки `nVidia Control Panel`:

![Пример настройки nVidia Control Panel](https://github.com/denis-g/windows10-latency-optimization/blob/master/screenshots/nvidiacontrolpanel_01.png)

- `CUDA - графические процессоры` – `Все`
- `Режим низкой задержки` – `Ультра`
- `Режим управления электропитанием` – `Максимальная производительность`

---

Если вы играете **только** в нативном расширении, то рекомендуется отключить масштабирование изображения - `Не выполнять масштабирование`, в противном случае установить `Во весь экран`. Так же здесь необходимо выставить `Выполнять масштабирование на` - `Дисплей`, если ваш монитор это поддерживает, и поставить галку в `Замещение режима масштабирования, заданного для игр и программ`. Это значительно облегчит жизнь видеокарте и масштабирование будет происходить исключительно с помощью монитора.

Отключение масштабирования в `nVidia Control Panel`:

![Отключение масшабирования в nVidia Control Panel](https://github.com/denis-g/windows10-latency-optimization/blob/master/screenshots/nvidiacontrolpanel_02.png)

---

### NVIDIA Profile Inspector

Для более детального редактирования основных и скрытых параметров драйвера nVidia есть замечательная утилита - `NVIDIA Profile Inspector` <sup>[[скачать]](https://github.com/denis-g/windows10-latency-optimization/blob/master/_content/links.md#утилиты-используемые-в-гайде)</sup>. Так же её можно использовать для импорта и экспорта профилей для приложений, чего очень не хватает в `nVidia Control Panel`. Но для нас она интересна в первую очередь именно для редактирования скрытых параметров.

В своё время nVidia добавила в драйверы довольно интересный параметр `CUDA - Force P2 State` <sup>[[?]](https://ru.wikipedia.org/wiki/CUDA)</sup> <sup>[[?]](https://docs.nvidia.com/gameworks/content/gameworkslibrary/coresdk/nvapi/group__gpupstate.html#details)</sup>. Его основная проблема заключается в том, что частота GPU соответсвует состоянию производительности `P0`, а вот для микросхем памяти они работают на сниженной частоте в состоянии `P2`, что уменьшает производительность при вычислениях CUDA <sup>[[?]](https://babeltechreviews.com/nvidia-cuda-force-p2-state/)</sup> и вовсе не помогает при разгоне памяти видеокарты.

Для решения этой проблемы надо в `NVIDIA Profile Inspector` выбрать дефолтный или профиль вашей игры, найти в списке `CUDA - Force P2 State` и установить значение в `Off`, после чего нажать `Apply Changes`.

Пример настройки `NVIDIA Profile Inspector`:

![Пример настройки NVIDIA Profile Inspector](https://github.com/denis-g/windows10-latency-optimization/blob/master/screenshots/nvidiaprofileinspector_01.png)

> :bangbang: Данную настройку рекомендуется тестировать в конкретных играх, т.к. разные игры показывают как улучшения так и ухудшения фреймтайма.

> :warning: Данная настройка сбрасывается на дефолтное значение после обновления драйвера nVidia!
