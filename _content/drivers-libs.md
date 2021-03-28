[![](https://github.com/denis-g/windows10-latency-optimization/blob/master/images/header_small.png)](https://github.com/denis-g/windows10-latency-optimization#содержание)

---

### :electric_plug: Драйверы и системные библиотеки

- [Драйверы](https://github.com/denis-g/windows10-latency-optimization/blob/master/_content/drivers-libs.md#драйверы)
- [Системные библиотеки](https://github.com/denis-g/windows10-latency-optimization/blob/master/_content/drivers-libs.md#системные-библиотеки)

![](https://github.com/denis-g/windows10-latency-optimization/blob/master/images/hr.png)

### Драйверы

> :bangbang: Перед началом настройки ваши **драйверы должны быть обновлены** или использоваться оптимальные для вашей системы.

> :warning: Вполне вероятна ситуация, что конкретных параметров у драйверов указанных в гайде на вашей системе нет. Например, при использовании разных версий драйверов – возможно они называются иначе, возможно данных настроек нет в конкретно вашем драйвере. *Желательно поискать в интернете как этот параметр может называться, в противном случае его пропустить*.

Перед установкой драйвера видеокарты, **рекомендуется** удалить старый драйвер с помощью утилиты `Display Driver Uninstaller (DDU)` <sup>[[скачать]](https://github.com/denis-g/windows10-latency-optimization/blob/master/_content/links.md#утилиты-используемые-в-гайде)</sup>, тем самым мы удалим весь мусор и хвосты от старых дайверов, которые нам установила Windows.

![Пример настройки Display Driver Uninstaller (DDU)](https://github.com/denis-g/windows10-latency-optimization/blob/master/screenshots/displaydriveruninstaller_01.png)

Так же в настройках не забудьте указать `Не загружать драйверы из Центра обнвлений Windows, когда Windows ищет драйвер для устройства` чтобы после перезагрузки они не установились заново.

Пример настройки `Display Driver Uninstaller (DDU)`:

![Пример настройки Display Driver Uninstaller (DDU)](https://github.com/denis-g/windows10-latency-optimization/blob/master/screenshots/displaydriveruninstaller_02.png)

> :warning: Удалять драйвер **необходимо** в `Безопасном режиме` <sup>[[?]](https://support.microsoft.com/ru-ru/windows/загрузка-компьютера-в-безопасном-режиме-в-windows-10-92c27cff-db89-8644-1ce4-b3e5e56fe234)</sup>, о чём вам так же сообщит утилита.

---

**Всегда** устанавливайте последние драйверы nVidia с помощью утилиты `NVCleanstall` <sup>[[скачать]](https://github.com/denis-g/windows10-latency-optimization/blob/master/_content/links.md#утилиты-используемые-в-гайде)</sup>, с её помощью можно установить только нужные компоненты, без лишнего мусора и сервисов телеметрии. По возможности **устанавливайте минимальное количество компонентов**, тем самым запущенных процессов будет значительно меньше.

Пример настройки `NVCleanstall`:

![Пример настройки NVCleanstall](https://github.com/denis-g/windows10-latency-optimization/blob/master/screenshots/nvcleaninstall_01.png)

![Пример настройки NVCleanstall](https://github.com/denis-g/windows10-latency-optimization/blob/master/screenshots/nvcleaninstall_02.png)

![](https://github.com/denis-g/windows10-latency-optimization/blob/master/images/hr.png)

### Системные библиотеки

Большинству современных игр и программ необходим набор дополнительных библиотек `VBCRedist` (`Microsoft Visual C++ Redistributable Runtimes`), версии которых можно установить с официального сайта Microsoft <sup>[[?]](https://support.microsoft.com/en-us/topic/the-latest-supported-visual-c-downloads-2647da03-1eea-4433-9aff-95f26a218cc0)</sup>. И здесь проблема заключается в том, что версий этих библиотек – десяток, что есть самый настоящий DLL Hell :fire: <sup>[[?]](https://ru.wikipedia.org/wiki/DLL_hell)</sup>. Но скачивать каждую версию по отдельности это какой-то сюр в духе Microsoft, поэтому хорошие люди сделали пак, где собраны все последние версии, которые устанавливаются автоматически и без проблем – `VBCRedist AIO` <sup>[[скачать]](https://github.com/denis-g/windows10-latency-optimization/blob/master/_content/links.md#утилиты-используемые-в-гайде)</sup>.

---

Так же необходимо установить все доступные версии DirectX (чтобы каждая игра радовала своим графонием), для этого надо скачать web-установщик <sup>[[скачать]](https://github.com/denis-g/windows10-latency-optimization/blob/master/_content/links.md#утилиты-используемые-в-гайде)</sup> с сайта Microsoft, который закачает и установит все недостающие на вашей системе версии. Profit!
