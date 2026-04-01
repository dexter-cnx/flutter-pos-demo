# Design Specification: The Luminescent Slate

This document outlines the design system for **thai-pos-demo**, extracted from the **Google Stitch** project: `flutter-pos-demo`.

---

## 1. Creative Vision: "The Neon Monolith"
The design moves away from cluttered, utility-first POS systems toward a high-end, editorial experience. It prioritizes **Intentional Asymmetry** and **Tonal Depth** over traditional grid systems and borders.

- **Objective:** Premium, modern, and dark-themed Thai POS.
- **Atmosphere:** Deep shadows, digital bioluminescence, and editorial breathing room.

---

## 2. Color Palette
The system is built on the interplay between the void (`surface`) and the electric pulse (`primary`).

### Core Tokens
| Token | Hex Code | Usage |
| :--- | :--- | :--- |
| **Primary** | `#6feff8` | High-frequency actions, "Pay Now", active states. |
| **Primary Container**| `#14b2ba` | Gradient components and frosted glass effects. |
| **Surface (Base)** | `#080f17` | Infinite dark background canvas. |
| **Surface-Low** | `#0d141d` | Secondary sidebars, product grid background. |
| **Surface-High** | `#1e2632` | Active interactive cards, selected items. |
| **Success** | `#4E9F3D` | Checkout confirmation, positive updates. |
| **Error** | `#ff716c` | Destructive actions, void transaction, fatal errors. |
| **On-Surface** | `#ebf1fd` | Chief text color (avoids eye strain in dark mode). |
| **On-Surface-Var** | `#a5abb7` | Secondary metadata (SKU, Category). |

### Signature: The "No-Line" Rule
> [!IMPORTANT]
> **Do not use 1px solid borders.** Separation of UI sections must be achieved through **background color shifts** or **spacing gaps** rather than hard lines.

---

## 3. Typography: Editorial Authority
The system uses **Noto Sans Thai** (Be Vietnam Pro in tokens) for a modern, loopless aesthetic.

| Scale | Size (pt/rem) | Usage |
| :--- | :--- | :--- |
| **Display-LG** | `56px / 3.5rem` | Total Price/Amount (The Statement). |
| **Headline-MD** | `28px / 1.75rem`| Product Categories, Page Titles. |
| **Title-LG** | `22px / 1.375rem`| Product Names (Optimized for Thai vertical scale). |
| **Title-SM** | `14px / 0.875rem`| SKU, Unit Price, Secondary info. |
| **Body-LG** | `16px / 1rem` | Itemized product lists (Minimum for POS). |

- **Line Height:** Minimum `1.6` for all Thai text to prevent "glyph clipping" of tone marks.
- **Letter Spacing:** `-2%` on Headlines for a "tight" editorial look.

---

## 4. Spacing, Radius & Elevation
- **Spacing Scale:** Multiple of 4 (Base 8px). Standard gaps are 16px (`4`) and 24px (`6`).
- **Corner Radius:**
    - `rounded-xl` (24px / 1.5rem): Main containers, product cards.
    - `rounded-lg` (16px / 1rem): Internal elements, buttons.
- **Elevation:** Hierarchy is conveyed through **Physicality and Light**. Use tonal tiers (`surface-low` -> `surface-high`) instead of drop shadows. Ambient shadows are reserved only for modal dialogues (32px blur, 6% opacity).

---

## 5. Component Library

### Buttons (Tactile Kit)
- **Primary FAB / Action:** Gradient from `#6feff8` to `#14b2ba` (135°).
- **Secondary:** Surface-tier shifts (e.g., `surface-high`) with no border.
- **Min Height:** **64px** (Gold standard for rapid, fat-finger POS input).
- **Radius:** `rounded-xl` (24px).

### Product Cards
- **Structure:** `surface-high` container with 12px vertical spacing between items.
- **Feedback:** On touch, cards transition to `primary-dim` at 10% opacity (soft pulse).
- **No Borders:** Use white space and contrast to define the card edge.

### The "Command Bar" (Cart Sidebar)
- **Background:** `surface-low` with a `backdrop-filter: blur(12px)`.
- **Layout:** Floating sheet that slightly overlaps the product grid to imply depth.

---

## 6. Layout Rules (Tablet Landscape)
- **Mode:** 1280x800 Landscape (Standard POS Tablet).
- **Structure:** Split layout.
    - **Left (65%):** Product Grid (Adaptive cards, large touch targets).
    - **Right (35%):** Cart Management & Checkout action (Fixed sidebar).
- **Responsiveness:** Maintain 16px gutter margins on all edges.

---

## 7. Screen Inventory (Designed in Stitch)
1.  **Dashboard/Main:** Snapshot of daily sales and quick actions.
2.  **Login:** PIN-based entry with large number pad.
3.  **Main POS:** Split layout with product categories and active cart.
4.  **Inventory:** Searchable list of stock items with status pills.
5.  **History:** Tabbed view of past sales and receipt re-printing.
6.  **Checkout:** Full-screen modal for payment methods (Cash/QR/Card).
7.  **Receipt Preview:** Digital twin of the thermal printout.
8.  **Product Customization:** Add toppings/options to an item.
9.  **System Settings:** Technical config (Printer, VAT 7%, etc.).

---

## 8. Development Implementation Notes (Flutter)
- **Material 3:** Enabled (`useMaterial3: true`).
- **Surface Tint:** Disabled or set to transparent to respect the "Neon" theme.
- **Accessibility:** Touch targets must be at least **64dp** for primary flow buttons.
- **Font:** Google Fonts `Noto Sans Thai` or `Sarabun`.

> [!TIP]
> Use `backdrop-filter: ImageFilter.blur` for the Cart Sidebar to achieve the "glass" premium effect.
