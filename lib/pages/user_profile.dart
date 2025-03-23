import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home_page.dart';
import 'user_calls.dart';
import 'login_page.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => ProfilePage();
}
class ProfilePage extends State<UserProfile> {

  String userName = "";
  String userID = "";
  String bio = "";
  String imgLink = "";

  @override
  void initState() {
    super.initState();
    loadProfile();
  }

  Future<void> loadProfile() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      userName = prefs.getString('userName') ?? "Mike Tiger";
      userID = prefs.getString('userID') ?? "magnolia1860";
      bio = prefs.getString('bio') ?? "My name is mike hear me roar\n\n\n\n\n\nroar";
      imgLink = prefs.getString('imgLink') ?? "https://images.squarespace-cdn.com/content/v1/59c0463990baded1a5b678d7/1513220484531-V44GLX52ZRGAIZ75I9Q3/LSU9205-Mike-VII-First-Day.jpg";
    });
  }

  void updateProfile() async {
    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => UpdateProfile())
                      );
    loadProfile();
  }

  void updateUsername() async {
    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => UpdateUsername())
                      );
    loadProfile();
  }
  void updatePassword() async {
    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => UpdatePassword())
                      );
  }

    Future<void> reset() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.setString('userName',"Mike Tiger");
      prefs.setString('userID', "magnolia1860");
      prefs.setString('bio', "My name is mike hear me roar\n\n\n\n\n\nroar");
      prefs.setString('imgLink', 'https://images.squarespace-cdn.com/content/v1/59c0463990baded1a5b678d7/1513220484531-V44GLX52ZRGAIZ75I9Q3/LSU9205-Mike-VII-First-Day.jpg');

      userName = prefs.getString('userName') ?? "Mike Tiger";
      userID = prefs.getString('userID') ?? "magnolia1860";
      bio = prefs.getString('bio') ?? "My name is mike hear me roar\n\n\n\n\n\nroar";
      imgLink = prefs.getString('imgLink') ?? "https://images.squarespace-cdn.com/content/v1/59c0463990baded1a5b678d7/1513220484531-V44GLX52ZRGAIZ75I9Q3/LSU9205-Mike-VII-First-Day.jpg";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Color.fromRGBO(163, 154, 172, 1)),
        child: Padding(
          padding: const EdgeInsets.only(top:10, left: 10),
          child: Column(
              children: <Widget> [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0, bottom: 10),
                      child: Container(
                        width: 150,
                        height: 150,
                        child:CircleAvatar(
                        radius: 75,
                        backgroundImage: NetworkImage(imgLink),
                        )
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, left: 50),
                      child: Column(
                        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget> [
                          Text(userName, style: TextStyle( fontSize: 25.0,
                                                           color: Colors.black,
                                                           fontWeight: FontWeight.bold,
                                                         ),
                          ),
                          Text(('@' + userID), style: TextStyle( fontSize: 18.0,
                                                           color: const Color.fromARGB(255, 216, 216, 216)
                                                         ),
                          )
                        ]
                      ),
                    ),
                  ],
                ),
                Padding(
                padding: const EdgeInsets.only(top: 20, left: 5, right: 15.0),
                child: Container(
                  height: 275,
                  width: 400,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(241, 238, 219,1),
                    border: Border.all(
                      color: Colors.black,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(10.0), // Uniform radius
                  ),
          
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(bio),
                  )
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                  Column(children:[
                    ElevatedButton(
                      onPressed: () {
                        updateProfile();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(241, 238, 219,1),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 8,
                        ),
                      ),
                      child: Text(
                        'Update Profile',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(60, 16, 83, 1),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        updateUsername();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(241, 238, 219,1),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 8,
                        ),
                      ),
                      child: Text(
                        'Update Username',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(60, 16, 83, 1),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        updatePassword();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(241, 238, 219,1),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 8,
                        ),
                      ),
                      child: Text(
                        'Update Password',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(60, 16, 83, 1),
                        ),
                      ),
                    ),
                  ]),
                  Column(children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PrivacyCall()),
                      );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(241, 238, 219,1),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 40,
                          vertical: 8,
                        ),
                      ),
                      child: Text(
                        'Privacy Policy',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(60, 16, 83, 1),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ToCCall()),
                      );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(241, 238, 219,1),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 8,
                        ),
                      ),
                      child: Text(
                        'Terms & Conditions',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(60, 16, 83, 1),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                         Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginState()),
                      );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(241, 238, 219,1),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 55,
                          vertical: 8,
                        ),
                      ),
                      child: Text(
                        'Sign Out',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(60, 16, 83, 1),
                        ),
                      ),
                    ),
                  ])
                ]),
              )
              ],
            )
          ),
      ),
    );
  }
}
