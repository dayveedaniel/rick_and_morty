class CharacterModel {
  final int id;
  final String name;
  final String image;

  CharacterModel({
    required this.id,
    required this.name,
    required this.image,
  });


  factory CharacterModel.fromJson(Map<String, dynamic> json) => CharacterModel(
    id: json["id"],
    name: json["name"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "image": image,
  };
}