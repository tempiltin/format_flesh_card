# format_flesh_card

# USB Formatlash Skriptlari

Ushbu loyihada Linux va Windows operatsion tizimlari uchun flesh kartalarni tozalash va formatlash dasturlari taqdim etilgan. Skriptlar USB flesh kartalaringizni tezda tozalab, FAT32 formatida qayta formatlashga yordam beradi.

---

## Tizim talablari

### Linux:
- Bash terminali
- **sudo** huquqlari
- `lsblk`, `wipefs`, va `mkfs.vfat` vositalari o‘rnatilgan bo‘lishi kerak.

### Windows:
- **Administrator huquqlari** bilan ishga tushirish.
- Windows CMD yoki PowerShell.

---

## Foydalanish bo'yicha ko'rsatma

### **Linux uchun:**

1. **Skriptni yuklab oling:**
   Faylni `format_usb.sh` deb saqlang.

2. **Ruxsat bering:**
   ```bash
   chmod +x format_usb.sh
