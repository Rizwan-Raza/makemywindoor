import 'package:makemywindoor/model/project_details.dart';
import 'package:makemywindoor/model/project_dimens.dart';

class Project {
  ProjectDetails projectDetails;
  List<ProjectDimensions> projectDimensions;
  int estimatedCharge;
  int totalCharge;

  Project(
      {required this.projectDetails,
      required this.projectDimensions,
      required this.estimatedCharge,
      required this.totalCharge});

  factory Project.empty() {
    return Project(
        projectDetails: ProjectDetails.empty(),
        projectDimensions: [],
        estimatedCharge: 0,
        totalCharge: 0);
  }

  Map<String, dynamic> toJson() {
    return {
      'projectDetails': projectDetails.toJson(),
      'ProjectDimensionss': projectDimensions,
      'estimatedCharge': estimatedCharge,
      'totalCharge': totalCharge
    };
  }

  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
        projectDetails: ProjectDetails.fromJson(json['projectDetails']),
        projectDimensions: json['projectDimensions'],
        estimatedCharge: json['estimatedCharge'],
        totalCharge: json['totalCharge']);
  }

  @override
  String toString() {
    return 'Project{projectDetails: $projectDetails, projectDimensions: $projectDimensions, estimatedCharge: $estimatedCharge, totalCharge: $totalCharge}';
  }
}
