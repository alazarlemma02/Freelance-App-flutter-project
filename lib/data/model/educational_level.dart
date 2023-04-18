class EducationLevel {
  final int educationevelId;
  final String educationevelType;
  const EducationLevel(
      {required this.educationevelId, required this.educationevelType});

  factory EducationLevel.fromJson(Map<dynamic, dynamic> json) {
    return EducationLevel(
      educationevelId: json["educationevelId"],
      educationevelType: json["educationevelType"],
    );
  }

  Map<String, dynamic> toJson(){
    return {
      "educationevelId":educationevelId,
      "educationevelType":educationevelType
    };
  }
}