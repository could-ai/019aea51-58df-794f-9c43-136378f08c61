class Officer {
  final String id;
  final String name;
  final String rank;
  final String department;
  final bool isActive;
  final DateTime contractEndDate;
  final String email;

  Officer({
    required this.id,
    required this.name,
    required this.rank,
    required this.department,
    required this.isActive,
    required this.contractEndDate,
    required this.email,
  });
}

class Appraisal {
  final String id;
  final String officerId;
  final DateTime dateCreated;
  final DateTime dueDate;
  final double score; // 1.0 to 5.0
  final String comments;
  final bool isCompleted;

  Appraisal({
    required this.id,
    required this.officerId,
    required this.dateCreated,
    required this.dueDate,
    required this.score,
    required this.comments,
    required this.isCompleted,
  });
}
