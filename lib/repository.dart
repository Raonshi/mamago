import 'dart:convert';
import 'package:mamago/common/tools.dart';
import 'package:mamago/data/translated_item_model.dart';
import 'package:mamago/provider/translate/translate_state.dart';
import 'package:http/http.dart';

class GptRepository {
  final String key = "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";

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
      "Authorization": "Bearer $key",
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
      List<dynamic> choices = json["choices"] as List<dynamic>;

      lgr.d(choices);

      return choices.map((e) => TranslateItem.fromJson(e as Map<String, dynamic>)).map((e) {
        if ((e.text ?? " \n ").isNotEmpty) {
          return e.copyWith(text: e.text!.split("\n")[1]);
        }
        return e;
      }).toList();
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
      "Authorization": "Bearer $key",
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
      throw Exception("Translation request has failed : ${response.statusCode}");
    }

    Map<String, dynamic> json = (jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>);
    if (json.containsKey("choices")) {
      List<dynamic> choices = json["choices"] as List<dynamic>;
      return (choices.first["text"] as String).trim();
    }
    return "NotFound";
  }
}
