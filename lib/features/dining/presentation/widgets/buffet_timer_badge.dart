import 'dart:async';
import 'package:flutter/material.dart';

import '../../data/models/dining_session_model.dart';

class BuffetTimerBadge extends StatefulWidget {
  final DiningSessionModel session;

  const BuffetTimerBadge({super.key, required this.session});

  @override
  State<BuffetTimerBadge> createState() => _BuffetTimerBadgeState();
}

class _BuffetTimerBadgeState extends State<BuffetTimerBadge> {
  Timer? _timer;
  late Duration _remaining;

  @override
  void initState() {
    super.initState();
    _calculateRemaining();
    if (widget.session.isOpen && widget.session.timeLimitMinutes != null) {
      _timer = Timer.periodic(const Duration(minutes: 1), (_) {
        setState(() {
          _calculateRemaining();
        });
      });
    }
  }

  void _calculateRemaining() {
    if (widget.session.timeLimitMinutes == null) {
      _remaining = Duration.zero;
      return;
    }
    final endTime = widget.session.startTime.add(Duration(minutes: widget.session.timeLimitMinutes!));
    _remaining = endTime.difference(DateTime.now());
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.session.timeLimitMinutes == null) return const SizedBox.shrink();

    final isExpired = _remaining.isNegative;
    final isWarning = !isExpired && _remaining.inMinutes <= 15;

    final color = isExpired
        ? Colors.red
        : isWarning
            ? Colors.orange
            : Colors.green;

    final text = isExpired 
        ? 'หมดเวลา' 
        : 'เหลือ ${_remaining.inMinutes} นาที';

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        border: Border.all(color: color),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.timer, size: 14, color: color),
          const SizedBox(width: 4),
          Text(text, style: TextStyle(color: color, fontSize: 12, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
