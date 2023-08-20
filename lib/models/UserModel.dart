class User {
  final String? uid;
  final String? email;
  final String? fullname;
  final String? phone;
  final String? profileimage;
  final String? address;

  User({this.uid, this.email, this.fullname, this.phone,this.profileimage,this.address});

// data from server
  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      uid: map['uid'],
      email: map['email'],
      fullname: map['fullname'],
      phone: map['phone'],
      profileimage: map['profileimage'],
      address: map['address'],
    );
  }

  //sending data to our server
  Map<String, dynamic>? toMap() {
    return {
      'uid': uid,
      'email': email,
      'fullname': fullname,
      'phone': phone,
      'profileimage': profileimage,
      'address': address,
    };
  }
}
