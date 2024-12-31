#!/bin/bash

# Ruxsat talab qilish
if [ "$(id -u)" -ne 0 ]; then
  echo "Iltimos, skriptni superuser huquqlari bilan ishga tushiring (sudo)."
  exit 1
fi

echo "Flesh kartalarni aniqlayapman..."
lsblk

# Qurilmani tanlash
read -p "Flesh karta qurilmasini kiriting (masalan, /dev/sdX): " device

# Qurilmani tekshirish
if [ ! -b "$device" ]; then
  echo "Noto‘g‘ri qurilma: $device. Tekshirib qayta urinib ko‘ring."
  exit 1
fi

# Ogohlantirish
read -p "$device qurilmasini FORMATLAShGA tayyormisiz? (ha/yo'q): " confirm
if [ "$confirm" != "ha" ]; then
  echo "Amal bekor qilindi."
  exit 0
fi

# Qurilmani o‘chirish
echo "Flesh karta ichidagi barcha ma’lumotlarni o‘chiryapman..."
wipefs -a "$device"
if [ $? -ne 0 ]; then
  echo "Qurilmani tozalashda xatolik yuz berdi."
  exit 1
fi

# Formatlash
echo "Flesh kartani formatlash..."
mkfs.vfat "$device" -n MY_USB
if [ $? -ne 0 ]; then
  echo "Formatlashda xatolik yuz berdi."
  exit 1
fi

echo "Flesh karta muvaffaqiyatli formatlandi!"
lsblk | grep "$device"

exit 0
