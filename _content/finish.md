[![](https://github.com/denis-g/windows10-latency-optimization/blob/master/images/header_small.png)](https://github.com/denis-g/windows10-latency-optimization#содержание)

---

### :crystal_ball: Тесты и выводы

- [LatencyMon](https://github.com/denis-g/windows10-latency-optimization/blob/master/_content/finish.md#latencymon)
- [FurMark](https://github.com/denis-g/windows10-latency-optimization/blob/master/_content/finish.md#furmark)

![](https://github.com/denis-g/windows10-latency-optimization/blob/master/images/hr.png)

Как уже не раз говорилось – не у всех и не всегда настройки из данного гайда дадут хорошие результаты в плане FPS, но в первую очередь он предназначен для уменьшения задержек с чем он должен справится у большинства.

Все тесты сделаны в чистой Windows (всё настроено и используется по-умолчанию), но с обновлёнными драйверами nVidia, а в качестве оппонента выступает та же Windows, но уже настроенная по гайду. Следует учитывать, что как и все тесты они не показывают полноты всей картины, разбежки между запусками это нормально, поэтому приведены средние результаты.

<details><summary>Версии используемые в тестах:</summary>

```
Windows 20H2 (Updated February 2021)
nVidia Game Ready Driver 461.72
```
</details>

### LatencyMon

Но чтобы не быть голословным, и показать всё в цифрах, использовалась замечательная утилита для измерения задержек - `LatencyMon` <sup>[[скачать]](https://github.com/denis-g/windows10-latency-optimization/blob/master/_content/links.md#утилиты-используемые-в-гайде)</sup>. С её помощью можно узнать, что в вашей системе вызывает задержки и уже на основе полученных данных бороться с источником проблемы. Зачастую эти проблемы возникают от кривых драйверов (часто это касается nVidia), а так же устройств находящихся на медленных шинах (USB и HDD могут прилично влиять на всю систему в целом).

Благодаря nVidia тут замечательно видно, что основу моих задержек составляют именно её драйверы (к слову, на предыдущей версии результаты были получше), а борьба с этим отдельный вид искусства. Так же эти результаты не показывают идеальный вариант, а весьма наглядно демонстрируют что улучшилось и с чем еще предстоит бороться.

> :bangbang: **Рекомендуется** после обновления драйверов nVidia смотреть с помощью `LatencyMon` не стало ли хуже и, весьма вероятно, имеет смысл откатить драйвер на предыдущую версию.

#### Main

Результаты `LatencyMon` после настройки:

![Результаты LatencyMon после настройки](https://github.com/denis-g/windows10-latency-optimization/blob/master/screenshots/tests/after/latencymon_01.png)

<details><summary>Результаты LatencyMon до настройки:</summary>

![Результаты LatencyMon до настройки](https://github.com/denis-g/windows10-latency-optimization/blob/master/screenshots/tests/before/latencymon_01.png)

</details>

#### Stats

Результаты `LatencyMon` после настройки:

![Результаты LatencyMon после настройки](https://github.com/denis-g/windows10-latency-optimization/blob/master/screenshots/tests/after/latencymon_02.png)

<details><summary>Результаты LatencyMon до настройки:</summary>

![Результаты LatencyMon до настройки](https://github.com/denis-g/windows10-latency-optimization/blob/master/screenshots/tests/before/latencymon_02.png)

</details>

Для оценки можно придерживаться *примерно* таких оптимальных цифр в результатах статистики:

```
Highest measured interrupt to process latency (µs):   30-40 ms
Average measured interrupt to process latency (µs):   1,5 ms

Highest measured interrupt to DPC latency (µs):       30-40 ms
Average measured interrupt to DPC latency (µs):       0,5 ms
```

Если ваши значения не больше чем в два раза, то есть смысл для более детального решения проблемы – поиска проблемных устройств или драйверов (о чём будет ниже). Если же ваши значения больше на несколько порядков, то что-то в вашей системе явно не так.

#### Drivers

Результаты `LatencyMon` после настройки:

![Результаты LatencyMon после настройки](https://github.com/denis-g/windows10-latency-optimization/blob/master/screenshots/tests/after/latencymon_03.png)

<details><summary>Результаты LatencyMon до настройки:</summary>

![Результаты LatencyMon до настройки](https://github.com/denis-g/windows10-latency-optimization/blob/master/screenshots/tests/before/latencymon_03.png)

</details>

На этой вкладке можно увидеть какие именно драйверы влияют на задержки и исходя из показателей искать решение.

Основной список системных драйверов:

```
Wdf01000.sys   Windows Driver Framework – управляет всеми системными драйверами для устройств
ndis.sys       Network Driver Interface Specification – управляет сетевыми устройствами
storport.sys   Storage Port – управляет устройствами хранения (HDD, SSD)
ntoskrnl.exe   NT OS Kernel – процесс ядра Windows
nviddmkm.sys   NVIDIA Windows Kernel Mode Driver – драйверы nVidia
```

Оптимальным результатом `Highest execution (ms)` является значение *примерно* равное `0,05 ms`.

Например, если большая задержка у драйвера `storport.sys`, то вполне вероятно у вас проблемы именно с жёстким диском, если большая задержка у `ntoskrnl.exe` то может быть проблема в самой Windows или её обновлениях, а `ndis.sys` может указывать на драйвер от WiFi адаптера. Конкретно в чём находится ваша проблема определить по этим данным **не предоставляется возможным**, можно лишь примерно узнать в какую сторону нужно копать.

> :sparkles: Для более детального изучения проблемы можно воспользоваться утилитой `Windows Performance Analyzer` <sup>[[скачать]](https://github.com/denis-g/windows10-latency-optimization/blob/master/_content/links.md#утилиты-используемые-в-гайде)</sup>.

#### CPUs

Результаты `LatencyMon` после настройки:

![Результаты LatencyMon после настройки](https://github.com/denis-g/windows10-latency-optimization/blob/master/screenshots/tests/after/latencymon_04.png)

<details><summary>Результаты LatencyMon до настройки:</summary>

![Результаты LatencyMon до настройки](https://github.com/denis-g/windows10-latency-optimization/blob/master/screenshots/tests/before/latencymon_04.png)

</details>

Здесь можно более подробно посмотреть как распараллелены драйверы по ядрам и их загрузка.

В качестве дополнительной оптимизации так же можно попробовать перенести драйвер сетевого адаптера на другое ядро, но по-хорошему, кроме печальной или не очень статистики, с этим мы вряд ли можем что-то сделать не угробив в дальнейшем Windows.

#### Выводы

По предварительной оценке можно сказать, что у меня задержки уменьшились в среднем **в 4 раза**. Даже с учётом явных проблем с nVidia это весьма не плохой результат, но и тут есть к чему стремиться. Так же не стоит забывать, что **это лишь примерные данные** показывающие есть или у вас проблемы или нет, вовсе не обязательно насиловать систему за каждую миллисекунду, т.к. любое обновление может поставить на этом крест, да и сколько раз уже говорилось – каждая система индивидуальна, вполне вероятно лучших результатов может и не быть.

![](https://github.com/denis-g/windows10-latency-optimization/blob/master/images/hr.png)

### FurMark

Для облизывания на FPS мы будем использовать популярный синтетический стресс-тест `FurMark` <sup>[[скачать]](https://github.com/denis-g/windows10-latency-optimization/blob/master/_content/links.md#утилиты-используемые-в-гайде)</sup> для оценки производительности в Open GL.

Настройки `FurMark`:

![Настройки FurMark](https://github.com/denis-g/windows10-latency-optimization/blob/master/screenshots/tests/furmark_01.png)

Результаты `FurMark` после настройки:

![Результаты FurMark после настройки](https://github.com/denis-g/windows10-latency-optimization/blob/master/screenshots/tests/after/furmark_01.png)

<details><summary>Результаты FurMark до настройки:</summary>

![Результаты FurMark до настройки](https://github.com/denis-g/windows10-latency-optimization/blob/master/screenshots/tests/before/furmark_01.png)

</details>

В данном тесте хорошо показана разница в увеличении минимального кадра и, на уровне погрешности, максимального. Но нашей основной задачей было именно нормализация фреймрейта путём уменьшения задержек, что и дало положительный результат на **стабильный кадр** <sup>[[?]](https://www.youtube.com/watch?v=sn1iT9umm6g)</sup>.

> :sparkles: Кроме того, не стоит пренебрегать такими решениями как `MSI Afterburner` и настройками в BIOS для увеличение производительности GPU и CPU. Поэтому результаты в играх при правильном подходе будут показывать еще больший прирост в производительности.
