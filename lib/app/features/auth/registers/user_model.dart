class UserModel {
  final String name;
  final DateTime birthDate;
  final String cellPhone;
  final String email;
  late final String userType;
  final String uid;
  final String? cnpj;
  final String? creci;

  UserModel({
    required this.name,
    required this.birthDate,
    required this.cellPhone,
    required this.email,
    required this.userType,
    required this.uid,
    this.cnpj,
    this.creci,
  });
}
