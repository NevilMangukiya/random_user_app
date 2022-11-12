class RandomUser {
  String name;
  String firstName;
  String lastName;
  String email;
  String phone;
  String imageUrl;
  int age;
  String gender;
  String userName;
  String password;
  String uid;
  String area;
  String city;
  String state;
  String country;
  String pincode;

  RandomUser(
      {required this.name,
      required this.firstName,
      required this.lastName,
      required this.email,
      required this.phone,
      required this.imageUrl,
      required this.age,
      required this.gender,
      required this.userName,
      required this.password,
      required this.uid,
      required this.area,
      required this.city,
      required this.state,
      required this.country,
      required this.pincode});

  factory RandomUser.fromJson(Map<String, dynamic> user) {
    return RandomUser(
      name: user['name']['title'],
      firstName: user['name']['first'],
      lastName: user['name']['last'],
      email: user['email'],
      phone: user['phone'],
      imageUrl: user['picture']['large'],
      age: user['dob']['age'],
      gender: user['gender'],
      userName: user['login']['username'],
      password: user['login']['password'],
      uid: user['login']['uuid'],
      area:
          "${user['location']['street']['number'].toString()} ${user['location']['street']['name']}",
      city: user['location']['city'],
      state: user['location']['state'],
      country: user['location']['country'],
      pincode: user['location']['postcode'].toString(),
    );
  }
}
