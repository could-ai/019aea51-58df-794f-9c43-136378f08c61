import 'package:flutter/material.dart';
import '../models/data_models.dart';
import '../services/mock_data_service.dart';
import 'officer_detail_screen.dart';

class OfficerListScreen extends StatefulWidget {
  const OfficerListScreen({super.key});

  @override
  State<OfficerListScreen> createState() => _OfficerListScreenState();
}

class _OfficerListScreenState extends State<OfficerListScreen> {
  bool showOnlyActive = true;
  List<Officer> displayedOfficers = [];

  @override
  void initState() {
    super.initState();
    _updateList();
  }

  void _updateList() {
    setState(() {
      if (showOnlyActive) {
        displayedOfficers = MockDataService.getActiveOfficers();
      } else {
        displayedOfficers = MockDataService.officers;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Officer Database'),
        actions: [
          PopupMenuButton<bool>(
            icon: const Icon(Icons.filter_list),
            onSelected: (value) {
              setState(() {
                showOnlyActive = value;
                _updateList();
              });
            },
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: true,
                child: Text('Active Only'),
              ),
              const PopupMenuItem(
                value: false,
                child: Text('Show All'),
              ),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Chip(
              label: Text(showOnlyActive ? 'Showing: Active Officers' : 'Showing: All Records'),
              backgroundColor: showOnlyActive ? Colors.green[100] : Colors.grey[200],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: displayedOfficers.length,
              itemBuilder: (context, index) {
                final officer = displayedOfficers[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: officer.isActive ? Colors.blue : Colors.grey,
                      child: Text(officer.name[0]),
                    ),
                    title: Text(officer.name),
                    subtitle: Text('${officer.rank} • ${officer.department}'),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OfficerDetailScreen(officer: officer),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add officer logic
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
