import 'package:flutter/material.dart';
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
                              trailing: IconButton(
                                icon: const Icon(Icons.link, color: Colors.blue),
                                onPressed: () {
                                  // users should be able to click link if provided
                                },
                              ),
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