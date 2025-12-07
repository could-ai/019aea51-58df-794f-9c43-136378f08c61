import 'data_models.dart';

class MockDataService {
  static final List<Officer> officers = [
    Officer(
      id: '1',
      name: 'John Doe',
      rank: 'Captain',
      department: 'Operations',
      isActive: true,
      contractEndDate: DateTime.now().add(const Duration(days: 400)),
      email: 'john.doe@example.com',
    ),
    Officer(
      id: '2',
      name: 'Jane Smith',
      rank: 'Lieutenant',
      department: 'Logistics',
      isActive: true,
      contractEndDate: DateTime.now().add(const Duration(days: 80)), // Due for appraisal soon (< 90 days)
      email: 'jane.smith@example.com',
    ),
    Officer(
      id: '3',
      name: 'Robert Brown',
      rank: 'Sergeant',
      department: 'Security',
      isActive: false,
      contractEndDate: DateTime.now().subtract(const Duration(days: 10)),
      email: 'robert.brown@example.com',
    ),
    Officer(
      id: '4',
      name: 'Emily Davis',
      rank: 'Commander',
      department: 'Operations',
      isActive: true,
      contractEndDate: DateTime.now().add(const Duration(days: 60)), // Due for appraisal soon
      email: 'emily.davis@example.com',
    ),
  ];

  static final List<Appraisal> appraisals = [
    Appraisal(
      id: '101',
      officerId: '1',
      dateCreated: DateTime.now().subtract(const Duration(days: 100)),
      dueDate: DateTime.now().subtract(const Duration(days: 90)),
      score: 4.5,
      comments: 'Excellent performance in Q1.',
      isCompleted: true,
    ),
  ];

  // Logic to filter active officers
  static List<Officer> getActiveOfficers() {
    return officers.where((o) => o.isActive).toList();
  }

  // Logic to find officers needing appraisal (3 months before end date)
  static List<Officer> getOfficersDueForAppraisal() {
    final now = DateTime.now();
    final threeMonthsFromNow = now.add(const Duration(days: 90));
    
    return officers.where((o) {
      return o.isActive && 
             o.contractEndDate.isAfter(now) && 
             o.contractEndDate.isBefore(threeMonthsFromNow);
    }).toList();
  }
  
  static Officer? getOfficerById(String id) {
    try {
      return officers.firstWhere((o) => o.id == id);
    } catch (e) {
      return null;
    }
  }
}
