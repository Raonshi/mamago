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
    final String prompt1 = "${state.nativeText}를 ${state.language}로 번역해줘";
    final String firstAnswer = await getAnswer(prompt1);

    final String prompt2 = '"$firstAnswer"를 ${state.toneAndManner.text} 어투로 다시 작성해줘.';
    final String secondAnswer = await getAnswer(prompt2);

    final String prompt3 = '어투를 유지한 상태로 "$secondAnswer"를 포함한 다른 표현 3가지를 더 작성해줘.';
    final String thirdAnswer = await getAnswer(prompt3);

    final List<Map<String, dynamic>> format = [
      {"index": 0, "text": "translatedText1"},
      {"index": 1, "text": "translatedText2"},
      {"index": 2, "text": "translatedText3"}
    ];

    final String prompt4 = '"$thirdAnswer"를 \n```\n$format\n```과 동일한 형태의 구조로 반환해줘.';
    final String answer4 = await getAnswer(prompt4);

    if (answer4.isEmpty) return [];

    final List<dynamic> results = jsonDecode(answer4);
    if (results.isEmpty) return [];

    return results.map((e) => TranslateItem.fromJson(e)).toList();
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

  Future<String> getAnswer(String prompt) async {
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
          "content": "You are translation assistant",
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
      if (choices.isEmpty) return "";
      return choices.first["message"]["content"];
    } else {
      return "";
    }
  }
}
