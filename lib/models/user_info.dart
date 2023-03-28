
class UserInfo {
  final String avatar;
  final String gender;
  final String nickname;
  final String phone;
  final int id;

  UserInfo(this.avatar, this.gender, this.nickname, this.phone, this.id);

  factory UserInfo.fromJson(Map<String, dynamic> json) {
    return UserInfo(
      json['avatar'],
      json['gender'],
      json['nickname'],
      json['phone'],
      json['id'],
    );
  }
}
