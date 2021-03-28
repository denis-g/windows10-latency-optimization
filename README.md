![Windows 10 Latency Optimization](https://github.com/denis-g/windows10-latency-optimization/blob/master/images/header_main.png)

Да-да, это очередной гайд по настройке Windows. Здесь не будет настроек, которые относятся к внешнему виду и прочей мишуры. Это так же не является каким-то ультимативным гайдом, но здесь я попытался собрать именно те твики и настройки, которые работают. Здесь нет бессмысленного переписывания не нужных и старых твиков – в основном это попытка собрать оптимизации, которые служат для уменьшения задержек, инпут-лага и троттлинга путём отключение таймера `HPET` в Windows, настройки и приоритизации прерываний устройств и их драйверов, а так же отключение энергосберегающих функций. Благодаря этим настройкам система становится более отзывчивой, пропадают фризы и микролаги в Windows и ресурсоёмких приложениях, а так же увеличивается плавность в играх. Кроме этого данный гайд так же может решить проблемы с задержками при движении мыши, заиканием звука при использовании других устройств и прочие неприятности связанные с задержками между устройствами.

![](https://github.com/denis-g/windows10-latency-optimization/blob/master/images/hr.png)

## Содержание

### :mortar_board: [Перед тем как начать](https://github.com/denis-g/windows10-latency-optimization/blob/master/_content/main.md#readme)

- [Вступление](https://github.com/denis-g/windows10-latency-optimization/blob/master/_content/main.md#вступление)
- [На какой версии Windows это работает?](https://github.com/denis-g/windows10-latency-optimization/blob/master/_content/main.md#на-какой-версии-windows-это-работает)
- [Я готов, что дальше?](https://github.com/denis-g/windows10-latency-optimization/blob/master/_content/main.md#я-готов-что-дальше)
- [Как всё не сломать или вернуть как было](https://github.com/denis-g/windows10-latency-optimization/blob/master/_content/main.md#как-всё-не-сломать-или-вернуть-как-было)
- [А можно всё это настроить одной кнопкой?](https://github.com/denis-g/windows10-latency-optimization/blob/master/_content/main.md#а-можно-всё-это-настроить-одной-кнопкой)

### :electric_plug: [Драйверы и системные библиотеки](https://github.com/denis-g/windows10-latency-optimization/blob/master/_content/drivers-libs.md#readme)

- [Драйверы](https://github.com/denis-g/windows10-latency-optimization/blob/master/_content/drivers-libs.md#драйверы)
- [Системные библиотеки](https://github.com/denis-g/windows10-latency-optimization/blob/master/_content/drivers-libs.md#системные-библиотеки)

### :traffic_light: [Оптимизация задержек](https://github.com/denis-g/windows10-latency-optimization/blob/master/_content/latency.md#readme)

- [Отключение таймера HPET](https://github.com/denis-g/windows10-latency-optimization/blob/master/_content/latency.md#отключение-таймера-hpet)
- [Включение MSI mode](https://github.com/denis-g/windows10-latency-optimization/blob/master/_content/latency.md#включение-msi-mode)
- [Приоритизация прерываний](https://github.com/denis-g/windows10-latency-optimization/blob/master/_content/latency.md#приоритизация-прерываний)
- [Приоритизация драйверов](https://github.com/denis-g/windows10-latency-optimization/blob/master/_content/latency.md#приоритизация-драйверов)
- [Распараллеливание драйверов по ядрам](https://github.com/denis-g/windows10-latency-optimization/blob/master/_content/latency.md#распараллеливание-драйверов-по-ядрам)

### :hammer: [Оптимизация Windows](https://github.com/denis-g/windows10-latency-optimization/blob/master/_content/windows.md#readme)

- [Настройка схемы электропитания](https://github.com/denis-g/windows10-latency-optimization/blob/master/_content/windows.md#настройка-схемы-электропитания)
- [Настройки системных устройств](https://github.com/denis-g/windows10-latency-optimization/blob/master/_content/windows.md#настройки-системных-устройств)
- [Настройка Windows](https://github.com/denis-g/windows10-latency-optimization/blob/master/_content/windows.md#настройка-windows)

### :nut_and_bolt: [Настройки устройств](https://github.com/denis-g/windows10-latency-optimization/blob/master/_content/devices.md#readme)

- [Настройка мыши](https://github.com/denis-g/windows10-latency-optimization/blob/master/_content/devices.md#настройка-мыши)
- [Настройка видеокарты](https://github.com/denis-g/windows10-latency-optimization/blob/master/_content/devices.md#настройка-видеокарты)

### :suspect: [Настройки для игр](https://github.com/denis-g/windows10-latency-optimization/blob/master/_content/games.md#readme)

- [Отключение GameBar, GameDVR](https://github.com/denis-g/windows10-latency-optimization/blob/master/_content/games.md#отключение-gamebar-gamedvr)
- [Настройки игр](https://github.com/denis-g/windows10-latency-optimization/blob/master/_content/games.md#настройки-игр)
- [Настройки лаунчеров](https://github.com/denis-g/windows10-latency-optimization/blob/master/_content/games.md#настройки-лаунчеров)
- [Настройка Oculus VR](https://github.com/denis-g/windows10-latency-optimization/blob/master/_content/games.md#настройка-oculus-vr)

### :dart: [Дополнительные настройки](https://github.com/denis-g/windows10-latency-optimization/blob/master/_content/additional.md#readme)

- [Оптимизация загрузки](https://github.com/denis-g/windows10-latency-optimization/blob/master/_content/additional.md#оптимизация-загрузки)
- [Настройка аудио](https://github.com/denis-g/windows10-latency-optimization/blob/master/_content/additional.md#настройка-аудио)

### :memo: Прочее

- [Экспериментальные твики](https://github.com/denis-g/windows10-latency-optimization/blob/master/_content/tweaks-experimental.md#readme)
- [Плохие твики](https://github.com/denis-g/windows10-latency-optimization/blob/master/_content/tweaks-bad.md#readme)

### :link: [Ссылки](https://github.com/denis-g/windows10-latency-optimization/blob/master/_content/links.md#readme)

- [Утилиты используемые в гайде](https://github.com/denis-g/windows10-latency-optimization/blob/master/_content/links.md#утилиты-используемые-в-гайде)
- [Полезные ссылки и референсы](https://github.com/denis-g/windows10-latency-optimization/blob/master/_content/links.md#полезные-ссылки-и-референсы)

### :crystal_ball: [Тесты и выводы](https://github.com/denis-g/windows10-latency-optimization/blob/master/_content/finish.md#readme)

![](https://github.com/denis-g/windows10-latency-optimization/blob/master/images/hr.png)

:sparkles: Если у вас есть конкретные рекомендации как улучшить или изменить данный гайд или какие-то предложения и пожелания, то можете написать обо всём в [**Обcуждениях**](https://github.com/denis-g/windows10-latency-optimization/discussions/).
