import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

/* NOTE - FAFSA Page 
  - Criteria: 

*/



//SECTION - ButtonSection
class ButtonSection extends StatelessWidget {
  const ButtonSection({super.key});

  Future<void> _launchURLBrowser(String url) async {
    final Uri _url = Uri.parse(url);
    if (!await launchUrl(_url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $_url');
    }
  }


  @override
  Widget build(BuildContext context) {
    //final Color color = Color(0xFF3C1053);
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextButton(onPressed: () {
              // This function will run when the Home button is pressed
              //print('Home button pressed');
              _launchURLBrowser("https://studentaid.gov/apply-for-aid/fafsa/fafsa-deadlines");

            }, child: Icon(Icons.computer),
          ),
          TextButton(onPressed: () {
              // This function will run when the Home button is pressed
              //print('Home button pressed');
            }, child: Icon(Icons.crisis_alert),
          ),
          TextButton(onPressed: () {
              // This function will run when the Home button is pressed
              //print('Home button pressed');

              showDialog(context: context, builder: (BuildContext context) {
              return AlertDialog(
                title: Text("Share Page:"),
                content: Text("Old Password Value does not match. Please try again"),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(); // Close the dialog
                    },
                    child: Text("Done"),
                  ),
                ],
              );
              });

            },
            child: Icon(Icons.share),
          ),
        ],
      ),
    );
  }

}

//SECTION - TextSection
class TextSection extends StatelessWidget {
  const TextSection({super.key, required this.description});

  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Text(description, softWrap: true),
    );
  }
}

//SECTION - ImageSection
class ImageSection extends StatelessWidget {
  const ImageSection({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return Image.asset(image, width: 600, height: 240, fit: BoxFit.cover);
  }
}

//SECTION - FAFSAOverview 
class FafsaOverview extends StatelessWidget {
  const FafsaOverview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(title: const Text('FAFSA Overview')),
      body: Container(
        decoration: BoxDecoration(
          color: Color(0xFFA39AAC),
        ),

      child: SingleChildScrollView(
        child: Column(
          children: [
              const ImageSection(
                image: 'assets/images/FAFSA_ss.png',
              ),
             const TitleSection(
              pageTitle: 'FAFSA Overview',
              desc: '2025–26 FAFSA® Form Now Available!',
            ),
            const ButtonSection(),
            const TextSection(
              description:
                  'Who We Are \n'
                  'FSA, an office of the U.S. Department of Education (ED), is '
                  'the largest provider of student financial aid in the nation. '
                  'At FSA, our more than 1,400 employees help make postsecondary education '
                  'possible for more than 9.9 million students each year. \n'
                  'What We Do \n'
                  'FSA is responsible for managing the student financial assistance '
                  'programs authorized under Title IV of the Higher Education Act of '
                  '1965. These programs provide grant, work-study, and loan funds to students '
                  'attending college or career school.'
                  ,
            ),
          ],
        )
      ),
    )
    );
  }
}

//SECTION - TitleSection
class TitleSection extends StatelessWidget {
  const TitleSection({super.key, required this.pageTitle, required this.desc});

  final String pageTitle;
  final String desc;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            /*1*/
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*2*/
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    pageTitle,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                //NOTE - Change color
                Text(desc, style: TextStyle(color: Colors.blueGrey[500])),
              ],
            ),
          ),
          /*3*/
          Icon(Icons.library_books, color: Color(0xFF3C1053)),
        ],
      ),
    );
  }
}