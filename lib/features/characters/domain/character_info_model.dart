class CharacterDetailsModel {
  final int id;
  final String name;
  final String status;
  final String species;
  final String gender;
  final String image;

  const CharacterDetailsModel({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.gender,
    required this.image,
  });

  factory CharacterDetailsModel.fromJson(Map<String, dynamic> json) =>
      CharacterDetailsModel(
        id: json["id"],
        name: json["name"],
        status: json["status"],
        species: json["species"],
        gender: json["gender"],
        image: json["image"],
      );
}
