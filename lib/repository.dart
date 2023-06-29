import 'package:dart_openai/openai.dart';
import 'package:mamago/common/tools.dart';
import 'package:mamago/data/translated_item_model.dart';
import 'package:mamago/provider/translate/translate_state.dart';

class GptRepository {
  final String key = "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";
  OpenAIModelModel? model;

  GptRepository() {
    lgr.d("GptManager has created");
    OpenAI.apiKey = key;
  }

  Future<List<TranslateItem>> requestTranslate(TranslateState state) async {
    OpenAICompletionModel completion = await OpenAI.instance.completion.create(
      model: "text-davinci-003",
      suffix: "",
      prompt: "Just translate below text to ${state.language.text}.\n${state.nativeText}",
      topP: 0.2,
      n: 5,
      user: "business man",
    );

    return completion.choices.map((e) {
      final Map<String, dynamic> json = {
        "index": e.index,
        "text": e.text,
        "logProbs": e.logprobs,
        "finishReason": e.finishReason,
      };
      return TranslateItem.fromJson(json);
    }).toList();
  }
}
