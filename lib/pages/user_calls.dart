import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home_page.dart';

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({super.key});

  @override
  State<UpdateProfile> createState() => ProfileSetup();
}

class ProfileSetup extends State<UpdateProfile> {

  String userName = "";
  String bio = "";
  String imgLink = "";
  TextEditingController nameController = TextEditingController();
  TextEditingController linkController = TextEditingController();
  TextEditingController bioController = TextEditingController();


  @override
  void initState() {
    super.initState();
    loadProfile();
  }

  Future<void> loadProfile() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      userName = prefs.getString('userName') ?? "Mike Tiger";
      bio = prefs.getString('bio') ?? "My name is mike hear me roar\n\n\n\n\n\nroar";
      imgLink = prefs.getString('imgLink') ?? "https://images.squarespace-cdn.com/content/v1/59c0463990baded1a5b678d7/1513220484531-V44GLX52ZRGAIZ75I9Q3/LSU9205-Mike-VII-First-Day.jpg";

      nameController.text = userName;
      linkController.text = imgLink;
      bioController.text = bio;
    });
  }

    Future<void> setNew() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.setString('userName',nameController.text);
      prefs.setString('bio', bioController.text);
      prefs.setString('imgLink', linkController.text);

      userName = prefs.getString('userName') ?? "Mike Tiger";
      bio = prefs.getString('bio') ?? "My name is mike hear me roar\n\n\n\n\n\nroar";
      imgLink = prefs.getString('imgLink') ?? "https://images.squarespace-cdn.com/content/v1/59c0463990baded1a5b678d7/1513220484531-V44GLX52ZRGAIZ75I9Q3/LSU9205-Mike-VII-First-Day.jpg";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(color: Color(0xFFA39AAC)),
          child: Padding(
            padding: const EdgeInsets.only(top: 40.0),
            child: Column(
              children: [
                Container(
                          width: 250,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              color: Color(0xFFF1EEDB),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TextField(
                              controller: nameController,
                              style: TextStyle(color: Color(0xFF3C1053)),
                              decoration: InputDecoration(
                                fillColor: Color(0xFFF1EEDB),
                                border: OutlineInputBorder(),
                                hintText: 'Name',
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 15),
                        Container(
                          width: 250,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              color: Color(0xFFF1EEDB),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TextField(
                              controller: linkController,
                              style: TextStyle(color: Color(0xFF3C1053)),
                              decoration: InputDecoration(
                                fillColor: Color(0xFFF1EEDB),
                                border: OutlineInputBorder(),
                                hintText: 'Profile Image Link',
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 15),
                        Container(
                          width: 250,
                          height: 218,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              color: Color(0xFFF1EEDB),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TextField(
                              
                              controller: bioController,
                              style: TextStyle(color: Color.fromRGBO(60, 16, 83, 1)),
                              decoration: InputDecoration(
                                
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 25.0,
                                  horizontal: 10.0,
                                ),
                                fillColor: Color(0xFFF1EEDB),
                                border: OutlineInputBorder(),
                                hintText: 'Bio',
                              ),
                              maxLines: null,
                              keyboardType: TextInputType.multiline,
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () {

                            setNew();
                            Navigator.pop(context, {'userName': userName, 'bio': bio, 'imgLink': imgLink});

                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromRGBO(241, 238, 219, 1),
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
                            Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromRGBO(241, 238, 219, 1),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 30,
                              vertical: 8,
                            ),
                          ),
                          child: Text(
                            'Back',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(60, 16, 83, 1),
                            ),
                          ),
                        ),
              ]
            ),
          )
        ),
      ),
    );
  }
}

class UpdateUsername extends StatefulWidget {
  const UpdateUsername({super.key});

  @override
  State<UpdateUsername> createState() => UserSetup();
}

class UserSetup extends State<UpdateUsername> {

  String userID = "";

  final TextEditingController getName = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadProfile();
  }

  Future<void> loadProfile() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      userID = prefs.getString('userID') ?? "magnolia1860";
      getName.text = userID;
    });
  }

  Future<void> updateProfile() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.setString('userID', getName.text);

      userID = prefs.getString('userID') ?? "magnolia1860";
    });
  }

    Future<void> reset() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.setString('userID', "magnolia1860");
      
      userID = prefs.getString('userID') ?? "magnolia1860";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(color: Color(0xFFA39AAC)),
        child: Padding(
          padding: const EdgeInsets.only(top:50),
          child: Column(
            children: [
              Container(
                        width: 250,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: Color(0xFFF1EEDB),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextField(
                            controller: getName,
                            style: TextStyle(color: Color(0xFF3C1053)),
                            decoration: InputDecoration(
                              fillColor: Color(0xFFF1EEDB),
                              border: OutlineInputBorder(),
                              hintText: 'Username',
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                      ElevatedButton(
                        onPressed: () {
                          updateProfile();
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromRGBO(241, 238, 219, 1),
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
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromRGBO(241, 238, 219, 1),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 30,
                            vertical: 8,
                          ),
                        ),
                        child: Text(
                          'Back',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(60, 16, 83, 1),
                          ),
                        ),
                      ),
            ]
          ),
        )
      ),
    );
  }
}

class UpdatePassword extends StatefulWidget {
  const UpdatePassword({super.key});

  @override
  State<UpdatePassword> createState() => PassSetup();
}
/*Unfinished */
class PassSetup extends State<UpdatePassword> {

  String oldPass = "";

  final TextEditingController getOldPass = TextEditingController();
  final TextEditingController getNewPassOne = TextEditingController();
  final TextEditingController getNewPassTwo = TextEditingController();

  @override
  void initState() {
    super.initState();
    setup();
  }

  Future<void> setup() async {

    final prefs = await SharedPreferences.getInstance();
    setState(() {
      oldPass = prefs.getString('storedPass') ?? "TotallySafePass123";
    });

  }

  Future<void> updateProfile(String tryOld, String newOne, String newTwo) async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      if (tryOld != oldPass) {
        showDialog(context: context, builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Try Again"),
          content: Text("Old Password Value does not match. Please try again"),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text("OK"),
            ),
          ],
        );
        });
      } else if(newOne != newTwo){
        showDialog(context: context, builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Try Again"),
          content: Text("New Password Entries do not match. Please try again."),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text("OK"),
            ),
          ],
        );
        });
      } else {
        prefs.setString('storedPass', newOne);
        Navigator.pop(context);
      }
    });
  } 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(color: Color(0xFFA39AAC)),
        child: Padding(
          padding: const EdgeInsets.only(top:50.0),
          child: Column(
            children: [
              Container(
                        width: 250,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: Color(0xFFF1EEDB),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextField(
                            controller: getOldPass,
                            style: TextStyle(color: Color(0xFF3C1053)),
                            decoration: InputDecoration(
                              fillColor: Color(0xFFF1EEDB),
                              border: OutlineInputBorder(),
                              hintText: 'Enter Old Password',
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
                            controller: getNewPassOne,
                            style: TextStyle(color: Color(0xFF3C1053)),
                            decoration: InputDecoration(
                              fillColor: Color(0xFFF1EEDB),
                              border: OutlineInputBorder(),
                              hintText: 'Enter New Password',
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
                            controller: getNewPassTwo,
                            style: TextStyle(color: Color(0xFF3C1053)),
                            decoration: InputDecoration(
                              fillColor: Color(0xFFF1EEDB),
                              border: OutlineInputBorder(),
                              hintText: 'Re-Enter New Password',
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          updateProfile(getOldPass.text, getNewPassOne.text, getNewPassTwo.text);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromRGBO(241, 238, 219, 1),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 30,
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
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromRGBO(241, 238, 219, 1),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 30,
                            vertical: 8,
                          ),
                        ),
                        child: Text(
                          'Back',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(60, 16, 83, 1),
                          ),
                        ),
                      ),
            ]
          ),
        )
      ),
    );
  }
}
