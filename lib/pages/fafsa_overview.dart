import 'package:flutter/material.dart';


/* NOTE - FAFSA Page 
  - Criteria: 

*/

//SECTION - ButtonSection
class ButtonSection extends StatelessWidget {
  const ButtonSection({super.key});

  @override
  Widget build(BuildContext context) {
    final Color color = Theme.of(context).primaryColor;
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ButtonWithText(color: color, icon: Icons.computer, label: 'FAFSA Form'),
          ButtonWithText(color: color, icon: Icons.crisis_alert, label: 'Deadlines'),
          ButtonWithText(color: color, icon: Icons.share, label: 'Share'),
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
  });

  final Color color;
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      // ···
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Padding(
          padding: const EdgeInsets.only(top: 8),
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
      appBar: AppBar(title: const Text('FAFSA Overview')),
      body: const SingleChildScrollView(child: Column(
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
                  'possible for more than 9.9 million students each year.'
                  ,
            ),
          ],
        )
      ),
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
                Text(desc, style: TextStyle(color: Colors.grey[500])),
              ],
            ),
          ),
          /*3*/
          Icon(Icons.library_books, color: Color(0xFF498467)),
        ],
      ),
    );
  }
}