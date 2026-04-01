# AGENTS.md

**Project:** thai-pos-demo  
**Type:** Flutter POS Demo (Offline-First)  
**Architecture:** Clean Architecture + Riverpod + go_router  
**Localization:** CSV-first  
**Target:** Demo สำหรับร้านค้าไทย (ไม่เชื่อม Backend จริง แต่โครงสร้างพร้อม)

This file defines the **repo-wide operating rules** for all Agent Teams (Antigravity, Claude, Grok, Codex ฯลฯ) ที่จะทำงานในโปรเจกต์นี้

---

## 1. Repository Purpose

โปรเจกต์นี้เป็น **POS Demo** สำหรับร้านค้า/ร้านอาหารเล็กในประเทศไทย  
- เน้น **Offline-First** ด้วย Isar  
- ใช้โครงสร้างจาก `evan361425/flutter-pos-system` เป็นแรงบันดาลใจ แต่สร้างใหม่ทั้งหมดด้วย **Clean Architecture**  
- **ไม่มี Backend จริง** แต่มี abstract Repository พร้อมสำหรับอนาคต (REST / Firebase / GraphQL)

---

## 2. Default Tech Stack (ห้ามเปลี่ยนโดยไม่ได้รับอนุมัติ)

- Flutter (latest stable)
- **Riverpod 2.x** (with code generation)
- **go_router** + go_router_builder
- **Material 3**
- **CSV-first localization** (`assets/i18n/translations.csv`)
- **Isar** สำหรับ local database (offline-first)
- Clean Architecture: `presentation / domain / data`
- Packages หลัก: freezed, json_serializable, build_runner, flutter_screenutil, pdf, mobile_scanner, printing

---

## 3. Architecture Rules (ต้องปฏิบัติตามเคร่งครัด)

- **presentation/** → UI + State (Riverpod) + Screens + Widgets
- **domain/** → Entities, UseCases, Repository contracts (abstract)
- **data/** → Models (Isar), Repository implementations, Datasources
- ห้ามใส่ business logic, API call, JSON parsing ใน Widget
- ทุก feature ต้องมี Repository Pattern (Local + Future Remote)
- ใช้ **small reusable widgets** มากกว่า monolithic screen

---

## 4. UI & Design Rules

- ใช้ UI ที่ได้จาก **Google Stitch** เป็นหลัก (Modern, Clean, Professional, ปุ่มใหญ่ เหมาะกับแท็บเล็ต)
- รองรับ **Tablet Landscape** เป็นหลัก (POS style)
- ภาษาไทยเต็มรูปแบบ (ฟอนต์อ่านง่าย)
- Explicit states: loading / empty / error / success
- Token-driven styling (colors, spacing, radius)
- Accessibility พิจารณา (tap target, semantics)

---

## 5. Localization Rules

- ใช้ **CSV-first** workflow จาก toolkit
- Single source of truth: `assets/i18n/translations.csv`
- ห้าม hardcode ข้อความภาษาไทย/อังกฤษในโค้ด
- รองรับอย่างน้อย `th` และ `en`

---

## 6. State Management & Routing

- **Riverpod** สำหรับทุก state (providers, notifiers, codegen)
- **go_router** สำหรับ routing ทั้งหมด
- เก็บ state ใกล้กับ feature boundary ให้มากที่สุด
- ห้ามใช้ setState หรือ global mutable state

---

## 7. Development Workflow (สำหรับ Agent Teams)

ทุกครั้งที่ทำงาน:
1. อ่านไฟล์นี้ (`AGENTS.md`)
2. อ่าน `antigravity/rules/00-read-order.md` → `global.md` → `flutter.md`
3. ใช้ workflow จาก `antigravity/workflows/`
4. ใช้ skill และ template จาก toolkit
5. หลังทำเสร็จแต่ละ feature ต้องรัน:
   - `flutter pub get`
   - `dart format .`
   - `flutter analyze`
   - `flutter test` (ถ้ามี)

---

## 8. Demo Scope (สิ่งที่ต้องมี)

**Must Have:**
- PIN / Simple Login
- POS Main Screen (Product Grid + Cart Sidebar)
- Cart management + VAT 7%
- Checkout (เงินสด / QR PromptPay / บัตร) + คำนวณเงินทอน
- Receipt Preview + PDF + Print simulation
- Order History
- Seed Data (15 สินค้าไทย) อัตโนมัติตอนแรกเปิดแอป

**Nice to Have:**
- Simple Analytics
- Inventory (สต็อกเบื้องต้น)

---

## 9. Output Format

ทุกครั้งที่ Agent ตอบ ควรมีโครงสร้างดังนี้:
1. **Task Summary**
2. **Files Created / Modified**
3. **Verification Result** (ผลการรัน flutter commands)
4. **Next Recommended Step**
5. **Artifacts** (ตาม `antigravity/artifacts/`)

---

**สำคัญ:**  
ไฟล์นี้เป็น **durable rules**  
Task-specific instructions ให้นำไปใส่ใน prompt แต่ละงานหรือ workflow แยกต่างหาก

---

**Last updated:** April 2026  
**Owner:** thai-pos-demo Project