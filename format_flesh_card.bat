@echo off
:: Administrator huquqlarini talab qiladi
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Iltimos, faylni Administrator huquqlari bilan ishga tushiring!
    pause
    exit /b
)

echo Hozir tizimdagi flesh kartalarni aniqlayapman...
wmic logicaldisk where drivetype=2 get deviceid, volumename, description

:: Qurilmani tanlash
set /p drive="Formatlash kerak bo'lgan flesh kartani tanlang (masalan, E:): "

:: Ogohlantirish
set /p confirm="%drive% ni FORMATLAShGA tayyormisiz? (ha/yo'q): "
if /i not "%confirm%"=="ha" (
    echo Amal bekor qilindi.
    pause
    exit /b
)

:: Formatlash
echo %drive% ni formatlashni boshlayapman...
format %drive% /FS:FAT32 /Q /V:MY_USB
if %errorlevel% neq 0 (
    echo Formatlashda xatolik yuz berdi.
    pause
    exit /b
)

echo %drive% muvaffaqiyatli formatlandi!
pause
exit /b
