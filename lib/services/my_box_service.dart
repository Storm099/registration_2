
import 'package:hive/hive.dart';
import 'package:registration_2/models/user_model.dart';

class MyBoxService{
  
  var myBox = Hive.box("storm_box");
  
  void storeBox(User user){
    myBox.put("user", user.toJson());
  }
  
  List<User> loadUserList(){
    
    List<User> list = [];
    list.add(User.fromJson(myBox.get("user")));
    
    return list;
  }
  
}