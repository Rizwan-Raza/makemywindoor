class ProjectDetails {
  String projectName;
  String customerName;
  String customerNumber;
  String? others;

  ProjectDetails({
    required this.projectName,
    required this.customerName,
    required this.customerNumber,
    this.others,
  });

  factory ProjectDetails.empty() => ProjectDetails(
        projectName: '',
        customerName: '',
        customerNumber: '',
        others: '',
      );

  factory ProjectDetails.fromJson(Map<String, dynamic> json) => ProjectDetails(
        projectName: json["projectName"],
        customerName: json["customerName"],
        customerNumber: json["customerNumber"],
        others: json["others"],
      );

  Map<String, dynamic> toJson() => {
        "projectName": projectName,
        "customerName": customerName,
        "customerNumber": customerNumber,
        "others": others,
      };

  @override
  String toString() {
    return 'ProjectDetails{projectName: $projectName, customerName: $customerName, customerNumber: $customerNumber, others: $others}';
  }
}
