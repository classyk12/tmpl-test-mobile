List<JokesModel> jokesModelFromMap(List<dynamic> json) =>
    List<JokesModel>.from(json.map((x) => JokesModel.fromMap(x)));

class JokesModel {
  JokesModel({
    this.joke,
  });

  String? joke;

  factory JokesModel.fromMap(Map<String, dynamic> json) => JokesModel(
        joke: json["joke"],
      );
}
