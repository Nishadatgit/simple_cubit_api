// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);



class UserModel {
    UserModel({
       required this.id,
       required this.email,
       required this.firstName,
       required this.lastName,
       required this.avatar,
    });

    int id;
    String email;
    String firstName;
    String lastName;
    String avatar;

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        email: json["email"]??'mail@123',
        firstName: json["first_name"]??'first name',
        lastName: json["last_name"]??'last name',
        avatar: json["avatar"]??'https://st.depositphotos.com/2101611/3925/v/600/depositphotos_39258143-stock-illustration-businessman-avatar-profile-picture.jpg',
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "first_name": firstName,
        "last_name": lastName,
        "avatar": avatar,
    };
}
