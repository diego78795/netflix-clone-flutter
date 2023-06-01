class BannerModel {
  int id = 0;
  String titulo = '';
  String img = '';
  List<dynamic> genres = [];

  BannerModel();

  BannerModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    titulo = json['name'];
    img = json['backdrop_path'];
    genres = json['genres'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['titulo'] = titulo;
    data['img'] = img;
    data['genres'] = genres;
    return data;
  }
}
