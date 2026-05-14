import 'package:flutter/material.dart';

class TranslationInputCard extends StatelessWidget {
  const TranslationInputCard({
    super.key,
    required this.controller,
    required this.onClear,
  });

  final TextEditingController controller;
  final VoidCallback onClear;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Your text',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: controller,
              maxLines: 6,
              decoration: InputDecoration(
                hintText: 'Type or paste your message...',
                suffixIcon: IconButton(
                  onPressed: onClear,
                  icon: const Icon(Icons.close),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
