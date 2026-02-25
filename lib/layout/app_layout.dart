import 'package:cloth_store/screens/home_screen.dart';
import 'package:cloth_store/utils/constants.dart';
import 'package:flutter/material.dart';

class AppLayout extends StatefulWidget {
  const AppLayout({super.key});

  @override
  State<AppLayout> createState() => _AppLayoutState();
}

class _AppLayoutState extends State<AppLayout> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    const Center(child: Text("Shop")),
    const Center(child: Text("WhishList")),
    const Center(child: Text("Messages")),
    const Center(child: Text("Profile")),
  ];

  final List<IconData> _icons = [
    Icons.home,
    Icons.shopping_bag,
    Icons.favorite,
    Icons.chat,
    Icons.person,
  ];

  final List<IconData> _outlinedIcons = [
    Icons.home_outlined,
    Icons.shopping_bag_outlined,
    Icons.favorite_border,
    Icons.chat_outlined,
    Icons.person_outline,
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Scaffold(
      body: _screens[_selectedIndex],

      bottomNavigationBar: Container(
        height: 80,
        margin: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: colors.surface,
          borderRadius: BorderRadius.circular(40),
          boxShadow: [
            BoxShadow(
              color: theme.shadowColor.withOpacity(0.15),
              blurRadius: 8,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(_icons.length, (index) {
            final isSelected = index == _selectedIndex;

            return GestureDetector(
              onTap: () => setState(() => _selectedIndex = index),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                padding: EdgeInsets.all(isSelected ? 14 : 0),
                decoration: isSelected
                    ? BoxDecoration(
                        color: colors.onSurface,
                        shape: BoxShape.circle,
                      )
                    : null,
                child: Icon(
                  isSelected ? _icons[index] : _outlinedIcons[index],
                  size: 28,
                  color: isSelected ? colors.primary : AppColors.textSecondary,
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
