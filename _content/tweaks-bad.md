[![](https://github.com/denis-g/windows10-latency-optimization/blob/master/images/header_small.png)](https://github.com/denis-g/windows10-latency-optimization#содержание)

---

### Плохие твики

Здесь будет кладбище настроек встречаемых на просторах интернета, которые до сих пор распространены, но сомнительны для применения, устарели со времён Windows XP или же просто напросто не работают.

- [Настройки MMCSS](https://github.com/denis-g/windows10-latency-optimization/blob/master/_content/tweaks-bad.md#настройки-mmcss)
- [Настройки памяти](https://github.com/denis-g/windows10-latency-optimization/blob/master/_content/tweaks-bad.md#настройки-памяти)

![](https://github.com/denis-g/windows10-latency-optimization/blob/master/images/hr.png)

### Настройки MMCSS

```reg
Windows Registry Editor Version 5.00

[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games]
"GPU Priority"=dword:00000012
"Priority"=dword:00000002
"Scheduling Category"="High"
"SFIO Priority"="High"

[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\DisplayPostProcessing]
"GPU Priority"=dword:00000008
"Priority"=dword:00000002
"Scheduling Category"="High"
"SFIO Priority"="High"

[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Audio]
"GPU Priority"=dword:00000001
"Priority"=dword:00000002
"Scheduling Category"="Medium"
"SFIO Priority"="High"

[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Pro Audio]
"GPU Priority"=dword:00000001
"Priority"=dword:00000002
"Scheduling Category"="High"
"SFIO Priority"="High"
```

<details><summary>Значения по-умолчанию:</summary>

```reg
Windows Registry Editor Version 5.00

[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games]
"GPU Priority"=dword:00000008
"Priority"=dword:00000002
"Scheduling Category"="Medium"
"SFIO Priority"="Normal"

[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\DisplayPostProcessing]
"GPU Priority"=dword:00000008
"Priority"=dword:00000008
"Scheduling Category"="High"
"SFIO Priority"="Normal"

[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Audio]
"GPU Priority"=dword:00000008
"Priority"=dword:00000006
"Scheduling Category"="Medium"
"SFIO Priority"="Normal"

[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Pro Audio]
"GPU Priority"=dword:00000008
"Priority"=dword:00000001
"Scheduling Category"="High"
"SFIO Priority"="Normal"
```

</details>

Задачей MMCSS (Multimedia Class Scheduler Service) это правильно распределять приоритеты CPU между мультимедиа задачами <sup>[[?]](https://docs.microsoft.com/ru-ru/windows/win32/procthread/multimedia-class-scheduler-service)</sup>. Практически все приложения на сегодняшний день используют только две задачи - `Audio` или `Pro Audio` <sup>[[?]](https://github.com/djdallmann/GamingPCSetup/tree/master/CONTENT/RESEARCH/WINSERVICES)</sup>. Остальные типы задач, особенно такая как `Games`, **не используются**.

![](https://github.com/denis-g/windows10-latency-optimization/blob/master/images/hr.png)

### Настройки памяти

```reg
Windows Registry Editor Version 5.00

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management]
"IoPageLockLimit"=dword:00fefc00
"NonPagedPoolQuota"=dword:00000000
"NonPagedPoolSize"=dword:00000000
"PagedPoolQuota"=dword:00000000
"PagedPoolSize"=dword:000000c0
"PhysicalAddressExtension"=dword:00000001
"PoolUsageMaximum"=dword:00000060
"SecondLevelDataCache"=dword:00000400
"SessionPoolSize"=dword:000000c0
"SessionViewSize"=dword:000000c0
"SystemPages"=dword:ffffffff
```

<details><summary>Значения по-умолчанию:</summary>

```reg
Windows Registry Editor Version 5.00

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management]
"IoPageLockLimit"=-
"NonPagedPoolQuota"=dword:00000000
"NonPagedPoolSize"=dword:00000000
"PagedPoolQuota"=dword:0000000
"PagedPoolSize"=dword:00000000
"PhysicalAddressExtension"=dword:00000001
"PoolUsageMaximum"=-
"SecondLevelDataCache"=dword:00000000
"SessionPoolSize"=dword:00000004
"SessionViewSize"=dword:00000030
"SystemPages"=dword:00000000
```

</details>

Большинство данных настроек относятся к 32-битным системам <sup>[[?]](https://docs.microsoft.com/en-us/windows/win32/memory/memory-management-registry-keys)</sup> <sup>[[?]](https://docs.microsoft.com/en-us/troubleshoot/windows-server/performance/unable-allocate-memory-system-paged-pool)</sup>, а так же к старым редакциям Windows <sup>[[?]](https://docs.microsoft.com/en-us/previous-versions/windows/it-pro/windows-2000-server/cc959494(v=technet.10))</sup>.

![](https://github.com/denis-g/windows10-latency-optimization/blob/master/images/hr.png)
