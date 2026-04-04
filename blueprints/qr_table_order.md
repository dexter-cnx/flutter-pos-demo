# QR Table Order Blueprint

## 1. Purpose

Enable customers to place orders via QR codes at their tables, allowing for a contactless ordering experience in restaurant mode. This feature complements the existing POS system while maintaining offline-first capabilities for core POS operations.

## 2. Goals

- Provide customers with a convenient way to order food and drinks via QR codes
- Maintain offline-first core POS functionality for staff operations
- Support restaurant mode with table-specific order management
- Enable seamless integration between customer QR ordering and staff POS
- Ensure secure, tokenized QR links to prevent unauthorized access
- Allow fallback to traditional POS ordering when QR system is unavailable

## 3. Non-Goals

- Complete replacement of the staff POS system
- Real-time synchronization with external inventory systems (beyond local Isar)
- Advanced restaurant management features beyond ordering
- Integration with third-party payment processors
- Support for multiple concurrent orders per table (MVP)

## 4. User Flows

### Customer Flow
1. Customer scans QR code at table
2. Customer views menu and adds items to order
3. Customer reviews order and submits
4. Order appears in staff POS system immediately
5. Staff can view and process the order in real-time

### Staff Flow
1. Staff sees new QR order in POS system
2. Staff processes order as normal
3. Order status updates in both systems
4. Receipt generated and sent to customer

## 5. System Boundaries

- **Customer Side**: QR scanner, mobile browser, web interface
- **Staff Side**: POS application, Isar database, staff devices
- **Network Boundary**: External API for order synchronization (when available)
- **Offline Boundary**: Local Isar database for all core functionality

## 6. Offline / Network Model

- **Offline First**: Core POS functionality remains fully functional offline
- **Network Dependent**: QR ordering requires network connection for order submission
- **Fallback**: When network unavailable, QR orders are queued locally and synced when connection returns
- **Local Sync**: Orders placed via QR are immediately available in staff POS when online

## 7. Feature Scope by Phase

### Phase 1 — MVP
- QR code generation for each table
- Secure tokenized links (not predictable IDs)
- Customer menu display
- Order submission to staff POS
- Basic order status tracking
- Local queueing when offline
- Fallback to traditional POS

### Phase 2
- Order modification capabilities
- Special requests and notes
- Customer feedback collection
- Menu categorization and filtering
- Order history for customers

### Phase 3
- Integration with external inventory
- Real-time menu updates
- Customer loyalty integration
- Analytics dashboard for staff
- Multi-language support

## 8. Domain Model

- **Table**: Represents a physical table in the restaurant
- **Order**: Customer order associated with a table
- **OrderItem**: Individual items in an order
- **Menu**: Collection of available products
- **Session**: Active ordering session for a table
- **QRCode**: Tokenized link for table ordering

## 9. Data Model Recommendations

### Table Model
```dart
@collection
class TableModel {
  Id id = Isar.autoIncrement;
  late String tableNumber;
  late bool isAvailable;
  final currentOrder = IsarLink<OrderModel>();
}
```

### Order Model
```dart
@collection
class OrderModel {
  Id id = Isar.autoIncrement;
  late DateTime createdAt;
  late DateTime? completedAt;
  late OrderStatus status;
  final table = IsarLink<TableModel>();
  final items = IsarLinks<OrderItemModel>();
  late bool isFromQR;
}
```

### QRCode Model
```dart
@collection
class QRCodeModel {
  Id id = Isar.autoIncrement;
  late String token; // Secure token instead of table ID
  final table = IsarLink<TableModel>();
  late DateTime createdAt;
  late DateTime? expiresAt;
  late bool isActive;
}
```

## 10. Security / Link Design

- **Tokenization**: Use secure, random tokens instead of predictable table IDs
- **Expiration**: QR codes should have time-based expiration (1 hour)
- **Validation**: Each QR code token must be validated against the database
- **Access Control**: Only valid tokens can access the ordering system
- **Session Management**: Token-based sessions with proper lifecycle management

## 11. Customer Experience Design

- Simple, intuitive menu interface
- Real-time order status updates
- Clear feedback on order submission
- Option to modify or cancel orders before submission
- Receipt generation after order completion
- Responsive design for mobile devices

## 12. Staff / POS Experience Design

- Orders from QR appear in the main POS system
- Clear indication that order came from QR
- Same checkout flow as traditional orders
- Ability to view order details and special requests
- Integration with existing staff workflows
- Order status tracking in real-time

## 13. Menu Rules for QR Ordering

- Only available products should be shown
- Menu categories should be organized for easy navigation
- Product images should be displayed
- Pricing should be clearly visible
- Stock levels should be reflected in real-time
- Special offers or promotions should be highlighted

## 14. Pricing Implications

- Pricing should be consistent with main POS
- No additional fees for QR ordering
- Tax calculations should be handled the same way
- Promotions and discounts should apply to QR orders
- Currency should be consistent across all ordering methods

## 15. Receipt / Checkout Implications

- Receipt generation should be identical for QR and traditional orders
- Order number should be consistent
- Payment processing should work the same way
- Order history should include QR orders
- Customer receipt should be available via QR code scanning

## 16. Recommended Architecture Placement

- **Feature Module**: Create `qr_ordering` feature module
- **Data Layer**: QRCode repository, Table repository, Order repository
- **Domain Layer**: QR ordering use cases, table management
- **Presentation Layer**: QR ordering UI, table selection screens
- **Integration**: Network service for order submission (when online)

## 17. Backend / API Expectations

- RESTful API for order submission
- Authentication for QR code access
- Real-time order updates
- Error handling for network issues
- Rate limiting to prevent abuse
- Secure token generation

## 18. Suggested Repository Blueprint

```
lib/
├── features/
│   └── qr_ordering/
│       ├── data/
│       │   ├── models/
│       │   │   ├── qr_code_model.dart
│       │   │   └── table_model.dart
│       │   └── repositories/
│       │       ├── qr_code_repository.dart
│       │       └── table_repository.dart
│       ├── domain/
│       │   ├── use_cases/
│       │   │   ├── generate_qr_code.dart
│       │   │   └── submit_order.dart
│       │   └── entities/
│       │       ├── qr_code.dart
│       │       └── table.dart
│       ├── presentation/
│       │   ├── pages/
│       │   │   ├── qr_ordering_page.dart
│       │   │   └── table_selection_page.dart
│       │   └── widgets/
│       │       ├── qr_scanner_widget.dart
│       │       └── order_summary_widget.dart
│       └── service/
│           └── qr_ordering_service.dart
```

## 19. Risks and Edge Cases

- **Network Failure**: Orders should queue locally when offline
- **Invalid Tokens**: Proper validation and error handling needed
- **Concurrent Access**: Multiple customers at same table should be handled
- **Token Expiration**: System should handle expired tokens gracefully
- **Data Synchronization**: Ensure data consistency between systems
- **Security**: Prevent unauthorized access to QR codes
- **Performance**: Handle high volume of concurrent orders

## 20. MVP Acceptance Criteria

- [ ] QR codes can be generated for each table
- [ ] QR codes are secure and tokenized
- [ ] Customer can view menu and place orders
- [ ] Orders appear in staff POS immediately when online
- [ ] Orders can be placed offline and synced when online
- [ ] Fallback to traditional POS works when QR system is unavailable
- [ ] Order status updates are consistent across systems
- [ ] Receipt generation works for QR orders

## 21. Recommended Next Steps

1. Create QR ordering feature module with basic data models
2. Implement QR code generation service with secure tokenization
3. Develop customer-facing ordering interface
4. Create network service for order submission
5. Implement local queueing for offline orders
6. Design fallback mechanism for offline scenarios
7. Integrate with existing POS system for order display
8. Test offline and online scenarios
9. Implement security measures for QR code access
10. Create documentation for staff and customers