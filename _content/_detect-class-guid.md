[![](https://github.com/denis-g/windows10-latency-optimization/blob/master/images/header_small.png)](https://github.com/denis-g/windows10-latency-optimization#содержание)

---

### Определение Class GUID

Каждое устройство принадлежит к классу, а каждый класс идентифицируется по классу устройства Class GUID.

Для того чтобы узнать какой Class GUID у нашего устройства надо открыть Диспетчер устройств (`devmgmt.msc`) и найти, например, аудиоустройство:

![Дерево устройств](https://github.com/denis-g/windows10-latency-optimization/blob/master/screenshots/devicemanager-guid_01.png)

После чего зайти в свойства устройства и найти там `Class GUID`, это будет необходимо для поиска устройства в Редакторе реестра (`regedit`):

![Свойства устройства](https://github.com/denis-g/windows10-latency-optimization/blob/master/screenshots/devicemanager-guid_02.png)
