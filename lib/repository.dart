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
    Map<String, dynamic> filteredData = {
      "nativeText": state.nativeText,
      "language": state.language,
      "toneAndManner": state.toneAndManner
    };
    String prompt =
        "`$filteredData` is data model which works for language translation. Here is the definition of this data model.\n"
        "- language : Enum value which user want to translate.\n"
        "- toneAndManner : Enum value which user want to translate.\n"
        "- nativeText : Text which user wrote.\n"
        "According to above definition, Please translate 'nativeText' value";

    Uri uri = Uri.parse("https://api.openai.com/v1/completions");
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $key",
    };

    Map<String, dynamic> body = {
      "model": "text-davinci-003",
      "prompt": prompt,
      "max_tokens": 2000,
      "temperature": 0,
      "top_p": 0.5,
      "n": 3,
      "stream": false,
      "logprobs": null,
      // "stop": "\n"
    };
    Response response = await post(uri, headers: headers, body: jsonEncode(body));
    if (response.statusCode != 200) {
      throw Exception("Translation request has failed");
    }

    Map<String, dynamic> json = (jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>);
    if (json.containsKey("choices")) {
      List<dynamic> choices = json["choices"] as List<dynamic>;
      return choices.map((e) => TranslateItem.fromJson(e as Map<String, dynamic>)).toList();
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
      throw Exception("Translation request has failed");
    }

    Map<String, dynamic> json = (jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>);
    if (json.containsKey("choices")) {
      List<dynamic> choices = json["choices"] as List<dynamic>;
      return (choices.first["text"] as String).trim();
    }
    return "NotFound";
  }
}
