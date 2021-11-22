class JokeModel {
  String? joke;

  JokeModel({this.joke});

  factory JokeModel.fromMap(Map<dynamic, String> json) => JokeModel(
        joke: json["joke"],
      );
}

List<JokeModel> jokesModelFromMap(List<dynamic> data) {
  return List<JokeModel>.from(data.map((x) => JokeModel.fromMap(x)));
}
