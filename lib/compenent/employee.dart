class Employee {
  String id;
  String name;
  DateTime birthDate;
  DateTime firstAppointmentDate;
  DateTime currentAppointmentDate;
  String position;
  int degree;
  double positionSeniorityPoints;
  double directorPoints;
  double trainingPoints;

  Employee({
    required this.id,
    required this.name,
    required this.birthDate,
    required this.firstAppointmentDate,
    required this.currentAppointmentDate,
    required this.position,
    required this.degree,
    this.positionSeniorityPoints = 0.0,
    this.directorPoints = 0.0,
    this.trainingPoints = 0.0,
  });

  // حساب إجمالي النقاط
  double calculateTotalPoints() {
    return positionSeniorityPoints + directorPoints + trainingPoints;
  }

  // حساب الأقدمية بالأشهر
  int calculateSeniorityInMonths() {
    final DateTime now = DateTime.now();
    int months = (now.year - currentAppointmentDate.year) * 12;
    months += now.month - currentAppointmentDate.month;
    return months;
  }

  // التحقق من أهلية الترقية (30 شهر أو أكثر)
  bool isEligibleForPromotion() {
    return calculateSeniorityInMonths() >= 30;
  }

  // نسخة من الموظف مع درجة جديدة
  Employee copyWithNewDegree(int newDegree) {
    return Employee(
      id: id,
      name: name,
      birthDate: birthDate,
      firstAppointmentDate: firstAppointmentDate,
      currentAppointmentDate: DateTime.now(),
      position: position,
      degree: newDegree,
      positionSeniorityPoints: positionSeniorityPoints,
      directorPoints: directorPoints,
      trainingPoints: trainingPoints,
    );
  }
  String toString() {
  return 'ID: $id, Name: $name, Position: $position, Degree: $degree, Total Points: ${calculateTotalPoints()}';
}
}