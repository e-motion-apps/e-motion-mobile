class UserModel {
  final int userId;
  final String? token = '';
  List<Abilities>? abilities = [];

  UserModel({
    required this.userId,
    this.abilities,
  });

  UserModel.fromJson(Map<String, dynamic> json)
      : userId = json['id'],
        abilities = List<Abilities>.from(
          json['abilities'].map((x) => Abilities.fromJson(x)),
        );
}

class Abilities {
  final String abilityName;
  Abilities({required this.abilityName});
  Abilities.fromJson(Map<String, dynamic> json)
      : abilityName = json['abilities'];
}
