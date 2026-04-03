import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/customer_providers.dart';
import '../../domain/entities/customer.dart';

class CustomerSearchWidget extends ConsumerStatefulWidget {
  final Function(Customer) onCustomerSelected;
  
  const CustomerSearchWidget({
    super.key,
    required this.onCustomerSelected,
  });

  @override
  ConsumerState<CustomerSearchWidget> createState() => _CustomerSearchWidgetState();
}

class _CustomerSearchWidgetState extends ConsumerState<CustomerSearchWidget> {
  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          decoration: const InputDecoration(
            labelText: 'ค้นหาสมาชิก (เบอร์โทร หรือ ชื่อ)',
            prefixIcon: Icon(Icons.search),
          ),
          onChanged: (val) {
            setState(() {
              _searchQuery = val;
            });
          },
        ),
        if (_searchQuery.isNotEmpty)
          Expanded(
            child: Consumer(
              builder: (context, ref, _) {
                final searchAsync = ref.watch(customerSearchProvider(_searchQuery));
                
                return searchAsync.when(
                  data: (customers) {
                    if (customers.isEmpty) {
                       return const Center(child: Text('ไม่พบสมาชิก'));
                    }
                    return ListView.builder(
                      itemCount: customers.length,
                      itemBuilder: (context, index) {
                        final c = customers[index];
                        return ListTile(
                          leading: const Icon(Icons.person),
                          title: Text(c.name),
                          subtitle: Text('${c.phone} | ${c.memberTier} | ${c.points} แต้ม'),
                          onTap: () {
                            widget.onCustomerSelected(c);
                            setState(() {
                              _searchQuery = '';
                            });
                          },
                        );
                      },
                    );
                  },
                  loading: () => const Center(child: CircularProgressIndicator()),
                  error: (e, st) => Center(child: Text('Error: $e')),
                );
              },
            ),
          )
      ],
    );
  }
}
