REM Windows 10 Latency Optimization
REM https://github.com/denis-g/windows10-latency-optimization/
REM Denis G. <https://github.com/denis-g>

REM ---

REM Отключение таймера HPET
REM https://github.com/denis-g/windows10-latency-optimization/blob/master/_content/latency.md#отключение-таймера-hpet

bcdedit /set disabledynamictick no > nul
bcdedit /set useplatformtick no > nul

REM ---

REM Настройка схемы электропитания
REM https://github.com/denis-g/windows10-latency-optimization/blob/master/_content/windows.md#настройка-схемы-электропитания

powercfg -delete e9a42b02-d5df-448d-aa00-03f14749eb61
