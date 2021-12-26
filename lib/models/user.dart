class User
{
  final int id;
  String username;
  String email;
  String firstname;
  String lastname;
  String link;

  User({
    required this.id,
    required this.username,
    required this.email,
    required this.firstname,
    required this.lastname,
    required this.link,
  });

  static fromJson(json) {
    User u = new User(
      email: '',
      link: json['website'],
      username: json['nickname'],
      id: 1,
      lastname: json['lastname'],
      firstname: json['firstname']
    );
    return u;
  }
}