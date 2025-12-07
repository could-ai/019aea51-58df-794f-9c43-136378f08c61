import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../services/mock_data_service.dart';
import 'officer_detail_screen.dart';

class AppraisalTrackingScreen extends StatelessWidget {
  const AppraisalTrackingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dueOfficers = MockDataService.getOfficersDueForAppraisal();
    final dateFormat = DateFormat('MMM dd, yyyy');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Appraisal Tracking'),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.orange[50],
            child: Row(
              children: [
                const Icon(Icons.info_outline, color: Colors.orange),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'Showing officers whose contract ends within the next 3 months.',
                    style: TextStyle(color: Colors.orange[900]),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: dueOfficers.isEmpty
                ? const Center(child: Text('No appraisals due soon.'))
                : ListView.builder(
                    itemCount: dueOfficers.length,
                    itemBuilder: (context, index) {
                      final officer = dueOfficers[index];
                      final daysLeft = officer.contractEndDate.difference(DateTime.now()).inDays;
                      
                      return Card(
                        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        child: ListTile(
                          leading: const CircleAvatar(
                            backgroundColor: Colors.orange,
                            child: Icon(Icons.priority_high, color: Colors.white),
                          ),
                          title: Text(officer.name),
                          subtitle: Text('Contract ends: ${dateFormat.format(officer.contractEndDate)}'),
                          trailing: Chip(
                            label: Text('$daysLeft days left'),
                            backgroundColor: Colors.red[100],
                            labelStyle: const TextStyle(color: Colors.red),
                          ),
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
    );
  }
}
