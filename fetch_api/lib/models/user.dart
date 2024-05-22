import 'dart:ui';

class User {
  Name? name;
  Picture? picture;
  String? email;
  String? phone;

  User({this.name, this.email, this.phone, this.picture});

  User.fromJson(Map<String, dynamic> json)
      : name = new Name.fromJson(json['name']),
        picture = new Picture.fromJson(json['picture']),
        email = json['email'],
        phone = json['phone'];
}

class Name {
  String? first;
  String? last;

  Name({this.first, this.last});

  Name.fromJson(Map<String, dynamic> json)
      : first = json['first'],
        last = json['last'];
}

class Picture {
  String? medium;

  Picture({this.medium});

  Picture.fromJson(Map<String, dynamic> json) :
  medium = json['medium'];
}
