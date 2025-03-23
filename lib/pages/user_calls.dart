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

class ToCCall extends StatefulWidget {
  const ToCCall({super.key});

  @override
  State<ToCCall> createState() => ToCPage();
}

class ToCPage extends State<ToCCall> {

  String tocSHow = """Terms and Conditions for !GeauxBroke
Effective Date: Rn IG Last Updated: Ummm whenever I made this

Welcome to !GeauxBroke! These Terms and Conditions ("Terms") govern your use of the !GeauxBroke mobile application ("App") and its associated services ("Services"). By accessing or using the App, you agree to be bound by these Terms. If you do not agree, please refrain from using our App.

1. Acceptance of Terms
By downloading, installing, or using !GeauxBroke, you acknowledge that you have read, understood, and agree to these Terms, as well as our Privacy Policy. If you do not agree with these Terms, you are prohibited from using the App.

2. Eligibility
You must be at least 18 years old (or the legal age of majority in your jurisdiction) to use !GeauxBroke. By using the App, you confirm that you meet this requirement.

3. User Accounts
You may need to create a user account to access certain features.

You are responsible for maintaining the confidentiality of your account credentials and agree not to share them with others.

You agree to notify us immediately if you suspect unauthorized use of your account.

4. Use of Services
You may only use the App for lawful purposes.

You agree not to misuse the App, including but not limited to engaging in fraudulent activities, violating intellectual property rights, or attempting to harm other users.

5. Intellectual Property
All content, design, trademarks, logos, and intellectual property within the App are the property of !GeauxBroke or its licensors. You are granted a limited, non-exclusive license to access and use the App for personal, non-commercial purposes. Copying, modifying, or distributing any content without prior authorization is prohibited.

6. Fees and Transactions
Some features of the App may require payment. All fees are displayed upfront and are non-refundable unless stated otherwise.

!GeauxBroke is not liable for any third-party transaction failures or unauthorized charges.

7. Limitation of Liability
To the maximum extent permitted by law, !GeauxBroke is not liable for any indirect, incidental, or consequential damages arising from your use of the App or its Services. Your use of the App is at your own risk.

8. Termination
We reserve the right to suspend or terminate your access to the App at any time for any reason, including but not limited to a violation of these Terms.

9. Updates and Modifications
We may update these Terms from time to time. You will be notified of any significant changes, and continued use of the App signifies your acceptance of the updated Terms.

10. Governing Law
These Terms are governed by the laws of Wherever the hell this is. Any disputes arising from these Terms will be resolved in the courts of [Insert Location].

11. Contact Information
For any questions about these Terms, please contact us at: Email: dont have one Mailing Address: HA! youre trying to find us? Good Luck XP

By using !GeauxBroke, you acknowledge that you have read, understood, and agree to these Terms and Conditions.""";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 50),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(color: Color(0xFFA39AAC)),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: Container(
                height: 200,
                width: 300,
                decoration: BoxDecoration(
                      color: Color.fromRGBO(241, 238, 219,1),
                      border: Border.all(
                        color: Colors.black,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(10.0), 
                ),
                child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Text(
                      tocSHow,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                    ),
                      ),
              ),
            ),
                ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(241, 238, 219,1),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 8,
                        ),
                      ),
                      child: Text(
                        'Go Back',
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
    );
  }
}

class PrivacyCall extends StatefulWidget {
  const PrivacyCall({super.key});

  @override
  State<PrivacyCall> createState() => PrivacyPage();
}

class PrivacyPage extends State<PrivacyCall> {

  String privacyShow = """Privacy Policy for !GeauxBroke
Effective Date: Ummmmmmmmm- Last Updated: [Redacted]

At !GeauxBroke, we value your privacy and are committed to protecting your personal information. This Privacy Policy explains how we collect, use, share, and safeguard your data when you use our app and services.

1. Information We Collect
We may collect the following types of information:

Personal Information: Name, email address, phone number, and other information you provide during account registration.

Usage Data: Details about how you interact with the app, including features used, device information, and IP address.

Payment Information: Payment details for transactions within the app, processed securely by third-party payment processors.

Cookies and Tracking Technologies: Data collected automatically through cookies, analytics tools, and similar technologies.

2. How We Use Your Information
We use the information we collect to:

Provide and improve our services.

Process transactions and send confirmations.

Communicate with you about app updates, features, and promotions.

Analyze usage patterns to enhance your experience.

Comply with legal obligations.

3. How We Share Your Information
We do not sell your personal information. However, we may share it in the following circumstances:

With Service Providers: Third parties who assist us with app functions, such as hosting, analytics, or payment processing.

For Legal Requirements: If required by law, regulation, or legal process.

During Business Transfers: In case of mergers, acquisitions, or asset sales.

4. Your Choices and Rights
You have the right to:

Access: Request a copy of your personal information.

Correction: Update or correct inaccurate data.

Deletion: Request the deletion of your personal information (subject to certain exceptions).

Opt-Out: Manage your preferences for marketing communications.

Cookies: Adjust your browser settings to refuse cookies, though some app features may not function properly.

5. Data Security
We take reasonable measures to safeguard your data against unauthorized access, disclosure, alteration, and destruction. However, no method of transmission or storage is completely secure, and we cannot guarantee absolute security.

6. Third-Party Links and Services
Our app may contain links to third-party websites or services. We are not responsible for the privacy practices of these third parties. Please review their policies before providing any personal information.

7. Children’s Privacy
!GeauxBroke is not intended for users under the age of 18. We do not knowingly collect personal information from minors. If we discover that we have collected data from a minor, we will delete it promptly.

8. Changes to This Privacy Policy
We may update this Privacy Policy periodically. You will be notified of significant changes, and continued use of the app signifies your acceptance of the updated policy.

9. Contact Us
If you have any questions or concerns about this Privacy Policy or our data practices, please contact us: Email: We dont wanna talk to you Mailing Address: Dont even try it""";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 50),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(color: Color(0xFFA39AAC)),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: Container(
                height: 200,
                width: 300,
                decoration: BoxDecoration(
                      color: Color.fromRGBO(241, 238, 219,1),
                      border: Border.all(
                        color: Colors.black,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(10.0), 
                ),
                child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Text(
                      privacyShow,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                    ),
                      ),
              ),
            ),
                ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(241, 238, 219,1),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 8,
                        ),
                      ),
                      child: Text(
                        'Go Back',
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
    );
  }
}