import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

/* NOTE - FAFSA Page 
  - Criteria: 

*/



//SECTION - ButtonSection
class ButtonSection extends StatelessWidget {
  const ButtonSection({super.key});

    void _launchURL(String url) async {
      final Uri uri = Uri.parse(url);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri);
      } else {
        print('Could not launch $url');
      }
    }

  @override
  Widget build(BuildContext context) {
    final Color color = Color(0xFF3C1053);
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ButtonWithText(color: color, icon: Icons.computer, label: 'FAFSA Form', 
            onPressed: () {
              _launchURL('https://www.facebook.com');
            },
          ),
          ButtonWithText(color: color, icon: Icons.crisis_alert, label: 'Deadlines', 
            onPressed: () {
              // This function will run when the Home button is pressed
              //print('Home button pressed');
            },
          ),
          ButtonWithText(color: color, icon: Icons.share, label: 'Share', 
            onPressed: () {
              // This function will run when the Home button is pressed
              //print('Home button pressed');
            },
          ),
        ],
      ),
    );
  }

}

class ButtonWithText extends StatelessWidget {
  const ButtonWithText({
    super.key,
    required this.color,
    required this.icon,
    required this.label,
    required this.onPressed,
  });

  final Color color;
  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      // ···
      onPressed: () {},
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
        //primary: color,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color),
          Padding(
            padding: const EdgeInsets.only(top: 15, left: 10, right: 10),
            child: Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: color,
              ),
            ),
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

      child: const SingleChildScrollView(
        child: Column(
          children: [
              ImageSection(
                image: 'assets/images/FAFSA_ss.png',
              ),
             TitleSection(
              pageTitle: 'FAFSA Overview',
              desc: '2025–26 FAFSA® Form Now Available!',
            ),
            ButtonSection(),
            TextSection(
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