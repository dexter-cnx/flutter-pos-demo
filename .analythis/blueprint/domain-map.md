# Domain Map

## Entities

### Audit
- Description: Likely domain entity inferred from file path lib/features/settings/presentation/pages/audit_log_viewer_page.dart.
- Fields: name, title
- Rules:
  - business mutations should emit audit events

### Cart
- Description: Likely domain entity inferred from file path lib/features/pos/presentation/providers/cart_provider.dart.
- Fields: id, name, price, quantity
- Rules:
  - entity invariants should be validated

### Customer
- Description: Likely domain entity inferred from file path lib/features/customer/data/models/customer_model.dart.
- Fields: createdAt, email, id, name, phone
- Rules:
  - entity invariants should be validated

### Inventory
- Description: Likely domain entity inferred from file path lib/features/inventory/presentation/pages/inventory_page.dart.
- Fields: id, name, price, quantity, title
- Rules:
  - entity invariants should be validated

### Item
- Description: Likely domain entity inferred from file path lib/app/shell/app_nav_item.dart.
- Fields: None inferred
- Rules:
  - entity invariants should be validated

### Order
- Description: Likely domain entity inferred from file path antigravity/rules/00-read-order.md.
- Fields: None inferred
- Rules:
  - order status transitions should be controlled

### Payment
- Description: Likely domain entity inferred from file path lib/features/analytics/presentation/widgets/payment_pie_chart.dart.
- Fields: title
- Rules:
  - amount should be validated
  - payment status should be explicit

### Permission
- Description: Likely domain entity inferred from file path lib/shared/domain/entities/app_permission.dart.
- Fields: None inferred
- Rules:
  - entity invariants should be validated

### Product
- Description: Likely domain entity inferred from file path antigravity/workflows/examples/new-product-screen/README.md.
- Fields: createdAt, id, name, price, status, title, updatedAt
- Rules:
  - entity invariants should be validated

### Queue
- Description: Likely domain entity inferred from file path blueprints/queue_blueprint.md.
- Fields: createdAt, id, name, phone, status
- Rules:
  - entity invariants should be validated

### Role
- Description: Likely domain entity inferred from file path lib/shared/domain/entities/app_role.dart.
- Fields: name, role
- Rules:
  - entity invariants should be validated

### Store
- Description: Likely domain entity inferred from file path .DS_Store.
- Fields: None inferred
- Rules:
  - entity invariants should be validated

### Ticket
- Description: Likely domain entity inferred from file path lib/features/printer/domain/services/kitchen_ticket_service.dart.
- Fields: createdAt, quantity
- Rules:
  - entity invariants should be validated

### User
- Description: Likely domain entity inferred from file path lib/features/auth/data/models/user_model.dart.
- Fields: id, role
- Rules:
  - sensitive fields should not leak to UI

## Use Cases

### Checkout
- Actors: system
- Steps:
  - validate resource input
  - checkout resource
  - persist changes if applicable
- Related Entities: None

### Get
- Actors: system
- Steps:
  - validate resource input
  - get resource
  - persist changes if applicable
- Related Entities: None

### Get
- Actors: system
- Steps:
  - validate payment input
  - get payment
  - persist changes if applicable
- Related Entities: Payment

### Get
- Actors: system
- Steps:
  - validate product input
  - get product
  - persist changes if applicable
- Related Entities: Product

### Get
- Actors: admin, sales
- Steps:
  - validate customer input
  - get customer
  - persist changes if applicable
- Related Entities: Customer

### Get
- Actors: system
- Steps:
  - validate cart input
  - get cart
  - persist changes if applicable
- Related Entities: Cart

### Get
- Actors: system
- Steps:
  - validate permission input
  - get permission
  - persist changes if applicable
- Related Entities: Permission

### List
- Actors: system
- Steps:
  - validate resource input
  - list resource
  - persist changes if applicable
- Related Entities: None

### List
- Actors: system
- Steps:
  - validate product input
  - list product
  - persist changes if applicable
- Related Entities: Product

### List
- Actors: admin, sales
- Steps:
  - validate customer input
  - list customer
  - persist changes if applicable
- Related Entities: Customer

### Login
- Actors: system
- Steps:
  - validate resource input
  - login resource
  - persist changes if applicable
- Related Entities: None

### Search
- Actors: admin, sales
- Steps:
  - validate customer input
  - search customer
  - persist changes if applicable
- Related Entities: Customer

### Sync
- Actors: system
- Steps:
  - validate resource input
  - sync resource
  - persist changes if applicable
- Related Entities: None