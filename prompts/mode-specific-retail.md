Read `AGENTS.md` first and follow it strictly.

Task:
Implement the **retail mode-specific features** for `flutter-pos-demo` on top of the existing shared platform and mode architecture foundation.

Context:
The app is being evolved into a multi-mode POS system.
This task focuses only on the **retail business mode** and should preserve a clean separation between:
- shared platform capabilities
- business mode architecture
- retail-specific features

Main objective:
Make `retail` the first fully working baseline business mode with a solid end-to-end sales flow.

Target retail flow:
- browse products
- search/filter products
- add/remove/update cart items
- optional barcode-ready structure
- checkout
- payment summary
- receipt preview / receipt printing hook
- order history
- basic inventory visibility

Important scope rules:
- Focus on retail only
- Do NOT implement restaurant flows
- Do NOT add table management
- Do NOT add buffet/headcount logic
- Do NOT add split bill
- Do NOT redesign shared platform unnecessarily
- Reuse shared printer/receipt/payment/settings/app shell infrastructure
- Keep business logic out of widgets

Architecture constraints:
- Keep Clean Architecture
- Keep Riverpod
- Keep go_router
- Keep Isar
- Keep current shared platform abstractions
- Use retail mode definition/capabilities rather than hardcoded assumptions where reasonable
- Prefer small focused files

Expected deliverables:
1. Retail POS main screen polish
2. Retail product catalog flow
3. Retail cart flow
4. Retail checkout flow stabilization
5. Retail pricing engine implementation
6. Retail receipt composer implementation
7. Retail order history integration
8. Basic retail inventory support
9. Barcode-ready scaffolding only if minimal and clean
10. Retail seed data completion

Suggested feature areas:

lib/features/
  catalog/
  cart/
  checkout/
  receipt/
  payment/
  order_history/
  inventory/

lib/modes/retail/
  retail_mode_definition.dart
  retail_seed_data.dart

Detailed implementation requirements:

## 1. Retail business behavior

Retail mode should behave like a classic counter-sale POS.

Core characteristics:
- product-first UI
- fast add-to-cart
- quantity adjustments
- subtotal / VAT / total
- cash/card/PromptPay placeholder handling
- receipt after checkout
- order history
- inventory visibility

Do not introduce restaurant mental models into retail screens.

## 2. Retail POS main screen

Implement or refine the retail main POS screen.

Expected layout:
- product grid/list area
- optional category filter/search area
- cart sidebar or cart pane
- checkout action area

Requirements:
- tablet-friendly layout
- easy add-to-cart flow
- clear empty/loading/error states
- use shared shell if already available
- avoid business logic in UI widgets

## 3. Product catalog flow

Implement or stabilize retail product browsing.

Requirements:
- list/grid of products
- category filtering if practical
- search support if practical
- product image support if available in current models
- price display
- stock visibility can be simple

Rules:
- keep catalog shared where possible
- retail-specific behavior can live in retail-facing providers/use cases
- avoid duplicating shared product models unnecessarily

## 4. Cart flow

Implement or stabilize retail cart behavior.

Requirements:
- add product to cart
- increment/decrement quantity
- remove line item
- clear cart
- compute derived values through proper services/providers
- support quantity validation

Rules:
- keep totals logic out of widgets
- cart state should be testable
- do not tightly couple cart to checkout widget tree

## 5. Retail pricing engine

Implement the real retail pricing engine.

Required pricing responsibilities:
- subtotal
- VAT 7%
- optional discount hook if already present or easy to add cleanly
- total
- tendered amount
- change amount

Create or finalize:
- `OrderPricingEngine`
- `RetailPricingEngine`

Rules:
- do not add restaurant pricing logic here
- keep implementation focused and deterministic
- use shared `Money` / shared value objects if available

## 6. Retail checkout flow

Implement or stabilize checkout for retail mode.

Required:
- payment method selection using shared payment framework
- finalize transaction
- show totals clearly
- support cash tendered and change
- keep placeholder support for PromptPay/card if current repo already expects it
- allow checkout success without printer configured
- optional prompt to print receipt after successful checkout

Rules:
- no direct Bluetooth/plugin calls in checkout UI
- checkout success must remain valid even if print fails
- payment finalization should be reusable

## 7. Retail receipt composer

Implement the real retail receipt composition.

Required receipt content:
- store name
- transaction id
- date/time
- line items
- subtotal
- VAT 7%
- total
- payment method
- tendered amount/change when relevant
- footer note

Requirements:
- use shared receipt/document pipeline
- return receipt document / ESC_POS bytes through the correct abstraction
- support printer flow integration through shared printer service

Rules:
- keep it retail-specific
- do not build restaurant receipt sections here

## 8. Order history

Implement or stabilize retail order history using shared history framework.

Requirements:
- list past transactions
- show date/time
- show totals
- allow opening details or preview if practical
- support empty state
- ensure completed retail transactions are persisted properly

Rules:
- history screen framework can be shared
- retail-specific filtering can remain minimal

## 9. Basic inventory support

Implement only the minimum useful retail inventory support.

Required:
- stock quantity display or availability visibility
- decrement stock on successful sale if inventory is already part of the design
- basic low-stock-ready structure if clean

Do not overbuild:
- no advanced stock transfer
- no purchasing module
- no warehouse complexity

Rules:
- keep this simple and demo-appropriate
- if full decrement flow is too invasive, at minimum create clean inventory-ready hooks and visibility

## 10. Barcode-ready scaffolding

Implement only minimal retail barcode scaffolding if it can be done cleanly.

Allowed:
- barcode field on product model if needed
- lookup-ready use case/provider
- placeholder route or action for future scan flow

Not required:
- full scanner UX
- advanced barcode workflow

If barcode implementation would destabilize the task, keep it as clean scaffolding only.

## 11. Retail seed data

Create or complete retail seed data.

Seed should include:
- realistic Thai retail demo products
- categories
- prices
- optional stock quantities
- optional barcode values
- enough sample data for meaningful UI demo

Rules:
- keep seed data coherent and realistic
- do not mix restaurant items/tables into retail seed

## 12. Integration with mode architecture

Ensure retail mode definition is correctly wired to:
- retail capabilities
- retail nav items
- retail routes
- retail pricing engine
- retail receipt composer
- retail seed data strategy

Retail mode should become the strongest and most complete working mode after this task.

## 13. Routing expectations

Retail routes may include:
- `/pos`
- `/checkout`
- `/history`
- `/inventory`
- `/settings`

Use current app routing structure where possible.
Do not overcomplicate route setup.

## 14. Persistence expectations

Ensure retail flows persist what they should:
- completed transactions
- payment summary
- optional receipt snapshot if architecture supports it
- stock changes if implemented
- seed data state as needed

Do not leak storage details into UI.

## 15. Code quality requirements

- small focused files
- no giant god provider
- no business logic in widgets
- clear naming
- clean provider boundaries
- no dead code
- minimal comments
- consistent with repo style

## 16. Scope control

Allowed:
- retail POS main flow
- retail pricing
- retail receipt
- retail history
- basic inventory
- minimal barcode scaffolding
- retail seed data

Not allowed:
- restaurant flow
- buffet/headcount logic
- table management
- split bill
- kitchen ticket
- deep warehouse functionality
- major unrelated redesigns

## 17. Verification checklist

Before finishing, ensure:
- retail flow works end-to-end
- product -> cart -> checkout -> transaction -> history is coherent
- pricing is not in widgets
- receipt composition is retail-specific and clean
- app still works without printer configured
- inventory handling does not break checkout flow
- no obvious import/provider/route mismatches remain

## 18. Final output format

At the end, provide:
1. Task Summary
2. Files Created
3. Files Modified
4. Key Design Notes
5. Manual Setup Required
6. Risks / Tradeoffs
7. Next Recommended Step