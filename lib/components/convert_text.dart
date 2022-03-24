import 'package:learning_translate/learning_translate.dart';

Future<String> convertText(String input) async {
    Translator translator = Translator(from: ENGLISH, to: HINDI);
    String translatedText = await translator.translate(input);
    
    // print(translatedText);
    // setState(() {
    //   hello = translatedText;
    // });

    return translatedText;
  }