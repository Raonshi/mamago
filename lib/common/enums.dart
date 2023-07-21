enum ConvertingLanguage {
  korean("Korean"),
  english("English"),
  japanese("Japanese");

  final String text;
  const ConvertingLanguage(this.text);
}

enum ToneAndManner {
  business("Business"),
  casual("Casual"),
  friendly("Friendly");

  final String text;
  const ToneAndManner(this.text);
}

enum ThemeModePref {
  system("System"),
  light("Light"),
  dark("Dark");

  final String text;
  const ThemeModePref(this.text);
}
