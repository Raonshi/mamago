import 'dart:convert';
import 'package:mamago/common/enums.dart';
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
    Map<String, dynamic> json = {
      "text": state.nativeText,
      "language": state.language.text,
      "toneAndManner": state.toneAndManner.text,
    };

    String prompt = "`${state.nativeText}`를 `${state.language}`로 번역해줘. 그리고 명심해야 할 것들이 있어.\n"
        "1. ${state.toneAndManner.text} 상황에서 사용할 수 있는 톤 앤 매너로 번역해줘.\n"
        "2. 최대 3가지의 각기 다른 표현으로 제공해줘. 이 때, 1번의 톤 앤 매너는 항상 유지되어야해.\n"
        "3. json 형태로 작성해줘. 내가 원하는 json의 형태는 다음과 같아.\n"
        "```\n"
        "{'results' : [{'index': 1, 'text': 'aaa'}, {'index': 2, 'text': 'bbb'}, {'index': 3, 'text': 'ccc'}]}\n"
        "```\n"
        "results에는 2번에 해당하는 표현들이 json형태로 들어가 있어.";

    Uri uri = Uri.parse("https://api.openai.com/v1/chat/completions");
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $gptKey",
    };

    Map<String, dynamic> body = {
      "model": "gpt-3.5-turbo",
      "messages": [
        {
          "role": "system",
          "content": "You are a helpful translator.",
        },
        {
          "role": "user",
          "content": prompt,
        }
      ],
    };
    Response response = await post(uri, headers: headers, body: jsonEncode(body));
    if (response.statusCode != 200) {
      throw Exception("Translation request has failed");
    }

    Map<String, dynamic> data = (jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>);
    if (data.containsKey("choices")) {
      List<dynamic> choices = data["choices"] as List<dynamic>;
      if (choices.isEmpty) return [];

      final Map<String, dynamic> answer = jsonDecode(choices.first["message"]["content"]);

      List<TranslateItem> translationItems =
          (answer["results"] as List).map((e) => TranslateItem.fromJson(e as Map<String, dynamic>)).toList();

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
