import 'package:flutter/material.dart';

import '../../domain/entities/mock_translation_result.dart';
import 'result_card.dart';

class TranslationResultsSection extends StatelessWidget {
  const TranslationResultsSection({
    super.key,
    required this.result,
  });

  final MockTranslationResult result;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        ResultCard(
          title: 'Main Translation',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                result.mainTranslation,
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 12),
              Align(
                alignment: Alignment.centerRight,
                child: OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.copy_outlined),
                  label: const Text('Copy'),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        ResultCard(
          title: 'Alternatives',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: result.alternatives
                .map(
                  (alternative) => Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Text('• $alternative'),
                  ),
                )
                .toList(),
          ),
        ),
        const SizedBox(height: 12),
        ResultCard(
          title: 'Suggested Replies',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: result.suggestedReplies
                .map(
                  (reply) => Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Text('• $reply'),
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}
