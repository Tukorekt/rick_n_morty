import 'package:flutter/material.dart';
import 'package:rick_n_morty/presentation/ui_contants.dart';

class StatusChip extends StatelessWidget {
  final String? status;

  const StatusChip({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    final color = _statusColor(status);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: .4),
        borderRadius: border24,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 7,
            height: 7,
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          ),
          const SizedBox(width: spacing4 + 2),
          Text(
            status ?? '',
            style: TextStyle(
              color: color,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Color _statusColor(String? status) {
    return switch (status?.trim().toLowerCase()) {
      'alive' => aliveColor,
      'dead' => deadColor,
      _ => unknownStatusColor,
    };
  }
}
