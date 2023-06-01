class MovieModel {
  int id = 0;
  String img = '';

  MovieModel();

  MovieModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    img = json['poster_path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['img'] = img;
    return data;
  }
}
