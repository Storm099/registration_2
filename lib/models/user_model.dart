
class User{

  String ?name;
  String ?number;
  String ?address;
  String ?password;

  User({this.name,this.number,this.address,this.password});

  User.fromJson(Map<String, dynamic> json):
      name = json['name'],
      number = json['number'],
      address = json['address'],
      password = json['password'];

  Map<String, dynamic> toJson(){
    return {
      'name':name,
      'number':number,
      'address':address,
      'password':password
    };
  }

}