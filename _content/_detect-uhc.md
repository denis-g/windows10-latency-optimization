[![](https://github.com/denis-g/windows10-latency-optimization/blob/master/images/header_small.png)](https://github.com/denis-g/windows10-latency-optimization#содержание)

---

### Определение USB Host Controller

`USB Host Controller` это, соотвественно, контроллер к которому подключаются все USB устройства (в том числе радио-модули, камеры и прочее) на материнской плате, даже будучи распаянной на ней.

Для того чтобы узнать какое устройство у нас является `USB Host Controller` надо открыть Диспетчер устройств (`devmgmt.msc`) и найти, например, мышь или клавиатуру подключённую **непосредственно** к вашему компьютеру и выбрать `Вид` - `Устройства по подключению`:

![Дерево устройств](https://github.com/denis-g/windows10-latency-optimization/blob/master/screenshots/devicemanager-uhc_01.png)

После чего получится такое дерево устройств, где и будет искомый контроллер:

![Дерево устройств](https://github.com/denis-g/windows10-latency-optimization/blob/master/screenshots/devicemanager-uhc_02.png)

Варианты названий для `USB Host Controller`:

```
Intel(R) USB3.1 eXtensible Host Controller
ASMedia USB3.0 eXtensible Host Controller
AMD USB3.10 eXtensible Host Controller
Расширяемый хост-контроллер Intel(R) USB3.1
Расширяемый хост-контроллер NVIDIA USB3.10
```

> :sparkles: У вас название для контроллера может немного отличаться, добавляться версия драйвера или еще какая-то информация – у каждого производителя они немного разные.

Далее надо найти в свойствах устройства `Размещение`, а так же `ИД устройства` во вкладке `Сведения`, это необходимо для поиска устройства в утилитах:

![Свойства устройства](https://github.com/denis-g/windows10-latency-optimization/blob/master/screenshots/devicemanager-uhc_03.png)
![Свойства устройства](https://github.com/denis-g/windows10-latency-optimization/blob/master/screenshots/devicemanager-uhc_04.png)

> :bangbang: Учтите, что у вас может быть несколько устройств `USB Host Controller`, поэтому настройки надо выполнять для **всех** контроллеров.
