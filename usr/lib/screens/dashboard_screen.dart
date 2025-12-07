import 'package:flutter/material.dart';
import '../services/mock_data_service.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final activeCount = MockDataService.getActiveOfficers().length;
    final dueCount = MockDataService.getOfficersDueForAppraisal().length;

    return Scaffold(
      appBar: AppBar(
        title: const Text('HR Command Center'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Overview',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: _buildSummaryCard(
                    context,
                    'Active Officers',
                    activeCount.toString(),
                    Icons.people,
                    Colors.blue,
                    () => Navigator.pushNamed(context, '/officers'),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildSummaryCard(
                    context,
                    'Due Appraisals',
                    dueCount.toString(),
                    Icons.warning_amber_rounded,
                    Colors.orange,
                    () => Navigator.pushNamed(context, '/tracking'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            const Text(
              'Quick Actions',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            ListTile(
              leading: const CircleAvatar(child: Icon(Icons.person_add)),
              title: const Text('Add New Officer'),
              subtitle: const Text('Create a new employee record'),
              onTap: () {
                // TODO: Implement add officer
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Add Officer feature coming soon')),
                );
              },
              tileColor: Colors.grey[100],
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            ),
            const SizedBox(height: 10),
            ListTile(
              leading: const CircleAvatar(child: Icon(Icons.assessment)),
              title: const Text('Create Appraisal'),
              subtitle: const Text('Start a new performance review'),
              onTap: () {
                 Navigator.pushNamed(context, '/officers');
              },
              tileColor: Colors.grey[100],
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryCard(BuildContext context, String title, String count, IconData icon, Color color, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 40, color: color),
              const SizedBox(height: 10),
              Text(
                count,
                style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              Text(
                title,
                style: const TextStyle(fontSize: 14, color: Colors.grey),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
