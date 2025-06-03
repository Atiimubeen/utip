import 'package:flutter/material.dart';

class PersonCounter extends StatelessWidget {
  const PersonCounter({
    super.key,
    required this.theme,
    required int personalCount,
    required this.onDecrement,
    required this.onIncrement,
  }) : _personalCount = personalCount;

  final ThemeData theme;
  final int _personalCount;

  final VoidCallback onDecrement;
  final VoidCallback onIncrement;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          color: theme.colorScheme.primary,
          onPressed: onDecrement,
          icon: Icon(Icons.remove),
        ),
        Text("$_personalCount", style: theme.textTheme.titleMedium),
        IconButton(
          color: theme.colorScheme.primary,
          onPressed: onIncrement,
          icon: Icon(Icons.add),
        ),
      ],
    );
  }
}
