[![](https://github.com/denis-g/windows10-latency-optimization/blob/master/images/header_small.png)](https://github.com/denis-g/windows10-latency-optimization#содержание)

---

### Определение IRQ

Для того чтобы определить какие `IRQ` используют наши устройства необходимо использовать встроенную утилиту `msinfo32.exe`. После её запуска нужно перейти в раздел `Аппаратные ресурсы`, а затем `Прерывания (IRQ)`. Далее в списке ваших устройств найти нужное (обычно в самом низу) и скопировать (`CTRL + C`) в виде строки.

Пример использования `msinfo32.exe` для получения `IRQ`:

![Пример использования msinfo32.exe для получения IRQ](https://github.com/denis-g/windows10-latency-optimization/blob/master/screenshots/msinfo32_01.png)
