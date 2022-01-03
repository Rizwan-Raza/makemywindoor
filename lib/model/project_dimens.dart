class ProjectDimesnion {
  int height;
  int width;
  String? remarks;
  int type;

  factory ProjectDimesnion.empty() =>
      ProjectDimesnion(height: 0, width: 0, remarks: null, type: 0);

  ProjectDimesnion(
      {required this.height,
      required this.width,
      this.remarks,
      required this.type});

  factory ProjectDimesnion.fromJson(Map<String, dynamic> json) {
    return ProjectDimesnion(
      height: json['height'] as int,
      width: json['width'] as int,
      remarks: json['remarks'] as String,
      type: json['type'] as int,
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
    return 'ProjectDimesnion{height: $height, width: $width, remarks: $remarks, type: $type}';
  }
}
