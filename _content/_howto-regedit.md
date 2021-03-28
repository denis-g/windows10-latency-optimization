[![](https://github.com/denis-g/windows10-latency-optimization/blob/master/images/header_small.png)](https://github.com/denis-g/windows10-latency-optimization#содержание)

---

### Работа с реестром

В данном гайде требуемые изменения представлены в виде reg-файлов <sup>[[?]](https://ru.wikipedia.org/wiki/REG)</sup>, чтобы не захламлять текст о том как создать или изменить параметр. Но для создания и редактирования записей в реестре можно так же использовать и встроенную утилиту Редактор реестра (`regedit`).

Если вы хотите вносить изменения через Редактор реестра (`regedit`), то исходя из представленных reg-файлов вам уже должно быть понятно, что:

```reg
Windows Registry Editor Version 5.00

; это путь по которому надо перейти
[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer]
"SmartScreenEnabled"="Off"                  ; это параметр типа String
"EnableWebContentEvaluation"=dword:00000000 ; это параметр типа REG_DWORD (32-bit)

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\***\0000\PowerSettings]
"ConservationIdleTime"=hex:00,00,00,00      ; это параметр типа REG_BINARY

[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile]
"LazyModeTimeout"=-                         ; это параметр, которого не было и он будет удалён
```
