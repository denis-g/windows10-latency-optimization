[![](https://github.com/denis-g/windows10-latency-optimization/blob/master/images/header_small.png)](https://github.com/denis-g/windows10-latency-optimization#содержание)

---

### :suspect: Настройки для игр

- [Отключение GameBar, GameDVR](https://github.com/denis-g/windows10-latency-optimization/blob/master/_content/games.md#отключение-gamebar-gamedvr)
- [Настройки игр](https://github.com/denis-g/windows10-latency-optimization/blob/master/_content/games.md#настройки-игр)
- [Настройки лаунчеров](https://github.com/denis-g/windows10-latency-optimization/blob/master/_content/games.md#настройки-лаунчеров)
- [Настройка Oculus VR](https://github.com/denis-g/windows10-latency-optimization/blob/master/_content/games.md#настройка-oculus-vr)

![](https://github.com/denis-g/windows10-latency-optimization/blob/master/images/hr.png)

### Отключение GameBar, GameDVR

> :bulb: Для дальнейшей настройки необходимо ознакомиться c
[Работа с реестром](https://github.com/denis-g/windows10-latency-optimization/blob/master/_content/_howto-regedit.md).

```reg
Windows Registry Editor Version 5.00

[HKEY_CURRENT_USER\Software\Microsoft\GameBar]
"AutoGameModeEnabled"=dword:00000000
"UseNexusForGameBarEnabled"=dword:00000000
"ShowStartupPanel"=dword:00000000
"GamePanelStartupTipIndex"=dword:00000003

[HKEY_CURRENT_USER\System\GameConfigStore]
"GameDVR_Enabled"=dword:00000000
"GameDVR_DSEBehavior"=dword:00000002
"GameDVR_FSEBehavior"=dword:00000002
"GameDVR_HonorUserFSEBehaviorMode"=dword:00000001
"GameDVR_DXGIHonorFSEWindowsCompatible"=dword:00000001

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\GameDVR]
"AllowGameDVR"="0"

[HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\GameDVR]
"AppCaptureEnabled"=dword:00000000
```

<details><summary>Значения по-умолчанию:</summary>

```reg
Windows Registry Editor Version 5.00

[HKEY_CURRENT_USER\Software\Microsoft\GameBar]
"UseNexusForGameBarEnabled"=-
"ShowStartupPanel"=-
"GamePanelStartupTipIndex"=-

[HKEY_CURRENT_USER\System\GameConfigStore]
"GameDVR_Enabled"=dword:00000001
"GameDVR_DSEBehavior"=-
"GameDVR_FSEBehavior"=-
"GameDVR_HonorUserFSEBehaviorMode"=dword:00000000
"GameDVR_DXGIHonorFSEWindowsCompatible"=dword:00000000

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\GameDVR]
"AllowGameDVR"=-

[HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\GameDVR]
"AppCaptureEnabled"=-
```

</details>

Первым делом мы будем отключать `GameBar` и `GameDVR` (особенно, если вы этим не пользуетесь), т.к. наличие лишних оверлеев только провоцируют к снижению FPS и увеличению инпут-лага.

---

```reg
Windows Registry Editor Version 5.00

[HKEY_CURRENT_USER\SOFTWARE\Microsoft\GameBar]
"AutoGameModeEnabled"=dword:00000000
"AllowAutoGameMode"=dword:00000000

[HKEY_CURRENT_USER\System\GameConfigStore]
"Win32_AutoGameModeDefaultProfile"=hex:00,00,00,00,00,00,00,00,00,00,00,00,00,\
  00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,\
  00,00
"Win32_GameModeRelatedProcesses"=hex:00,00,00,00,00,00,00,00,00,00,00,00,00,00,\
  00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,\
  00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,\
  00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,\
  00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,\
  00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,\
  00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,\
  00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,\
  00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,\
  00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,\
  00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,\
  00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,\
  00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,\
  00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,\
  00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,\
  00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,\
  00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,\
  00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,\
  00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,\
  00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,\
  00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,\
  00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,\
  00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,\
  00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,\
  00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,\
  00,00,00,00,00,00,00,00,00,00
```

<details><summary>Значения по-умолчанию</summary>

```reg
Windows Registry Editor Version 5.00

[HKEY_CURRENT_USER\SOFTWARE\Microsoft\GameBar]
"AutoGameModeEnabled"=-
"AllowAutoGameMode"=-

[HKEY_CURRENT_USER\System\GameConfigStore]
"Win32_AutoGameModeDefaultProfile"=hex:02,00,01,00,00,00,c4,20,00,00,00,00,00,\
  00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,\
  00,00
"Win32_GameModeRelatedProcesses"=hex:01,00,01,00,01,00,67,00,61,00,6d,00,65,00,\
  70,00,61,00,6e,00,65,00,6c,00,2e,00,65,00,78,00,65,00,00,00,c9,00,4e,95,67,\
  77,b0,eb,1e,03,d8,f1,1e,03,1e,00,00,00,b0,eb,1e,03,1e,00,00,00,0f,00,00,00,\
  2c,ea,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,\
  00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,\
  00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,\
  00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,\
  00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,\
  00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,\
  00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,\
  00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,\
  00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,\
  00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,\
  00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,\
  00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,\
  00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,\
  00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,\
  00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,\
  00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,\
  00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,\
  00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,\
  00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,\
  00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,\
  00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,\
  00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,\
  00,00,00,00,00,00,00,00,00,00
```

</details>

Является ли отключение `Режим игры` необходимым? По большому счету его включение не даёт никаких заметных результатов <sup>[[?]](https://www.pcgamer.com/windows-10-game-mode-tested-good-for-minimum-fps-bad-for-multitasking/)</sup>, а вот проблемы <sup>[[?]](https://www.ixbt.com/news/2020/05/07/microsoft-windows-10.html)</sup> имеют место быть.

![](https://github.com/denis-g/windows10-latency-optimization/blob/master/images/reboot.png)

![](https://github.com/denis-g/windows10-latency-optimization/blob/master/images/hr.png)

### Настройки игр

### Fullscreen

Неплохой прирост FPS даёт использование `Exclusive Fullscreen` режим окна в играх, если это доступно в настройках. В противном случае лучше выбрать `Windowed Fullsreen`, `Borderless Window` (`Окно без рамок`) <sup>[[?]](https://www.reddit.com/r/allbenchmarks/comments/ggcsvc/windows_10_fullscreen_optimizations_vs_fullscreen/)</sup>.

---

Так же положительно влияет на FPS отключение системной "оптимизации" для полноэкранного режима для конкретных игр. Windows 10 вместо честного полноэкранного режима использует свой режим наложения, благодаря которому вы можете быстрее переключаться между приложениями, получать уведомления и прочие не нужные в игре всплывающие элементы интерфейса. Всё это в итоге даёт только рост инпут-лага.

![Пример настроек Compatibility Manager](https://github.com/denis-g/windows10-latency-optimization/blob/master/screenshots/compatibility_01.png)

> :warning: Данная функция может быть не доступна, если включён `GameDVR`.

Для того чтобы отключить очередную не нужную фичу, и не лазить по настройкам каждого исполняемого файла игры, лучше использовать утилиту `Compatibility Manager` <sup>[[скачать]](https://github.com/denis-g/windows10-latency-optimization/blob/master/_content/links.md#утилиты-используемые-в-гайде)</sup>, где можно выбрать для каких приложений надо выключить это недоразумение.

Пример настроек `Compatibility Manager`:

![Пример настроек Compatibility Manager](https://github.com/denis-g/windows10-latency-optimization/blob/master/screenshots/compatibilitymanager_01.png)

Здесь нам необходимо выбрать (если нет в списке, то добавить) игру у которой надо отключить "оптимизацию", далее выбрать `Disable fullscreen optimizations` и нажать `Save selected to registry`.

Так же с помощью утилиты можно импортировать и экспортировать эти настройки, изменять прочие параметры для приложений доступные в свойствах приложения.

> :bangbang: У этого решения есть и фатальный недостаток – функцию **нельзя отключить для игр основанных на DirectX 12** <sup>[[?]](https://devblogs.microsoft.com/directx/demystifying-full-screen-optimizations/)</sup>, некоторые игры так же испытывают проблемы с отключением, имейте это в виду.

> :red_circle: После настройки **необходимо** перезагрузить игру, а так же лаунчер (Steam, Origin и т.д.), если она запущена через него.

---

### V-SYNC

Если вам необходимо использовать вертикальную синхронизацию, например не нравятся разрывы экрана или значительно проседает производительность, то **всегда используйте данную настройку непосредственно в самой игре**, в противном случае рекомендуется использовать утилиту `RTSS` <sup>[[скачать]](https://github.com/denis-g/windows10-latency-optimization/blob/master/_content/links.md#утилиты-используемые-в-гайде)</sup>, т.к. именно так можно добиться наименьшего инпут-лага <sup>[[?]](https://www.reddit.com/r/Competitiveoverwatch/comments/9vcxz5/rtss_vs_ingame_fps_cap_or_frame_limit/)</sup>.

> :warning: Начиная с версии драйвера nVidia 461.09, установка `Вертикальный синхроимпульс` в `Выкл.` в качестве глобального параметра в `nVidia Control Panel
`, скорее всего, будет приводить к разрыву изображения из-за смены на новый режим наложения <sup>[[Проблемы с V-Sync]](https://www.guru3d.com/news_story/nvidia_v_sync_off_not_recommended_as_a_global_setting_starting.html)</sup>. **Рекомендуется** использовать параметр равный `Использовать настройку 3D-приложения`.

![](https://github.com/denis-g/windows10-latency-optimization/blob/master/images/hr.png)

### Настройки лаунчеров

По возможности надо стараться **отключить все оверлеи** и оставить только оверлей, например, в Steam, если вы им пользуетесь как основным - их наличие так или иначе добавляют инпут-лаг. Так же не лишним будет отключить все настройки связанные с интерфейсом, где используется GPU.

Пример настроек Steam:

![Пример настроeк Steam](https://github.com/denis-g/windows10-latency-optimization/blob/master/screenshots/steam_01.png)
![Пример настроeк Steam](https://github.com/denis-g/windows10-latency-optimization/blob/master/screenshots/steam_02.png)

Пример настроек EA Connect:

![Пример настроeк Origin](https://github.com/denis-g/windows10-latency-optimization/blob/master/screenshots/eaconnect_01.png)

Пример настроeк UbiSoft Connect:

![Пример настроeк UbiSoft Connect](https://github.com/denis-g/windows10-latency-optimization/blob/master/screenshots/ubisoftconnect_01.png)

![](https://github.com/denis-g/windows10-latency-optimization/blob/master/images/hr.png)

### Настройка Oculus VR

Для того чтобы значительно улучшить качество картинки в Oculus VR рекомендуется использовать утилиту `Oculus TrayTool (OTT)` <sup>[[скачать]](https://github.com/denis-g/windows10-latency-optimization/blob/master/_content/links.md#утилиты-используемые-в-гайде)</sup>. С помощью неё можно снизить замыливание и повысить чёткость изображения используя уже готовые пресеты для видеокарт или же установив свои параметры.

Пример настройки `Oculus TrayTool (OTT)`:

![Пример настройки Oculus TrayTool (OTT)](https://github.com/denis-g/windows10-latency-optimization/blob/master/screenshots/oculustraytool_01.png)

Так же, если вы не используете шлем в данный момент, можно остановить сервисы Oculus для освобождения ресурсов.

Управление сервисами в `Oculus TrayTool (OTT)`:

![Управление сервисами в Oculus TrayTool (OTT)](https://github.com/denis-g/windows10-latency-optimization/blob/master/screenshots/oculustraytool_02.png)

Кроме этого через утилиту можно настроить Oculus Home, менять схемы электропитания по заданным параметрам и многое другое.
