import 'package:flutter/material.dart';

class RecentSearchTile extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const RecentSearchTile({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(text, style: Theme.of(context).textTheme.bodyMedium),
            Icon(Icons.history, color: Theme.of(context).colorScheme.primary),
          ],
        ),
      ),
    );
  }
}
