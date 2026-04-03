# Architecture 05: Data Backup & Restore

> **Priority:** 🔴 High  
> **Modules:** `features/settings`, `app/services`

---

## 1. Current State

### ✅ Implemented
- **Persistence**: All business data resides in **Isar Database** (file-based, single directory).
- **Configuration**: `SettingsPage` provides basic application toggles.
- **Paths**: `path_provider` correctly identifies internal storage locations.

### ❌ Missing
- **Export Mechanism**: No way to extract local database state for safe-keeping.
- **Import/Restore**: No recovery tool for re-loading data onto a new device.
- **Automation**: No background or scheduled backup cycles.
- **Risk**: High risk of total data loss if the device is damaged or wiped.

---

## 2. Backup Strategy: Portable ZIP Archiving

### 2.1 Scope of Data
| Component | Source | Criticality |
|-----------|--------|-------------|
| Transactions | Isar `orderModels` | 🔴 Maximum |
| Inventory | Isar `productModels` | 🔴 High |
| Taxonomy | Isar `categoryModels` | 🔴 High |
| CRM | Isar `customerModels` | 🟡 Medium |
| Layouts | Isar `floorPlanModels` | 🟡 Medium |
| System Config | Isar `appSettings` | 🟡 Medium |

### 2.2 Archive Structure (.zip)
```
thai_pos_backup_2026-04-04.zip
├── manifest.json              ← Versioning, device info, and timestamp
├── data/
│   ├── orders.json            ← Collection exports in JSON format
│   ├── products.json
│   ├── customers.json
│   └── settings.json
└── assets/                    ← Local media (product images/logos)
    ├── p_001.webp
    └── store_logo.png
```

---

## 3. Service Layer Architecture

### 3.1 BackupService Logic
1.  **Serialization**: Iterates through Isar collections and converts them to JSON blobs.
2.  **Snapshotting**: Captures the current `DateTime` and device metadata.
3.  **Compression**: Uses the `archive` package to bundle JSON and assets into a single ZIP.
4.  **Security**: (Optional) AES-256 encryption for the ZIP file header.

### 3.2 RestoreService Logic
1.  **Integrity Check**: Validates the `manifest.json` version against the current app version.
2.  **Atomicity**: Performs a `writeTxn` clear then putAll. If any step fails, the transaction is rolled back.
3.  **Asset Restoration**: Re-links local file paths for images and logos.

---

## 4. UI/UX Interaction

### 4.1 Settings Section: Data Management
*   **Manual Export**: A prominent "Backup Now" button that triggers the ZIP creation and shares it via the native system share sheet.
*   **Restore Portal**: A "Restore from File" option that launches the `file_picker` to select valid archives.

### 4.2 Auto-Backup Scheduler
*   **Logic**: Triggered on app startup. Checks if the last successful backup is >24 hours old.
*   **Rotation**: Maintains the last 7 daily backups, automatically deleting the oldest to save space.

---

## 5. Implementation Roadmap

### Create
- `app/services/backup_service.dart`: The core zip/unzip and JSON logic.
- `app/services/auto_backup_scheduler.dart`: The 24-hour cycle logic.
- `features/settings/presentation/widgets/backup_progress_dialog.dart`: Visual feedback for I/O operations.

### Modify
- `order_model.dart` & others: Add standard JSON serialization mixins.
- `settings_page.dart`: Integrate the Backup & Sync section.
- `pubspec.yaml`: Add `archive`, `file_picker`, and `share_plus`.

---

## 6. Verification Criteria

- [x] Generated ZIP contains valid JSON and a readable `manifest.json`.
- [x] Restore process correctly repopulates the dashboard and history.
- [x] Confirmation dialog warns the user before overwriting existing data.
- [x] Auto-backup correctly cleans up old files (>7 days) automatically.
- [x] Error handling for corrupted or incompatible backup files.

---
*Last updated: April 2026*
