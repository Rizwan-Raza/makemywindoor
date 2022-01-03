import 'package:makemywindoor/model/project_details.dart';
import 'package:makemywindoor/model/project_dimens.dart';

class Project {
  ProjectDetails projectDetails;
  ProjectDimesnion projectDimesnion;
  int estimatedCharge;
  int totalCharge;

  factory Project.empty() => Project(
        projectDetails: ProjectDetails.empty(),
        projectDimesnion: ProjectDimesnion.empty(),
        estimatedCharge: 0,
        totalCharge: 0,
      );

  Project(
      {required this.projectDetails,
      required this.projectDimesnion,
      required this.estimatedCharge,
      required this.totalCharge});

  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
      projectDetails: ProjectDetails.fromJson(json['projectDetails']),
      projectDimesnion: ProjectDimesnion.fromJson(json['projectDimesnion']),
      estimatedCharge: json['estimatedCharge'],
      totalCharge: json['totalCharge'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'projectDetails': projectDetails.toJson(),
      'projectDimesnion': projectDimesnion.toJson(),
      'estimatedCharge': estimatedCharge,
      'totalCharge': totalCharge,
    };
  }

  @override
  String toString() {
    return 'Project{projectDetails: $projectDetails, projectDimesnion: $projectDimesnion, estimatedCharge: $estimatedCharge, totalCharge: $totalCharge}';
  }
}
