import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'new_entry.dart';

class Scholarships extends StatefulWidget {
  const Scholarships({super.key});

  @override
  State<Scholarships> createState() => _ScholarshipsState();
}

class _ScholarshipsState extends State<Scholarships> {
  final List<Map<String, dynamic>> _scholarships = [];

  void _addScholarship(Map<String, dynamic> newScholarship) {
    setState(() {
      _scholarships.add(newScholarship);
    });
  }

  Future<void> _launchURLBrowser(String url) async {
    final Uri _url = Uri.parse(url);
    if (!await launchUrl(_url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $_url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromRGBO(163, 154, 172, 1),
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 20.0),
              Container(
                width: double.infinity,
                height: 80,
                alignment: Alignment.center,
                child: const Text(
                  "My Scholarships",
                  style: TextStyle(
                    fontFamily: 'ProximaNova',
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () async {
                  final newScholarship = await Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const NewEntry()),
                  );

                  if (newScholarship != null) {
                    _addScholarship(newScholarship);
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(241, 238, 219, 1),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 8,
                  ),
                ),
                child: const Text(
                  'Enter new scholarship',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(60, 16, 83, 1),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              Expanded(
                child: _scholarships.isEmpty
                    ? const Text(
                        "No scholarships added yet",
                        style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
                      )
                    : ListView.builder(
                        itemCount: _scholarships.length,
                        itemBuilder: (context, index) {
                          final scholarship = _scholarships[index];
                          return Card(
                            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                            color: const Color.fromRGBO(241, 238, 219, 1),
                            child: ListTile(
                              title: Text(
                                scholarship['organization'],
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(60, 16, 83, 1),
                                ),
                              ),
                              subtitle: Text("\$${scholarship['amount']}"),
                              trailing: scholarship['link'] != null &&
                                      scholarship['link'].toString().isNotEmpty
                                  ? IconButton(
                                      icon: const Icon(Icons.link, color: Colors.blue),
                                      onPressed: () => _launchURLBrowser(scholarship['link']),
                                    )
                                  : null,
                            ),
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}