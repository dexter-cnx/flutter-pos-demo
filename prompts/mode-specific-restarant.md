Read `AGENTS.md` first and follow it strictly.

Task:
Implement the **restaurant mode-specific foundation and first usable restaurant flow** for `flutter-pos-demo` on top of the existing shared platform and mode architecture foundation.

Context:
The app is evolving into a multi-mode POS system.
This task focuses only on the **restaurant business mode** and should reuse:
- shared platform capabilities
- mode architecture
- shared printer / receipt / payment / settings / shell infrastructure

Main objective:
Add a clean, practical restaurant flow that proves the architecture works for a dine-in / buffet-capable POS without overbuilding the full restaurant system yet.

Target restaurant flow:
- view tables
- open a dining session
- assign headcount
- add menu items to a table session
- support buffet/headcount pricing hook
- support extra-charge item logic
- checkout a table
- compose restaurant receipt
- print prompt after checkout if printer is configured

Important scope rules:
- Focus on restaurant mode only
- Reuse shared platform and mode architecture
- Do NOT overbuild beyond the first usable restaurant flow
- Do NOT implement kitchen ticket unless minimal placeholder is needed
- Do NOT implement split bill fully
- Do NOT redesign shared platform unnecessarily
- Keep business logic out of widgets

Architecture constraints:
- Keep Clean Architecture
- Keep Riverpod
- Keep go_router
- Keep Isar
- Keep restaurant-specific business logic outside widgets
- Keep shared printer/receipt/payment/settings as shared infrastructure
- Use restaurant mode definition/capabilities instead of hardcoded app-wide assumptions
- Prefer small focused files

Expected deliverables:
1. Restaurant table management baseline
2. Restaurant dining session baseline
3. Restaurant headcount/buffet pricing foundation
4. Restaurant extra-charge item support
5. Restaurant checkout flow integration
6. Restaurant receipt composer implementation
7. Restaurant seed data completion
8. Minimal restaurant order history/reporting readiness if practical

Suggested feature areas:

lib/features/
  tables/
  dining/
  checkout/
  receipt/
  payment/
  order_history/
  reporting/

lib/modes/restaurant/
  restaurant_mode_definition.dart
  restaurant_seed_data.dart

Detailed implementation requirements:

## 1. Restaurant business behavior

Restaurant mode should behave like a dine-in/table-based POS.

Core characteristics:
- tables are the primary entry point
- sales happen inside a dining/table session
- pricing may include headcount/buffet logic
- some menu items may be included
- some menu items may be extra-charge
- checkout is tied to a table/session
- receipt must reflect restaurant context

Do not force retail mental models as the main UX in restaurant mode.

## 2. Table management baseline

Implement the first usable table management flow.

Required:
- table list/grid
- table status visibility
- at least a few statuses such as available / occupied / maybe cleaning
- open table / start session action
- enter a table session from the table UI

Rules:
- keep table model and state clean
- do not overbuild reservation or floor-plan complexity
- tablet-friendly layout preferred

## 3. Dining session baseline

Implement the core dining session concept.

Required:
- create/open session for a table
- attach headcount to the session
- add menu items to the session
- review session items
- keep session totals derived from proper services/use cases
- allow returning to an open session later

Rules:
- session state must not live only in widget state
- dining session should be persistable
- keep abstractions clean for future reopen/edit workflows

## 4. Headcount and buffet pricing foundation

Implement the architecture and first practical behavior for restaurant pricing.

Required:
- adult/child or equivalent headcount support if practical
- buffet/headcount pricing hook in restaurant pricing engine
- support included items vs extra-charge items
- pricing result must flow through checkout cleanly

Minimum acceptable first implementation:
- headcount can be modeled
- buffet pricing engine can add headcount charges
- extra items can add additional line charges
- included items contribute zero extra charge where appropriate

Rules:
- do not implement a giant rules engine
- do not overcomplicate plans/promotions
- keep restaurant pricing deterministic and testable

## 5. Menu item semantics for restaurant mode

Create the minimum restaurant-specific semantics needed for menu items.

Allowed:
- buffet included item flag or rule
- extra-charge item flag or rule
- category/grouping if useful
- restaurant seed data that reflects included vs extra items

Rules:
- avoid bloating shared product model if possible
- place restaurant-specific semantics in clean restaurant-specific entities/models where appropriate

## 6. Restaurant checkout flow

Implement restaurant checkout using shared payment framework.

Required:
- finalize payment for a table/session
- show pricing summary clearly
- include buffet/headcount and extras in totals
- support cash and placeholder card/PromptPay if current shared payment framework supports them
- allow successful checkout without printer configured
- prompt to print receipt after success if printer is configured

Rules:
- no direct Bluetooth/plugin calls from checkout UI
- printing failure must not invalidate payment success
- checkout should close/finalize the session cleanly

## 7. Restaurant receipt composer

Implement restaurant receipt composition.

Required receipt content:
- store name
- transaction/session id
- table number/name
- date/time
- headcount summary
- buffet charges
- extra-charge items
- subtotal
- tax if applicable to current app design
- total
- payment summary
- footer note

Requirements:
- use shared receipt/document pipeline
- keep restaurant formatting distinct from retail
- support printer flow integration through shared printer feature

Rules:
- do not mix retail receipt assumptions into restaurant receipt
- keep composer focused and clean

## 8. Restaurant order history/reporting readiness

Implement only the minimum needed to keep completed restaurant transactions visible and future-report-ready.

Required:
- completed restaurant transactions persist correctly
- history can show restaurant-origin transactions
- basic metadata such as table/session reference should be available if clean

Optional if easy:
- lightweight restaurant-oriented history display hints

Do not overbuild:
- no advanced analytics dashboard unless trivial
- no full table utilization system unless already very clean

## 9. Restaurant seed data

Create or complete restaurant seed data.

Seed should include:
- realistic table list
- table statuses
- buffet plans or pricing examples
- menu items
- included items
- extra-charge items
- enough sample data to demonstrate restaurant flow

Rules:
- keep seed data coherent
- do not mix retail demo products as the main restaurant seed without reason

## 10. Integration with mode architecture

Ensure restaurant mode definition is correctly wired to:
- restaurant capabilities
- restaurant nav items
- restaurant routes
- restaurant pricing engine
- restaurant receipt composer
- restaurant seed data strategy

Restaurant mode should become a real second mode, even if not fully feature-complete.

## 11. Routing expectations

Restaurant routes may include:
- `/tables`
- `/table/:id`
- `/dining/session/:sessionId`
- `/history`
- `/reports`
- `/settings`

Use current app routing structure where possible.
Placeholder routes/screens are acceptable only where needed for clean wiring.

## 12. Persistence expectations

Ensure restaurant flows persist what they should:
- tables
- table session state
- completed restaurant transactions
- payment summary
- optional receipt snapshot if architecture supports it

Rules:
- do not leak storage details into UI
- do not keep restaurant session state purely ephemeral

## 13. UI expectations

Preferred restaurant UX:
- table-first
- session-oriented
- tablet-friendly
- clear session summary
- easy return to open tables

Keep UI practical and focused.
Do not pursue elaborate restaurant UI polish beyond what is needed for a strong baseline.

## 14. Code quality requirements

- small focused files
- no giant god provider
- no business logic in widgets
- clear naming
- clean provider boundaries
- no dead code
- minimal comments
- consistent with repo style

## 15. Scope control

Allowed:
- table baseline
- dining session baseline
- restaurant pricing engine
- included vs extra item support
- restaurant checkout
- restaurant receipt
- restaurant seed data
- persistence needed for usable flow

Not allowed:
- full kitchen ticket
- full split bill
- reservations system
- floor plan designer
- advanced staff workflow
- deep analytics dashboard
- major unrelated redesigns

## 16. Verification checklist

Before finishing, ensure:
- restaurant mode has a coherent table -> session -> checkout -> history path
- pricing is not in widgets
- receipt composition is restaurant-specific and clean
- app still works without printer configured
- restaurant flow does not break retail flow
- no obvious import/provider/route mismatches remain

## 17. Final output format

At the end, provide:
1. Task Summary
2. Files Created
3. Files Modified
4. Key Design Notes
5. Manual Setup Required
6. Risks / Tradeoffs
7. Next Recommended Step