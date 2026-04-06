# คู่มือการใช้งานระบบ Thai POS Foundation (TH)

## 🏗 ภาพรวมสถาปัตยกรรม (Architecture)
แอปพลิเคชันนี้ใช้ **Clean Architecture** ร่วมกับ **Riverpod** ในการจัดการ State และ **Isar** สำหรับการบันทึกข้อมูลแบบ Offline-First
- **Presentation**: ส่วนติดต่อผู้ใช้ (UI), Notifiers และ Providers
- **Domain**: ตรรกะทางธุรกิจ (Business Logic), Entities และ Repository Interfaces
- **Data**: ส่วนที่คุยกับฐานข้อมูล Isar (Repository Implementation)

---

## 🏬 1. ฟีเจอร์หลักสำหรับการขาย (Core Retail)
### 🛍 1.1 การขาย (POS) และเครื่องสแกนมือถือ (Mobile Scanner)
**ขั้นตอนการใช้งาน (Workflow):**
1. **เลือกสินค้า**: เปิดแท็บ **ขายหน้าร้าน (POS)** กรองสินค้าตามหมวดหมู่
2. **การสแกน**: กดไอคอน **กล้องสแกน (Scanner)** เพื่อใช้กล้องมือถือสแกนบาร์โค้ดหรือ QR Code ของสินค้าเพื่อเพิ่มเข้าตะกร้าทันที
3. **ตะกร้าสินค้า**: แตะที่ภาพสินค้าเพื่อเลือกใส่ตะกร้า (Manual) เลื่อนปรับจำนวนได้ที่แท็บด้านข้าง
**ไฟล์อ้างอิง (Relative):**
- [../lib/features/pos/presentation/pages/pos_page.dart](../lib/features/pos/presentation/pages/pos_page.dart)

### 📦 1.2 สต็อกและคลังสินค้า (Inventory)
**ขั้นตอนการใช้งาน (Workflow):**
1. **ตรวจสอบ**: เปิดแท็บ **คลังสินค้า (Inventory)**
2. **การแจ้งเตือน**: สินค้าสต็อกต่ำจะแสดงแถบสีแดง
3. **เติมของ**: เลือกสินค้าเพื่อทำการปรับสต็อก
**ไฟล์อ้างอิง (Relative):**
- [../lib/features/inventory/presentation/pages/inventory_page.dart](../lib/features/inventory/presentation/pages/inventory_page.dart)

---

## 🏬 2. โหมดการทำงาน (Retail vs Restaurant)
### ขั้นตอนการใช้งาน (Workflow):
1. **การเลือก**: ไปที่ **การตั้งค่า (Settings)** -> **โหมดการทำงาน (Business Mode)**
2. **โหมดร้านอาหาร**: แอปจะเพิ่มเมนู **ผังโต๊ะ (Tables)** รองรับการเปิดโต๊ะและลูกค้า
3. **โหมดค้าปลีก**: หน้าจอเน้นการขายสินค้าทั่วไป
**ไฟล์อ้างอิง (Relative):**
- [../lib/app/mode/business_mode_registry.dart](../lib/app/mode/business_mode_registry.dart)

---

## 💳 3. การชำระเงินและภาษี (Checkout & Finance)
### 💰 3.1 ช่องทางรับชำระ (Payments)
**ขั้นตอนการใช้งาน (Workflow):**
1. **เงินสด**: ระบุยอดเงินที่รับมา
2. **PromptPay (Thai QR)**: สร้าง QR Code ให้ลูกค้าสแกนจ่ายผ่านแอปธนาคาร
**ไฟล์อ้างอิง (Relative):**
- [../lib/features/checkout/presentation/pages/checkout_page.dart](../lib/features/checkout/presentation/pages/checkout_page.dart)

### 🇹🇭 3.2 เครื่องมือธุรกิจไทย (Thai Utils)
**ขั้นตอนการใช้งาน (Workflow):**
1. **สัญลักษณ์บาท**: จัดรูปแบบเงินด้วย ฿ อัตโนมัติ
2. **ภาษีมูลค่าเพิ่ม**: คำนวณ VAT 7% (รวม/แยกภาษี)
**ไฟล์อ้างอิง (Relative):**
- [../lib/core/money/thai_currency_formatter.dart](../lib/core/money/thai_currency_formatter.dart)
- [../lib/core/money/tax_calculator.dart](../lib/core/money/tax_calculator.dart)

---

## 📜 4. ฮาร์ดแวร์: เครื่องพิมพ์และใบเสร็จ (Hardware: Printer & Receipt)
### 🖨 4.1 การตั้งค่าเครื่องพิมพ์บลูทูธ (Bluetooth Printer)
**ขั้นตอนการใช้งาน (Workflow):**
1. **การเชื่อมต่อ**: ไปที่ **การตั้งค่า (Settings)** -> **การตั้งค่าเครื่องพิมพ์**. กดปุ่ม **รีเฟรช** เพื่อหาอุปกรณ์ Bluetooth ที่จับคู่ไว้
2. **เชื่อมโยง**: แตะ **เชื่อมต่อ (Connect)** บนเครื่องพิมพ์ความร้อน (Thermal Printer). เมื่อสำเร็จ สถานะจะเปลี่ยนเป็นสีเขียว
3. **ค่าเริ่มต้น**: กด **ตั้งเป็นค่าเริ่มต้น (Set as Default)** เพื่อให้แอปจำเครื่องพิมพ์นี้สำหรับการขายครั้งต่อไป
**ไฟล์อ้างอิง (Relative):**
- [../lib/features/printer/presentation/screens/printer_settings_screen.dart](../lib/features/printer/presentation/screens/printer_settings_screen.dart)

### 🎨 4.2 การออกแบบใบเสร็จ (Receipt Designer) และประวัติ
**ขั้นตอนการใช้งาน (Workflow):**
1. **การออกแบบ**: ในหน้าตัวจัดการเครื่องพิมพ์ กดเข้า **ออกแบบใบเสร็จ (Receipt Designer)** เพื่อเปิด-ปิดการแสดงผล โลโก้, เลขผู้เสียภาษี หรือข้อความท้ายใบเสร็จ
2. **พิมพ์ซ้ำ**: เปิดแท็บ **ประวัติ (History)** -> เลือกออเดอร์ -> กดปุ่ม **Reprint**
**ไฟล์อ้างอิง (Relative):**
- [../lib/features/printer/presentation/screens/receipt_designer_screen.dart](../lib/features/printer/presentation/screens/receipt_designer_screen.dart)
- [../lib/features/orders/presentation/pages/order_history_page.dart](../lib/features/orders/presentation/pages/order_history_page.dart)

---

## 🔐 5. ความปลอดภัยและสิทธิ์ (Security & Admin)
### 👮 5.1 ระบบพนักงาน (RBAC) และ Audit Trail
**ขั้นตอนการใช้งาน (Workflow):**
1. **สิทธิ์**: เข้าใช้งานด้วย PIN ที่ถูกต้อง. `PermissionGuard` จะคอยคัดกรองปุ่มกดหน้าจอ
2. **บันทึก**: ไปที่ **Settings** -> **Audit Log** เพื่อดูประวัติการเข้าใช้งานและกิจกรรมย้อนหลัง
**ไฟล์อ้างอิง (Relative):**
- [../lib/shared/presentation/widgets/permission_guard.dart](../lib/shared/presentation/widgets/permission_guard.dart)
- [../lib/shared/domain/services/audit_service.dart](../lib/shared/domain/services/audit_service.dart)

---

## ⚙️ 6. การซ่อมบำรุงและสำรองข้อมูล (Maintenance)
### ขั้นตอนการใช้งาน (Workflow):
1. **คิวงาน**: ใช้ **Job Queue Manager** ตรวจสอบและสั่งพิมพ์ซ้ำในรายการที่ล้มเหลว
2. **สำรองข้อมูล**: ส่งออกฐานข้อมูลด้วยตนเองผ่านเมนู **การตั้งค่า (Settings)**
**ไฟล์อ้างอิง (Relative):**
- [../lib/features/settings/presentation/pages/job_queue_viewer_page.dart](../lib/features/settings/presentation/pages/job_queue_viewer_page.dart)
- [../lib/features/settings/presentation/pages/settings_page.dart](../lib/features/settings/presentation/pages/settings_page.dart)
