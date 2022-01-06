class ProjectDimensions {
  int height;
  int width;
  String? remarks;
  String type;

  factory ProjectDimensions.empty() =>
      ProjectDimensions(height: 0, width: 0, remarks: null, type: 'Type');

  ProjectDimensions(
      {required this.height,
      required this.width,
      this.remarks,
      required this.type});

  factory ProjectDimensions.fromJson(Map<String, dynamic> json) {
    return ProjectDimensions(
      height: json['height'] as int,
      width: json['width'] as int,
      remarks: json['remarks'] as String,
      type: json['type'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'height': height,
      'width': width,
      'remarks': remarks,
      'type': type,
    };
  }

  @override
  String toString() {
    return 'ProjectDimensions{height: $height, width: $width, remarks: $remarks, type: $type}';
  }
}
