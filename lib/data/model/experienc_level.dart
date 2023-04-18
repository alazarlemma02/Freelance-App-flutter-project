class ExperienceLevel {
  final int experienceLevelId;
  final String experienceLevelType;
  const ExperienceLevel(
      {required this.experienceLevelId, required this.experienceLevelType});

  factory ExperienceLevel.fromJson(Map<dynamic, dynamic> json) {
    return ExperienceLevel(
      experienceLevelId: json["experienceLevelId"],
      experienceLevelType: json["experienceLevelType"],
    );
  }
   Map<String, dynamic> toJson(){
    return {
      "experienceLevelId ": experienceLevelId,
      "experienceLevelType":experienceLevelType
    };
  }
}
