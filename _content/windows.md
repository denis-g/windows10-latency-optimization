[![](https://github.com/denis-g/windows10-latency-optimization/blob/master/images/header_small.png)](https://github.com/denis-g/windows10-latency-optimization#содержание)

---

### :hammer: Оптимизация Windows

- [Настройка схемы электропитания](https://github.com/denis-g/windows10-latency-optimization/blob/master/_content/windows.md#настройка-схемы-электропитания)
- [Настройки системных устройств](https://github.com/denis-g/windows10-latency-optimization/blob/master/_content/windows.md#настройки-системных-устройств)
- [Настройка Windows](https://github.com/denis-g/windows10-latency-optimization/blob/master/_content/windows.md#настройка-windows)

![](https://github.com/denis-g/windows10-latency-optimization/blob/master/images/hr.png)

### Настройка схемы электропитания

Данная настройка так же значительно увеличивает производительность путём отключения всех энергосберегающих функций и использование устройств на максимум, главным образом CPU. В виду универсальности Windows текущие настройки больше подходят для ноутбуков нежели для настольных компьютеров. Поэтому нам такая медвежья услуга не к чему.

Для большинства задач подойдёт включение скрытой схемы электропитания `Максимальная производительность`, что делается через командную строку (`cmd`):

```cmd
powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61
```

<details><summary>Удалить скрытую схему:</summary>

```cmd
powercfg -delete e9a42b02-d5df-448d-aa00-03f14749eb61
```

</details>

Скрытая схема электропитания:

![Скрытая схема электропитания](https://github.com/denis-g/windows10-latency-optimization/blob/master/screenshots/poweroptions_01.png)

Но нам этого будет мало, поэтому мы будем так же избавляться от парковки ядер <sup>[[?]](https://fb.ru/article/394435/parkovka-yader-opredelenie-prichina-harakteristika-rabotyi-pravila-otklyucheniya-i-uvelichenie-proizvoditelnosti-protsessora)</sup>. Данная технология так же хороша для ноутбуков, т.к. все не используемые ядра "засыпают", а вот когда включаются остальные решает уже Windows и зачастую делает она это с запоздаем, из-за чего возрастают вездесущие задержки.

В качестве решения этой проблемы оптимальным будет использование утилиты `Bitsum ParkControl` <sup>[[скачать]](https://github.com/denis-g/windows10-latency-optimization/blob/master/_content/links.md#утилиты-используемые-в-гайде)</sup>, она специально предназначена для управления настройками парковки ядер, а так же включает в себя схему электропитания `Bitsum Highest Performance`.

> :sparkles: Основное отличие схемы электропитания `Bitsum Highest Performance` от `Максимальная производительность` заключается исключительно в поддержке управления парковкой ядер, в остальном они идентичны <sup>[[?]](https://community.bitsum.com/forum/index.php?topic=10181.msg30374#msg30374)</sup>.

Пример настройки `Bitsum ParkControl`:

![Пример настройки Bitsum ParkControl](https://github.com/denis-g/windows10-latency-optimization/blob/master/screenshots/parkcontrol_01.png)

- Профиль должен быть установлен
- `Отключено` для парковки ядер и пересчёт частоты
- Производительность установлена на `100%`
- После настроек нажата кнопка `Применить` и `Установить профиль`

По желанию можно включить `Bitsum Dynamic Boost`, который включает схему когда вы пользуетесь компьютером и переключает на другую, выбранную вами, в режиме простоя.

---

Далее необходимо использовать утилиту `Power Plan Settings Explorer Utility` <sup>[[скачать]](https://github.com/denis-g/windows10-latency-optimization/blob/master/_content/links.md#утилиты-используемые-в-гайде)</sup>, с помощью которой можно разблокировать скрытие настройки в схемах электропитания.

Нам интересны только параметры `NVIDIA Display Power Settings Technology` (её может и не быть), `Разрешить состояния снижения питания` и `USB3 Link Power Management` – находим их в списке и снимаем галку напротив в колонке `Hidden`.

Пример разблокировки настроек в `Power Plan Settings Explorer Utility`:

![Пример разблокировки настроек в Power Plan Settings Explorer Utility](https://github.com/denis-g/windows10-latency-optimization/blob/master/screenshots/powersettingsexplorer_01.png)

Следующим шагом надо проверить наши разблокированные настройки, для этого переходим в настройки `Электропитание` и проверяем чтобы всё было отключено.

Пример правильной настройки схем электропитания:

![Пример правильной настройки схем электропитания](https://github.com/denis-g/windows10-latency-optimization/blob/master/screenshots/poweroptions_02.png)

![Пример правильной настройки схем электропитания](https://github.com/denis-g/windows10-latency-optimization/blob/master/screenshots/poweroptions_03.png)

---

По большому счёту можно и ограничиться использованием `Bitsum ParkControl`, но как для меня там не очень продумана возможность смены схем. Для этого я рекомендую использовать утилиту `Switch Power Scheme` <sup>[[скачать]](https://github.com/denis-g/windows10-latency-optimization/blob/master/_content/links.md#утилиты-используемые-в-гайде)</sup>.

Среди полезных возможностей – создание, редактирование, импорт и экспорт (очень полезно при переустановке системы) схем электропитания. И всё это без возни с командной строкой.

Поэтому после настройки `Bitsum ParkControl` саму утилиту можно удалить (**но заранее импортировав его схему, а потом экспортировав** с помощью утилиты или командной строки (`cmd`)), а затем спокойно выбирать нужный в `Switch Power Scheme` в зависимости от ситуации и сценария использования.

Пример схем электропитания в `Switch Power Scheme`:

![Пример схем электропитания в Switch Power Scheme](https://github.com/denis-g/windows10-latency-optimization/blob/master/screenshots/switchpowersheme_01.png)

> :warning: Не рекомендуется удалять схему `Сбалансированная`, есть некоторые сценарии при которых Windows меняет схему на дефолтную и во избежание ошибок лучше чтобы она была, даже если вы ей не пользуетесь.

---

В качестве примера можете скачать настроенную схему [**здесь**](https://github.com/denis-g/windows10-latency-optimization/tree/master/tweaks) в виде `.pow`-файла и импортировать его через `Switch Power Scheme` или командную строку (`cmd`):

```cmd
powercfg -import %USERPROFILE%\Downloads\w10lo-powerscheme.pow
```

![](https://github.com/denis-g/windows10-latency-optimization/blob/master/images/hr.png)

### Настройки системных устройств

> :bulb: Для дальнейшей настройки необходимо ознакомиться c
[Работа с реестром](https://github.com/denis-g/windows10-latency-optimization/blob/master/_content/_howto-regedit.md).

### Драйверы

```reg
Windows Registry Editor Version 5.00

[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\DriverSearching]
"SearchOrderConfig"=dword:00000000

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate]
"ExcludeWUDriversInQualityUpdate"=dword:00000001
```

<details><summary>Значения по-умолчанию:</summary>

```reg
Windows Registry Editor Version 5.00

[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\DriverSearching]
"SearchOrderConfig"=dword:00000002

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate]
"ExcludeWUDriversInQualityUpdate"=-
```

</details>

Здесь мы отключаем авто-обновление драйверов. Зачем? Зачастую Windows устанавливает очень устаревшие драйверы, поэтому для хорошей производительности устройств **необходимо** обновлять драйверы с сайта производителя, особенно это касается драйверов видеокарт.

### Питание

```reg
Windows Registry Editor Version 5.00

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Power\PowerThrottling]
"PowerThrottlingOff"=dword:00000001
```

<details><summary>Значения по-умолчанию:</summary>

```reg
Windows Registry Editor Version 5.00

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Power\PowerThrottling]
"PowerThrottlingOff"=-
```

</details>

`Power Throttling` <sup>[[?]](https://docs.microsoft.com/en-us/windows-hardware/customize/desktop/customize-power-slider)</sup> – очередная служба предназначенная для замедления работы фоновых приложений и процессов с целью экономии энергии на ноутбуках. В нашем случае лишний троттлинг будет не к месту, поэтому рекомендуется её отключить.

### Диск

```reg
Windows Registry Editor Version 5.00

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Power]
"HibernateEnabled"=dword:00000000
```

<details><summary>Значения по-умолчанию:</summary>

```reg
Windows Registry Editor Version 5.00

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Power]
"HibernateEnabled"=-
```

</details>

Режим сна на десктопе так же не имеет смысла. Поэтому чтобы не насиловать наш HDD, а тем более SSD, данную функцию рекомендуется отключить.

---

```reg
Windows Registry Editor Version 5.00

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Power]
"HiberbootEnabled"=dword:00000000
```

<details><summary>Значения по-умолчанию:</summary>

```reg
Windows Registry Editor Version 5.00

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Power]
"HiberbootEnabled"=dword:00000001
```

</details>

Windows перед выключением компьютера сохраняет образ ядра и загруженных драйверов в файле `hiberfil.sys` – при включении компьютер загружает в память этот файл вместо полного перезапуска. Эта функция называется `Быстрый запуск` и на скорость запуска она влияет минимально (особенно на SSD), а вот на износ диска уже существенней.

---

```reg
Windows Registry Editor Version 5.00

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters]
"EnablePrefetcher"=dword:00000000
"EnableSuperfetch"=dword:00000000
```

<details><summary>Значения по-умолчанию:</summary>

```reg
Windows Registry Editor Version 5.00

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters]
"EnablePrefetcher"=dword:00000003
"EnableSuperfetch"=-
```

</details>

Устаревшие службы `Prefetcher` <sup>[[?]](https://ru.wikipedia.org/wiki/Prefetcher)</sup> и `Superfetch` постоянно работают в фоне и анализируют какие приложения/библиотеки/сервисы загружаются. Дальше они сгружают дамп повторяющихся данных в кэш на диске, а оттуда в оперативную память, что увеличивает скорость запуска приложений. Но, если у вас SSD, то приложения и так будут грузится максимально быстро, а вот постоянное насилование диска кэшем не нужно.

---

```reg
Windows Registry Editor Version 5.00

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management]
"ClearPageFileAtShutdown"=dword:00000000
```

<details><summary>Значения по-умолчанию:</summary>

```reg
Windows Registry Editor Version 5.00

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management]
"ClearPageFileAtShutdown"=dword:00000000
```

</details>

Данный параметр отвечает за очистку файла подкачки `pagefile.sys` при выключении компьютера. Сама по себе это услуга больше отвечает за безопасность – из кэша можно получить много интересного о пользователе, но если у вас обычный десктоп, то очередное изнасилование диска нам не нужно.

### Память

```reg
Windows Registry Editor Version 5.00

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management]
"LargeSystemCache"=dword:00000001
```

<details><summary>Значения по-умолчанию:</summary>

```reg
Windows Registry Editor Version 5.00

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management]
"LargeSystemCache"=dword:00000000
```

</details>

Включение `Large System Cache` заставляет операционную систему использовать всю оперативную память для кэша системных файлов, за исключением 4Mb зарезервированных для дискового кэша, таким образом повышается отзывчивость Windows.

---

```reg
Windows Registry Editor Version 5.00

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management]
"DisablePagingExecutive"=dword:00000001
```

<details><summary>Значения по-умолчанию:</summary>

```reg
Windows Registry Editor Version 5.00

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management]
"DisablePagingExecutive"=dword:00000000
```

</details>

При включении данного параметра, ядро системы и драйвера не будут храниться в файле подкачки, а будут всегда находиться в оперативной памяти, что так же повысит отклик.

### Процессор

```reg
Windows Registry Editor Version 5.00

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\PriorityControl]
"Win32PrioritySeparation"=dword:00000026
```

<details><summary>Значения по-умолчанию:</summary>

```reg
Windows Registry Editor Version 5.00

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\PriorityControl]
"Win32PrioritySeparation"=dword:00000002
```

</details>

Данная настройка позволяет настраивать количество квантов времени, выделяемых фоновым и активным процессам <sup>[[?]](https://wasm.in/blogs/kvantovaja-separacija-ili-razbiraemsja-s-win32priorityseparation.701/)</sup>, чтобы это не значило. Единственное, чем мы можем тут помочь – установить высокий приоритет, где ресурсы отдаются активному приложению.

---

```reg
Windows Registry Editor Version 5.00

[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile]
"SystemResponsiveness"=dword:00000064
```

<details><summary>Значения по-умолчанию:</summary>

```reg
Windows Registry Editor Version 5.00

[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile]
"SystemResponsiveness"=dword:00000014
```

</details>

Данный параметр определяет процент ресурсов CPU (по-умолчанию 20%), которые должны быть гарантированы для задач с низким приоритетом. Но т.к. мы все наши приоритеты настроили на то чтобы максимально отдавать все ресурсы мультимедиа приложениям и играм, то данный параметр так же будет лишнем на нашем празднике оптимизаций. Для этого мы установим значение `100`, что просто отключит эту службу.

---

```reg
Windows Registry Editor Version 5.00

[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile]
"LazyModeTimeout"=dword:00002710
```

<details><summary>Значения по-умолчанию:</summary>

```reg
Windows Registry Editor Version 5.00

[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile]
"LazyModeTimeout"=-
```

</details>

`LazyMode` - это программный флаг, который позволяет системе пропускать некоторые аппаратные события при низкой загрузке CPU. Но его выключение может задействовать больше ресурсов на обработку событий, поэтому мы просто установим минимальное значение таймера в `1ms` (`10000ns`).

![](https://github.com/denis-g/windows10-latency-optimization/blob/master/images/reboot.png)

![](https://github.com/denis-g/windows10-latency-optimization/blob/master/images/hr.png)

### Настройка Windows

### Визуальные эффекты

Данные настройки в основном отвечают за эффекты и функции, которые только зря используют GPU. Отключать можно по своему усмотрению, но всё же **рекомендуется** так же применить настройки.

![Пример настройки визуальных эффектов](https://github.com/denis-g/windows10-latency-optimization/blob/master/screenshots/visualeffects_01.png)

### Сервисы и службы

Для того чтобы избежать возни с отключением служб Windows, а так же грамотно их отключать учитывая миллион зависимостей **настоятельно рекомендую** использовать утилиту `Win 10 Tweaker` <sup>[[скачать]](https://github.com/denis-g/windows10-latency-optimization/blob/master/_content/links.md#утилиты-используемые-в-гайде)</sup>. Кроме того с помощью этой утилиты так же можно управлять конфиденциальностью, освободить лишнее место и еще много чего интересного.

Пример настройки служб в `Win 10 Tweaker`:

![Пример настройки служб в Win 10 Tweaker](https://github.com/denis-g/windows10-latency-optimization/blob/master/screenshots/win10tweaker_01.png)

Пример настройки системных параметров в `Win 10 Tweaker`:

![Пример настройки системных параметров в Win 10 Tweaker](https://github.com/denis-g/windows10-latency-optimization/blob/master/screenshots/win10tweaker_02.png)

### Общие рекомендации по использованию Windows

- Используйте только необходимые приложения – старайтесь привести к минимуму запущенные приложения, а так же удалить всё лишнее из Панели задач и Автозагрузки.
- Пройдитесь по всем параметрам Windows и отключите все функции, которыми вы не пользуетесь.
- Отключите индексацию диска, если не пользуетесь поиском.
- По возможности отключите все не используемые и не определённые устройства в Диспетчере устройств.

> :bangbang: **Так же не стоит забывать, что после установки обновлений Windows или обновлений драйверов nVidia некоторые настройки могут слетать на дефолтные значения! Рекомендуется устанавливать только важные для вас обновления, после чего проверить настройки.**
