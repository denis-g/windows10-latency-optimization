[![](https://github.com/denis-g/windows10-latency-optimization/blob/master/images/header_small.png)](https://github.com/denis-g/windows10-latency-optimization#содержание)

---

### :dart: Дополнительные настройки

Представленные здесь настройки носят исключительно рекомендательный характер, применение их не обязательно.

- [Оптимизация загрузки](https://github.com/denis-g/windows10-latency-optimization/blob/master/_content/additional.md#оптимизация-загрузки)
- [Настройка аудио](https://github.com/denis-g/windows10-latency-optimization/blob/master/_content/additional.md#настройка-аудио)

![](https://github.com/denis-g/windows10-latency-optimization/blob/master/images/hr.png)

### Оптимизация загрузки

Для оптимизации загрузки в несколько миллисекунд :trollface: будем использовать встроенную утилиту `bcdedit` <sup>[[?]](https://docs.microsoft.com/en-us/windows-hardware/drivers/devtest/bcdedit--set)</sup>:

```cmd
bcdedit /timeout 0
bcdedit /set quietboot yes
bcdedit /set {globalsettings} custom:16000067 true
```

- `timeout` – задержка, по истечению которого начнется загрузка операционной системы, в секундах
- `quietboot` – отключает hi-res отображение заставки
- `custom:16000067` – отключает отображение логотипа Windows

<details>
<summary>Сброс значений по-умолчанию</summary>

```cmd
bcdedit /timeout 3 > nul
bcdedit /deletevalue quietboot > nul
bcdedit /deletevalue {globalsettings} custom:16000067 > nul
```

</details>

![](https://github.com/denis-g/windows10-latency-optimization/blob/master/images/hr.png)

### Настройка аудио

> :bulb: Для дальнейшей настройки необходимо ознакомиться c
[Работа с реестром](https://github.com/denis-g/windows10-latency-optimization/blob/master/_content/_howto-regedit.md),
[Определение Class GUID](https://github.com/denis-g/windows10-latency-optimization/blob/master/_content/_detect-class-guid.md).

### nVidia Audio

> :sparkles: Данные настройки пригодятся только если вы используете цифровой выход с видеокарты в качестве аудиоинтерфейса, т.е. ваша акустика (колонки, саундбар, ресивер) подключена непосредственно через HDMI-разъём видеокарты.

Здесь будем убирать задержку из-за которой после нескольких секунд отсутствия звука отключается драйвер звука и не получая питания, а через некоторое время обычно засыпает и само устройство воспроизведения звука, что очень сильно раздражает.

```reg
Windows Registry Editor Version 5.00

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\***\0000\PowerSettings]
"ConservationIdleTime"=hex:00,00,00,00
"IdlePowerState"=hex:00,00,00,00
"PerformanceIdleTime"=hex:00,00,00,00
```

<details><summary>Значения по-умолчанию:</summary>

```reg
Windows Registry Editor Version 5.00

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\***\0000\PowerSettings]
"ConservationIdleTime"=hex:04,00,00,00
"IdlePowerState"=hex:03,00,00,00
"PerformanceIdleTime"=hex:04,00,00,00
```

</details>

За это отвечает сразу три параметра <sup>[[?]](https://docs.microsoft.com/en-us/windows-hardware/drivers/audio/audio-device-class-inactivity-timer-implementation)</sup>, которые необходимо установить в `0`, тем самым отключив управление питанием.

В качестве части имени ветки мы используем `***`, где `***` надо заменить на Class GUID нашего аудиоустройства `NVIDIA High Definition Audio`.

> :warning: Данная настройка сбрасывается на дефолтное значение после обновления драйвера nVidia!

---

Иногда бывает так, что после очередного обновления драйверов nVidia, или же по другим причинам, игнорируются выше описанные параметры. Для кардинального решения проблемы есть микро-утилита `Sound Keeper` <sup>[[скачать]](https://github.com/denis-g/windows10-latency-optimization/blob/master/_content/links.md#утилиты-используемые-в-гайде)</sup>, которая постоянно имитирует воспроизведение тишины через WASAPI для всех SPDIF или HDMI выходов.

Для её работы достаточно её запустить и добавить в автозагрузку.

![](https://github.com/denis-g/windows10-latency-optimization/blob/master/images/reboot.png)
