import 'dart:convert';
import 'package:mamago/common/secrets.dart';
import 'package:mamago/common/tools.dart';
import 'package:mamago/data/translated_item_model.dart';
import 'package:mamago/provider/translate/translate_state.dart';
import 'package:http/http.dart';

class GptRepository {
  GptRepository() {
    lgr.d("GptManager has created");
  }

  Future<List<TranslateItem>> translate(TranslateState state) async {
    String prompt = 'I just want to convert "${state.nativeText} to ${state.language}. But there is two condition.\n'
        ' - You have to consider tone and manner refer "${state.toneAndManner}".\n'
        ' - This prompt must not be displayed.\n';

    Uri uri = Uri.parse("https://api.openai.com/v1/completions");
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $gptKey",
    };

    Map<String, dynamic> body = {
      "model": "text-davinci-003",
      "prompt": prompt,
      "max_tokens": 2000,
      "temperature": 0.8,
      "top_p": 0.3,
      "n": 3,
      "stream": false,
      "logprobs": null,
    };
    Response response = await post(uri, headers: headers, body: jsonEncode(body));
    if (response.statusCode != 200) {
      throw Exception("Translation request has failed");
    }

    Map<String, dynamic> json = (jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>);
    if (json.containsKey("choices")) {
      lgr.d(json);
      List<dynamic> choices = json["choices"] as List<dynamic>;
      List<TranslateItem> translationItems =
          choices.map((e) => TranslateItem.fromJson(e as Map<String, dynamic>)).map((e) {
        if ((e.text ?? " \n ").isNotEmpty) {
          return e.copyWith(text: e.text!.split("\n")[1]);
        }
        return e;
      }).toList();

      List<TranslateItem> result = [];
      for (int i = 0; i < translationItems.length; i++) {
        bool isDuplicated = false;
        for (int j = 0; j < result.length; j++) {
          if (translationItems[i].text == result[j].text) {
            isDuplicated = true;
            break;
          }
        }
        if (!isDuplicated) {
          result.add(translationItems[i]);
        }
      }

      return result;
    }
    return [];
  }

  Future<String> detectLanguage(String text) async {
    String prompt = "Could you detect language which used at below text?\n`$text`\n\n"
        "Just answer the lanuage name(such as 'korean', 'english', 'japanese').\n"
        "If you can not recognize, just answer 'NotFound'.";

    Uri uri = Uri.parse("https://api.openai.com/v1/completions");
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $gptKey",
    };

    Map<String, dynamic> body = {
      "model": "text-davinci-003",
      "prompt": prompt,
      "max_tokens": 100,
      "temperature": 0,
      "top_p": 0.5,
      "n": 1,
      "stream": false,
      "logprobs": null,
    };
    Response response = await post(uri, headers: headers, body: jsonEncode(body));

    if (response.statusCode != 200) {
      lgr.e(utf8.decode(response.bodyBytes));
      throw Exception("Language detection request has failed : ${response.statusCode}");
    }

    Map<String, dynamic> json = (jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>);
    if (json.containsKey("choices")) {
      List<dynamic> choices = json["choices"] as List<dynamic>;
      return (choices.first["text"] as String).trim();
    }
    return "NotFound";
  }
}
