class MockTranslationResult {
  const MockTranslationResult({
    required this.mainTranslation,
    required this.alternatives,
    required this.suggestedReplies,
  });

  final String mainTranslation;
  final List<String> alternatives;
  final List<String> suggestedReplies;
}
