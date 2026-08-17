import 'package:flutter/material.dart';
import '../utils/neumorphic_style.dart';

class WorkingHoursWidget extends StatelessWidget {
  const WorkingHoursWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final hour = now.hour;
    
    // Determine working status based on time
    final isWorkingHours = hour >= 9 && hour < 18;
    final statusText = isWorkingHours ? 'Working Hours' : 'Off Hours';
    final statusColor = isWorkingHours ? Colors.green : Colors.orange;
    final statusBgColor = isWorkingHours 
        ? Colors.green.withValues(alpha: 0.15)
        : Colors.orange.withValues(alpha: 0.15);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            isWorkingHours 
              ? const Color(0xFFE8F5E9)
              : const Color(0xFFFFF3E0),
            isWorkingHours 
              ? const Color(0xFFF1F8E9)
              : const Color(0xFFFFE0B2),
          ],
        ),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: statusColor.withValues(alpha: 0.3),
          width: 1.2,
        ),
        boxShadow: [
          BoxShadow(
            color: statusColor.withValues(alpha: 0.1),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: statusBgColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              isWorkingHours ? Icons.work_outline : Icons.schedule,
              color: statusColor,
              size: 24,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  statusText,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: statusColor,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '${hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: statusColor.withValues(alpha: 0.8),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: statusBgColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              isWorkingHours ? '9 AM - 6 PM' : 'After Hours',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: statusColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
