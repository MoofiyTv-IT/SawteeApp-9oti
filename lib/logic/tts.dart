import 'package:flutter_tts/flutter_tts.dart';
import 'package:twahod_app/res/strings.dart';

class Tts {
  FlutterTts _flutterTts;

  Tts() {
    _flutterTts = new FlutterTts();
    _flutterTts.setLanguage("ar");
  }

  Future speak({String textToSpeak = inputHint}) async {
    if (textToSpeak.isEmpty) textToSpeak = inputHint;
    var result = await _flutterTts.speak(textToSpeak);
    if (result != 1) print('error in speak');
  }
}
