import 'package:flutter/material.dart';
import 'package:translator/translator.dart';

class TranslatedText extends StatefulWidget {
  final String text;
  final TextStyle? style;

  const TranslatedText({super.key, required this.text, this.style});

  @override
  State<TranslatedText> createState() => _TranslatedTextState();
}

class _TranslatedTextState extends State<TranslatedText> {
  final GoogleTranslator _translator = GoogleTranslator();
  String? _translatedText;
  bool _hasTranslatedOnce = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_hasTranslatedOnce) {
      _hasTranslatedOnce = true;
      _translate();
    }
  }

  @override
  void didUpdateWidget(covariant TranslatedText oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.text != widget.text) {
      _translate();
    }
  }

  Future<void> _translate() async {
    final locale = Localizations.localeOf(context).languageCode;

    if (locale == 'en') {
      if (mounted) {
        setState(() => _translatedText = widget.text);
      }
      return;
    }

    try {
      final result = await _translator.translate(widget.text, to: locale);
      if (mounted) {
        setState(() => _translatedText = result.text);
      }
    } catch (e) {
      debugPrint('Translation failed: $e');
      if (mounted) {
        setState(() => _translatedText = widget.text);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _translatedText ?? widget.text,
      style: widget.style,
    );
  }
}