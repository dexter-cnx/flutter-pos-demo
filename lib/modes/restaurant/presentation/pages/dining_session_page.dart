import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../features/pos/presentation/pages/pos_page.dart';
import '../../../../features/dining/presentation/providers/dining_providers.dart';

class DiningSessionPage extends ConsumerStatefulWidget {
  const DiningSessionPage({super.key, required this.sessionId});

  final int? sessionId;

  @override
  ConsumerState<DiningSessionPage> createState() => _DiningSessionPageState();
}

class _DiningSessionPageState extends ConsumerState<DiningSessionPage> {
  @override
  void initState() {
    super.initState();
    // Use addPostFrameCallback to avoid setting state during build
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(activeDiningSessionIdProvider.notifier).set(widget.sessionId);
    });
  }

  @override
  void dispose() {
    // We don't clear it here because we might be navigating to checkout
    // which also needs the sessionId if it's restaurant mode.
    // The session is cleared by the caller or when switching back to table grid.
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.sessionId == null) {
      return const Scaffold(
        body: Center(child: Text('Invalid Session ID')),
      );
    }

    return const PosPage();
  }
}
