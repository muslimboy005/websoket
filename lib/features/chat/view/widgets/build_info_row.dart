import 'package:flutter/material.dart';

class BuildInfoRow extends StatelessWidget {
  final IconData icon;
  final String title;
  final String trailing;
  const BuildInfoRow(
      {super.key,
      required this.icon,
      required this.title,
      required this.trailing});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(icon, size: 20),
          SizedBox(width: 12),
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
          if (trailing.isNotEmpty)
            Text(
              trailing,
              style: TextStyle(
                fontSize: 14,
              ),
            ),
          SizedBox(width: 8),
          Icon(Icons.chevron_right, size: 20),
        ],
      ),
    );
  }
}
