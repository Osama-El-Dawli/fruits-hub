class UserEntity {
  final String name;
  final String email;
  final String uid;

  const UserEntity({
    required this.name,
    required this.email,
    required this.uid,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'uid': uid,
    };
  }
}
