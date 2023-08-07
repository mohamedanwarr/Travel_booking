class User {
  final String? uid;
  final String? email;
  final String? fullname;
  final String? phone;

  User({this.uid, this.email, this.fullname, this.phone});

// data from server
  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      uid: map['uid'],
      email: map['email'],
      fullname: map['fullname'],
      phone: map['phone'],
    );
  }

  //sending data to our server
  Map<String, dynamic>? toMap() {
    return {
      'uid': uid,
      'email': email,
      'fullname': fullname,
      'phone': phone,
    };
  }
}
