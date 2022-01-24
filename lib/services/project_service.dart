import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:makemywindoor/model/project.dart';

class ProjectServices {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> createProject(Project project) async {
    await _firestore
        .collection('projects')
        .doc(project.projectID)
        .set(project.toMap());
  }

  getAllProjects() {
    return _firestore.collection('projects').snapshots();
  }

  getAllProducts() {
    return _firestore.collection('products').snapshots();
  }

  getProductsOf(String type) {
    if (type.isNotEmpty) {
      return _firestore
          .collection('products')
          .where('pType', isEqualTo: type)
          .snapshots();
    } else {
      return getAllProducts();
    }
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getProjects(String phoneNumber) {
    return _firestore
        .collection('projects')
        .where('createdBy.phone', isEqualTo: phoneNumber)
        .snapshots();
  }

  Future<void> updateProject(Project project) async {
    await _firestore
        .collection('projects')
        .doc(project.projectID)
        .update(project.toMap());
  }

  Future<void> deleteProject(Project project) async {
    await _firestore.collection('projects').doc(project.projectID).delete();
  }
}
