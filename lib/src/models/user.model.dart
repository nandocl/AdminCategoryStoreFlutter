class UserItem {
  UserItem({
    this.token,
    this.user,
  });

  String token;
  User user;

  factory UserItem.fromJson(Map<String, dynamic> json) => UserItem(
        token: json["token"],
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "user": user.toJson(),
      };
}

class User {
  User({
    this.userId,
    this.firstName,
    this.lastName,
    this.username,
    this.email,
    this.status,
    this.roleId,
    this.storeId,
    this.lastModificationDate,
    this.creationDate,
    this.avatar,
    this.meta,
  });

  int userId;
  String firstName;
  String lastName;
  String username;
  String email;
  String status;
  int roleId;
  int storeId;
  dynamic lastModificationDate;
  DateTime creationDate;
  String avatar;
  Meta meta;

  factory User.fromJson(Map<String, dynamic> json) => User(
        userId: json["user_id"] ?? '',
        firstName: json["first_name"] ?? '',
        lastName: json["last_name"] ?? '',
        username: json["username"] ?? '',
        email: json["email"] ?? '',
        status: json["status"] ?? '',
        roleId: json["role_id"] ?? '',
        storeId: json["store_id"],
        lastModificationDate: json["last_modification_date"] ?? '',
        creationDate: DateTime.parse(json["creation_date"] ?? ''),
        avatar: json["avatar"] ?? '',
        meta: Meta.fromJson(json["meta"] ?? ''),
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "first_name": firstName,
        "last_name": lastName,
        "username": username,
        "email": email,
        "status": status,
        "role_id": roleId,
        "store_id": storeId,
        "last_modification_date": lastModificationDate,
        "creation_date": creationDate.toIso8601String(),
        "avatar": avatar,
        "meta": meta.toJson(),
      };
}

class Meta {
  Meta({
    this.phone,
  });

  dynamic phone;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        phone: json["_phone"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "_phone": phone,
      };
}
