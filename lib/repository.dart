import 'package:dart_openai/openai.dart';
import 'package:mamago/common/tools.dart';

class Repository {
  final String key = "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";
  OpenAIModelModel? model;

  Repository() {
    OpenAI.apiKey = key;
    init();
  }

  void init() async {
    model = await OpenAI.instance.model.list().then((value) => value.first);
  }

  Future<void> requestTranslate(String text) async {
    OpenAICompletionModel completion = await OpenAI.instance.completion.create(
      model: model!.id,
      prompt: "Translate below text to English.\n$text",
      topP: 0.2,
    );

    lgr.d(completion.choices.first.text);
  }
}
