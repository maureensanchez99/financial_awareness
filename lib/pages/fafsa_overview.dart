import 'package:flutter/material.dart';


/* NOTE - FAFSA Page 
  - Criteria: 

*/

class FafsaOverview extends StatelessWidget {
  const FafsaOverview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('FAFSA Overview')),
      body: const Center(child: Text('FAFSA Overview Content')),
    );
  }
}
