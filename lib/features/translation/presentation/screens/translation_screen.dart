import 'package:flutter/material.dart';

import '../../domain/entities/mock_translation_result.dart';
import '../widgets/language_selector_card.dart';
import '../widgets/translation_controls_row.dart';
import '../widgets/translation_input_card.dart';
import '../widgets/translation_results_section.dart';

class TranslationScreen extends StatefulWidget {
  const TranslationScreen({super.key});

  @override
  State<TranslationScreen> createState() => _TranslationScreenState();
}

class _TranslationScreenState extends State<TranslationScreen> {
  final TextEditingController _textController = TextEditingController();

  String _sourceLanguage = 'Indonesian';
  String _targetLanguage = 'Chinese (TW)';
  String _tone = 'Casual';
  String _useCase = 'Daily';

  final List<String> _languages = const [
    'Indonesian',
    'English',
    'Chinese (TW)',
  ];

  final List<String> _tones = const [
    'Default',
    'Casual',
    'Formal',
    'Friendly',
    'Professional',
  ];

  final List<String> _useCases = const [
    'Daily',
    'Chat',
    'Work',
  ];

  MockTranslationResult _result = const MockTranslationResult(
    mainTranslation: '我最近有點忙。',
    alternatives: [
      '我最近有點忙碌。',
      '這陣子我有點忙。',
    ],
    suggestedReplies: [
      '辛苦你了，記得休息一下。',
      '最近真的很忙嗎？',
      '希望你不要太累。',
    ],
  );

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  void _swapLanguages() {
    setState(() {
      final currentSource = _sourceLanguage;
      _sourceLanguage = _targetLanguage;
      _targetLanguage = currentSource;
    });
  }

  void _generateMockTranslation() {
    final input = _textController.text.trim();

    setState(() {
      _result = MockTranslationResult(
        mainTranslation: input.isEmpty ? '我最近有點忙。' : '「$input」的台灣版翻譯會顯示在這裡。',
        alternatives: const [
          '這是比較自然的一種說法。',
          '這是比較口語的另一種表達。',
        ],
        suggestedReplies: const [
          '這句話聽起來很自然耶。',
          '你要不要我幫你換成更正式的版本？',
          '如果是聊天語氣，這樣用很可以。',
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'BopomoGo',
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
            SizedBox(height: 2),
            Text(
              'Taiwan-style AI translator',
              style: TextStyle(fontSize: 12, color: Colors.black54),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.settings_outlined),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              LanguageSelectorCard(
                sourceLanguage: _sourceLanguage,
                targetLanguage: _targetLanguage,
                languages: _languages,
                onSourceChanged: (value) {
                  if (value == null) return;
                  setState(() => _sourceLanguage = value);
                },
                onTargetChanged: (value) {
                  if (value == null) return;
                  setState(() => _targetLanguage = value);
                },
                onSwap: _swapLanguages,
              ),
              const SizedBox(height: 16),
              TranslationInputCard(
                controller: _textController,
                onClear: () => _textController.clear(),
              ),
              const SizedBox(height: 16),
              TranslationControlsRow(
                tone: _tone,
                useCase: _useCase,
                tones: _tones,
                useCases: _useCases,
                onToneChanged: (value) {
                  if (value == null) return;
                  setState(() => _tone = value);
                },
                onUseCaseChanged: (value) {
                  if (value == null) return;
                  setState(() => _useCase = value);
                },
              ),
              const SizedBox(height: 20),
              FilledButton(
                onPressed: _generateMockTranslation,
                style: FilledButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text('Translate'),
              ),
              const SizedBox(height: 20),
              TranslationResultsSection(result: _result),
            ],
          ),
        ),
      ),
    );
  }
}
