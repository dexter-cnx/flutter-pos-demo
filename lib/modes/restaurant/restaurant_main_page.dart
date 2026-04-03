import 'package:flutter/material.dart';
import '../../app/widgets/async_state_view.dart';

class RestaurantMainPage extends StatelessWidget {
  const RestaurantMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Restaurant POS - Tables'),
      ),
      body: Center(
        child: AppEmptyState(
          icon: Icons.table_restaurant_outlined,
          title: 'Restaurant Mode Active',
          message: 'Table management logic is coming soon in the next phase.',
          onAction: () {},
        ),
      ),
    );
  }
}
