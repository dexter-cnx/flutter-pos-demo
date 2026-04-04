# Customer Queue Calling System Blueprint

## 1. Purpose

The Customer Queue Calling System is a shared platform feature designed to manage customer flow in various business modes, starting with restaurant waiting queues. It provides a standardized way to track, manage, and display customer waiting status while supporting future integration with table assignments and other business-specific workflows.

This system is distinct from existing order and table management systems, serving as a foundational component that can be reused across different business modes like retail, service counters, and restaurants.

## 2. Goals

- Customer queue intake and number generation
- Queue number generation with configurable prefixes and reset policies
- Call next queue flow with visual and audible feedback
- Recall, skip, no-show, and served handling
- Queue display screen for customer visibility
- Restaurant waiting queue support with party size tracking
- Future reuse in other modes such as retail or service counter
- Offline-first operation with graceful network degradation
- Integration with restaurant table assignment and session creation

## 3. Non-Goals

- Full reservation system with date/time scheduling
- Advanced CRM or loyalty program integration
- Full push/SMS notification platform
- Advanced AI estimation engine for wait times
- Multi-branch orchestration and management
- Advanced staffing workflow management
- Integration with external queue management systems

## 4. Core Concepts

- **QueueTicket**: A single customer's entry in the queue with unique identifier and status
- **QueueStatus**: The current state of a queue ticket (waiting, called, served, no-show, skipped)
- **QueueZone/QueueGroup**: Logical grouping of queues for different areas or purposes
- **QueueNumber**: The unique identifier displayed to customers (e.g., A001, B005)
- **Called queue**: Currently being served or about to be served
- **Served queue**: Customer has completed their service
- **No-show queue**: Customer did not arrive for their turn
- **Relationship to table**: Queue tickets may later connect to table assignments in restaurant mode
- **Relationship to order**: Separate concepts - queue is about access to service, order is about transaction
- **Relationship to transaction/session**: Queue tickets may trigger session creation in restaurant mode

## 5. User Flows

### Staff Creates Queue Ticket
- Staff selects queue zone/group
- System generates unique queue number
- Ticket added to waiting queue list
- Display screen updates

### System Generates Queue Number
- Based on queue zone and configured numbering policy
- Unique within the zone
- Display-friendly formatting

### Customer Waits
- Customer sees queue number
- System tracks wait time
- Customer may check status via QR code (future)

### Staff Calls Next Queue
- Staff selects next waiting ticket
- System marks as called
- Display screen shows currently called ticket
- Optional audible alert

### Queue Display Updates
- Currently called queue number
- Recent called queue numbers
- Visual emphasis on current queue
- Optional sound/TTS

### Customer Comes -> Mark Served
- Staff marks ticket as served
- System logs completion
- Queue number can be reused

### Customer Absent -> Mark No-show or Skip
- Staff marks ticket as no-show
- System logs absence
- Queue number can be reused

### Optional Recall Flow
- Staff can recall last called ticket
- Useful for customer return or mistake correction

### Restaurant-Specific Future Flow
- Queue called -> table assigned -> table session created
- Integration with restaurant table management

## 6. Shared vs Mode-Specific Design

### Shared Queue Platform
- Core queue ticket management
- Queue status transitions
- Queue number generation logic
- Display screen functionality
- Offline-first operations
- Basic queue history/logging

### Restaurant Mode
- Table assignment integration
- Party size tracking
- Restaurant-specific display layouts
- Dining flow integration
- Session creation upon service completion

### Future Retail/Service Counter Use Cases
- Service counter queue management
- Appointment-based waiting
- Priority queue handling

## 7. Offline / Network Model

- Staff-side queue operations should work completely offline in core POS
- Queue display may work locally in-store with cached data
- Future QR/customer queue status may be network-assisted
- Graceful degradation: display should update when network reconnects
- Local data persistence for queue history and statistics
- Minimal network requirements for basic functionality

## 8. Feature Scope by Phase

### Phase 1 — MVP
- Create queue ticket functionality
- Generate queue numbers with unique identifiers
- List waiting queues
- Call next queue functionality
- Mark served status
- Mark no-show/skip status
- Queue display screen baseline with current queue

### Phase 2
- Recall queue functionality
- Queue zones/groups for logical grouping
- Party size tracking for restaurant mode
- Basic sound or TTS for queue announcements
- Better sorting and filtering of queues

### Phase 3
- QR check queue status functionality
- Estimated wait time calculation
- Restaurant table assignment integration
- Notification channels for customers
- Analytics and reporting capabilities

## 9. Domain Model

### QueueTicket
- Unique identifier (queue number)
- Customer information (name, phone, party size)
- Queue zone/group reference
- Status (waiting, called, served, no-show, skipped)
- Timestamps for creation, called, served, no-show
- Service point reference

### QueueZone/QueueGroup
- Unique identifier
- Name and description
- Numbering policy reference
- Display configuration

### QueueStatus
- Enum values: waiting, called, served, no-show, skipped

### QueueNumberPolicy
- Prefix configuration (e.g., "A", "B", "R")
- Reset policy (daily, shift-based)
- Numbering format (A001, B002)

### QueueEvent/QueueAction History
- Timestamp of action
- Action type (created, called, served, no-show, skipped, recalled)
- Staff member reference
- Queue ticket reference

### Optional PartySize
- Number of people in queue ticket
- Used for restaurant table assignment

### Optional CalledCounter/ServicePoint
- Reference to service point or counter
- Used for tracking where service is provided

## 10. Data Model Recommendations

### Queue Ticket Fields
- id (unique identifier)
- queueNumber (formatted display number)
- partySize (optional)
- status (QueueStatus enum)
- zoneId (reference to queue zone)
- customerId (optional reference)
- createdAt (timestamp)
- calledAt (timestamp)
- servedAt (timestamp)
- noShowAt (timestamp)
- skippedAt (timestamp)
- servicePointId (optional reference)
- notes (optional text)

### Queue Zone Fields
- id (unique identifier)
- name (display name)
- description (optional)
- numberingPolicyId (reference)
- displayConfig (configuration for display)

### Queue History/Event Log Fields
- id (unique identifier)
- queueTicketId (reference)
- actionType (QueueActionType enum)
- timestamp (when action occurred)
- staffId (reference to staff member)
- notes (optional text)

### Timestamps
- createdAt (when ticket created)
- calledAt (when called)
- servedAt (when served)
- noShowAt (when marked no-show)
- skippedAt (when skipped)

## 11. Queue Number Design

Queue numbers should be:
- Unique within each queue zone
- Display-friendly with clear formatting
- Configurable by zone (e.g., "A001", "B002", "R001")
- Resettable based on policy (daily, shift-based)
- Support for prefixes by business type or zone
- Easy to read and understand for customers

## 12. Queue Engine Rules

### Core Logic
- Create next queue number with unique identifier
- Call next waiting ticket in queue
- Recall last called ticket
- Mark served status
- Mark no-show status
- Validate legal state transitions

### State Transitions
- waiting → called → served or no-show
- waiting → called → skipped
- called → recalled (back to waiting)
- no-show or skipped → can be reset (for future use)

### Validation
- Prevent duplicate queue numbers
- Ensure state transitions are valid
- Prevent calling from multiple terminals simultaneously
- Handle stale data gracefully

## 13. Staff / POS Experience Design

### Staff Interface
- Waiting queue list with status indicators
- Called queue list with quick actions
- Filters and status tabs for easy navigation
- Queue screen behavior with clear visual hierarchy
- Practical UX for fast staff operations
- Quick actions for common operations

### Quick Actions
- Call next button
- Mark served
- Mark no-show
- Skip queue
- Recall last called
- Add new queue ticket

### Visual Design
- Clear status indicators (colors, icons)
- Prioritized display of current queue
- Easy to distinguish between statuses
- Responsive layout for different screen sizes

## 14. Queue Display Screen Design

### Display Elements
- Currently called queue number
- Recent called queue numbers
- Visual emphasis on current queue
- Optional sound/TTS for announcements
- Tablet/TV-friendly layout
- Minimal interaction required

### Visual Design
- Large, clear fonts for queue numbers
- Color-coded status indicators
- Progress tracking
- Simple layout with minimal distractions
- Responsive to different screen sizes

## 15. Restaurant Integration

### Waiting for Table
- Queue tickets track party size
- Integration with table availability
- Queue called → table assigned

### Party Size
- Track number of people in queue
- Used for table assignment
- Restaurant-specific reporting

### Queue Called
- Connection to table assignment
- Integration with dining flow

### Assign Table
- Link queue ticket to available table
- Update table status to occupied

### Create Table Session
- Trigger session creation upon service
- Integration with existing session management

## 16. Future QR / Customer Experience

### Customer Checks Queue Status
- Scan QR code to see queue position
- View estimated wait time
- Receive notifications

### Customer Sees Current Queue/Estimate
- Real-time queue status
- Wait time estimates
- Optional notification preferences

### Notification Channels
- SMS or app notifications
- In-store display updates
- Email notifications

## 17. Reporting / Analytics Implications

### Useful Metrics
- Average wait time by queue zone
- Called-to-served conversion rate
- No-show rate by time period
- Queue volume by time of day
- Peak queue times
- Table utilization rate (restaurant)

### Reporting Features
- Historical queue statistics
- Real-time queue monitoring
- Performance metrics
- Staff productivity tracking

## 18. Recommended Architecture Placement

### Repository Structure
- `features/queue` - Core queue functionality
- `features/queue_display` - Display screen components
- `modes/restaurant` - Restaurant-specific queue integration

### Module Organization
- Domain layer: QueueTicket, QueueZone, QueueStatus, etc.
- Data layer: QueueRepository, QueueDataSource
- Presentation layer: QueueProviders, QueueScreens
- Shared components: QueueDisplayScreen, QueueNumberFormatter

## 19. Suggested Repository Blueprint

```
features/
├── queue/
│   ├── domain/
│   │   ├── entities/
│   │   │   ├── queue_ticket.dart
│   │   │   ├── queue_zone.dart
│   │   │   └── queue_status.dart
│   │   ├── repositories/
│   │   │   └── queue_repository.dart
│   │   └── use_cases/
│   │       ├── create_queue_ticket.dart
│   │       ├── call_next_queue.dart
│   │       ├── mark_served.dart
│   │       ├── mark_no_show.dart
│   │       └── get_queue_list.dart
│   ├── data/
│   │   ├── models/
│   │   │   ├── queue_ticket_model.dart
│   │   │   └── queue_zone_model.dart
│   │   ├── repositories/
│   │   │   └── queue_repository_impl.dart
│   │   └── data_sources/
│   │       └── queue_data_source.dart
│   └── presentation/
│       ├── providers/
│       │   ├── queue_providers.dart
│       │   └── queue_ticket_provider.dart
│       ├── screens/
│       │   ├── queue_display_screen.dart
│       │   └── queue_management_screen.dart
│       └── widgets/
│           └── queue_ticket_widget.dart
├── queue_display/
│   └── presentation/
│       └── queue_display_screen.dart
└── modes/
    └── restaurant/
        └── presentation/
            └── restaurant_queue_integration.dart
```

## 20. Risks and Edge Cases

- Duplicate queue number generation
- Calling next from multiple terminals simultaneously
- Stale display updates
- Customer absent with no clear handling
- Queue reopened incorrectly
- Reset policy issues (daily vs shift-based)
- Restaurant table availability mismatch
- Network connectivity issues during critical operations
- Data persistence failures during offline operations
- Concurrency issues in multi-staff environments

## 21. MVP Acceptance Criteria

- [ ] Staff can create queue tickets
- [ ] System generates unique queue numbers
- [ ] Staff can view waiting queues
- [ ] Staff can call next queue
- [ ] Staff can mark served status
- [ ] Staff can mark no-show/skip status
- [ ] Queue display screen shows current queue
- [ ] Offline operation works for core functionality
- [ ] Queue tickets are persisted locally
- [ ] Basic queue history is maintained

## 22. Recommended Next Steps

1. Create queue domain entities and repositories
2. Implement core queue management use cases
3. Design and implement queue display screen
4. Create queue number generation logic
5. Implement offline data persistence
6. Design restaurant-specific queue integration
7. Create test coverage for core queue functionality
8. Integrate with existing POS navigation
9. Implement basic queue history and reporting
10. Plan for QR code integration in Phase 3