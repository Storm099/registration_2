import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:registration_2/models/user_model.dart';
import 'package:registration_2/pages/home_page.dart';
import 'package:registration_2/services/my_box_service.dart';

class SignUp extends StatefulWidget {
  static const String id = "sign_up";

  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

   final _email = TextEditingController();
   final _number = TextEditingController();
   final _address = TextEditingController();
   final _password = TextEditingController();


   void _doSignUp(){
     String eml = _email.text.toString();
     String nmb = _number.text.toString();
     String adr = _address.text.toString();
     String pw = _password.text.toString();

     User user = User(
       name: eml,
       number: nmb,
       address: adr,
       password: pw
     );

     setState(() {

         MyBoxService().storeBox(user);

     });

   }
   void showMyToast(){
     Fluttertoast.showToast(
         msg: "Successfully registered",
         toastLength: Toast.LENGTH_SHORT,
         gravity: ToastGravity.BOTTOM,
         timeInSecForIosWeb: 1,
         backgroundColor: Colors.red,
         textColor: Colors.white,
         fontSize: 16.0
     );
   }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 7, 127, 123),
    body: SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.all(30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text("Welcome",style: TextStyle(color: Colors.white38),),
                    Text(
                      "Sign Up",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
                padding: const EdgeInsets.all(30),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(50),topRight: Radius.circular(50)),
                  color: Colors.white
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //#email
                     TextField(
                      controller: _email,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        hintText: "Enter email",
                        label: Text(
                          "Email",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18.0),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                //#number
                     TextField(
                       controller: _number,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        hintText: "Enter number",
                        label: Text(
                          "Number",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18.0),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    //#address
                     TextField(
                       controller: _address,
                      keyboardType: TextInputType.streetAddress,
                      decoration: const InputDecoration(
                        hintText: "Enter address",
                        label: Text(
                          "Address",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18.0),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    //#password
                     TextField(
                       controller: _password,
                      obscureText: true,
                      decoration: const InputDecoration(
                        hintText: "Enter password",
                        label: Text(
                          "Password",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18.0),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    const SizedBox(
                      height: 30,
                    ),

                    Container(
                      height: 46,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color.fromARGB(255, 7, 127, 123),
                      ),
                      child: TextButton(
                        onPressed: () {
                          _doSignUp();
                          showMyToast();
                        },
                        child: const Text(
                          "Sign Up",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "OR",
                      style: TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              FontAwesome.facebook_f,
                              color: Color.fromARGB(255, 117, 144, 198),
                              size: 16,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              FontAwesome.twitter,
                              color: Color.fromARGB(255, 20, 182, 250),
                              size: 16,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              FontAwesome.instagram,
                              color: Colors.black,
                              size: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Already have an account?",
                          style: TextStyle(color: Colors.grey),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacementNamed(context, HomePage.id);
                          },
                          child: const Text(
                            "SignIn",
                            style: TextStyle(
                                color: Color.fromARGB(255, 7, 127, 123),
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ),
    );
  }
}
