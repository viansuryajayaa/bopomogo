import 'package:flutter/material.dart';

class LanguageSelectorCard extends StatelessWidget {
  const LanguageSelectorCard({
    super.key,
    required this.sourceLanguage,
    required this.targetLanguage,
    required this.languages,
    required this.onSourceChanged,
    required this.onTargetChanged,
    required this.onSwap,
  });

  final String sourceLanguage;
  final String targetLanguage;
  final List<String> languages;
  final ValueChanged<String?> onSourceChanged;
  final ValueChanged<String?> onTargetChanged;
  final VoidCallback onSwap;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              child: _DropdownField(
                label: 'From',
                value: sourceLanguage,
                items: languages,
                onChanged: onSourceChanged,
              ),
            ),
            const SizedBox(width: 12),
            IconButton.filled(
              onPressed: onSwap,
              icon: const Icon(Icons.swap_horiz),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _DropdownField(
                label: 'To',
                value: targetLanguage,
                items: languages,
                onChanged: onTargetChanged,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DropdownField extends StatelessWidget {
  const _DropdownField({
    required this.label,
    required this.value,
    required this.items,
    required this.onChanged,
  });

  final String label;
  final String value;
  final List<String> items;
  final ValueChanged<String?> onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
                color: Colors.black54,
              ),
        ),
        const SizedBox(height: 8),
        DropdownButtonFormField<String>(
          initialValue: value,
          isExpanded: true,
          items: items
              .map(
                (item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(item, overflow: TextOverflow.ellipsis),
                ),
              )
              .toList(),
          onChanged: onChanged,
          decoration: const InputDecoration(isDense: true),
        ),
      ],
    );
  }
}
