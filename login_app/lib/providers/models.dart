class Users {
  final int userid;
  final String userName;
  final String? phoneNo;
  final String? profileImage;
  final String? email;

  Users({
    required this.userid,
    required this.userName,
    this.phoneNo,
    this.profileImage,
    this.email,
  });

  factory Users.fromJson(Map<String, dynamic> json) {
    return Users(userid: json['userid'], userName: json['user_name']);
  }

  Map<String, dynamic> toJson() {
    return {'userid': userid, 'user_name': userName};
  }
}
