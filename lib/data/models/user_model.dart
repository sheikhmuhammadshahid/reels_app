import 'dart:convert';

class UserModel {
  int? userId;
  String? fullname;
  String? username;
  String? profilePicture;
  String? profilePictureCdn;
  String? designation;
  UserModel({
    this.userId,
    this.fullname,
    this.username,
    this.profilePicture,
    this.profilePictureCdn,
    this.designation,
  });

  UserModel copyWith({
    int? userId,
    String? fullname,
    String? username,
    String? profilePicture,
    String? profilePictureCdn,
    String? designation,
  }) {
    return UserModel(
      userId: userId ?? this.userId,
      fullname: fullname ?? this.fullname,
      username: username ?? this.username,
      profilePicture: profilePicture ?? this.profilePicture,
      profilePictureCdn: profilePictureCdn ?? this.profilePictureCdn,
      designation: designation ?? this.designation,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (userId != null) {
      result.addAll({'userId': userId});
    }
    if (fullname != null) {
      result.addAll({'fullname': fullname});
    }
    if (username != null) {
      result.addAll({'username': username});
    }
    if (profilePicture != null) {
      result.addAll({'profilePicture': profilePicture});
    }
    if (profilePictureCdn != null) {
      result.addAll({'profilePictureCdn': profilePictureCdn});
    }
    if (designation != null) {
      result.addAll({'designation': designation});
    }

    return result;
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      userId: map['user_id']?.toInt(),
      fullname: map['fullname'],
      username: map['username'],
      profilePicture: map['profile_picture'],
      profilePictureCdn: map['profile_picture_cdn'],
      designation: map['designation'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel(userId: $userId, fullname: $fullname, username: $username, profilePicture: $profilePicture, profilePictureCdn: $profilePictureCdn, designation: $designation)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserModel &&
        other.userId == userId &&
        other.fullname == fullname &&
        other.username == username &&
        other.profilePicture == profilePicture &&
        other.profilePictureCdn == profilePictureCdn &&
        other.designation == designation;
  }

  @override
  int get hashCode {
    return userId.hashCode ^
        fullname.hashCode ^
        username.hashCode ^
        profilePicture.hashCode ^
        profilePictureCdn.hashCode ^
        designation.hashCode;
  }
}
