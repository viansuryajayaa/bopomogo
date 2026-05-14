import 'package:flutter/material.dart';

class TranslationControlsRow extends StatelessWidget {
  const TranslationControlsRow({
    super.key,
    required this.tone,
    required this.useCase,
    required this.tones,
    required this.useCases,
    required this.onToneChanged,
    required this.onUseCaseChanged,
  });

  final String tone;
  final String useCase;
  final List<String> tones;
  final List<String> useCases;
  final ValueChanged<String?> onToneChanged;
  final ValueChanged<String?> onUseCaseChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: _DropdownField(
                label: 'Tone',
                value: tone,
                items: tones,
                onChanged: onToneChanged,
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: _DropdownField(
                label: 'Use case',
                value: useCase,
                items: useCases,
                onChanged: onUseCaseChanged,
              ),
            ),
          ),
        ),
      ],
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
