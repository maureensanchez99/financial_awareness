import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home_page.dart';

class LoginState extends StatefulWidget {
  const LoginState({super.key});

  @override
  State<LoginState> createState() => LoginDisplay();
}

class LoginDisplay extends State<LoginState> {

  String userUser = "";
  String userPass = "";
  String storedUser = "";
  String storedPass = "";
  String status = "";

  final TextEditingController userVal = TextEditingController();
  final TextEditingController passVal = TextEditingController();

  bool shown = false;

  @override
  void initState() {
    super.initState();
    startup();
  }

  Future<void> startup() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      storedUser = prefs.getString('userID') ?? "magnolia1860";
      storedPass = prefs.getString('storedPass') ?? "Test";
    });
  }

  void check(String user, String pass) {
    setState(() {
      if (user == storedUser && pass == storedPass) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      } else {
        status = "User or Password incorrect. Please Try Again";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Flexible(
        flex: 1,
        fit: FlexFit.loose,
        child: SafeArea(
          child: Container(
            decoration: BoxDecoration(color: Color(0xFFA39AAC)),
            child: Padding(
              padding: const EdgeInsets.only(top: 0.0),
              child: Center(
                child: Column(
                  children: [
                    Container(
                      width: 250,
                      height: 250,
                      child: Image.asset("assets/images/logo_nobg.png"),
                    ),
                    SizedBox(height: 20),
                    Container(
                      width: 250,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: Color(0xFFF1EEDB),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextField(
                          controller: userVal,
                          style: TextStyle(color: Color(0xFF3C1053)),
                          decoration: InputDecoration(
                            fillColor: Color(0xFFF1EEDB),
                            border: OutlineInputBorder(),
                            hintText: 'Username',
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      width: 250,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: Color(0xFFF1EEDB),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextField(
                          controller: passVal,
                          obscureText: !shown,
                          style: TextStyle(color: Color(0xFF3C1053)),
                          decoration: InputDecoration(
                            fillColor: Color(0xFFF1EEDB),
                            border: OutlineInputBorder(),
                            hintText: "Password",
                            suffixIcon: IconButton(
                              icon: Icon(shown
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                              onPressed: () {
                                setState(() {
                                  shown = !shown; 
                                });
                              },
                            ),
                          ),
                          keyboardType: TextInputType.visiblePassword,
                          textInputAction: TextInputAction.done,
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        status,
                        style: TextStyle(
                          fontSize: 15,
                          color: Color.fromARGB(255, 151, 31, 23),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        userUser = userVal.text;
                        userPass = passVal.text;
                        check(userUser, userPass);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(241, 238, 219, 1),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 8,
                        ),
                      ),
                      child: Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(60, 16, 83, 1),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
