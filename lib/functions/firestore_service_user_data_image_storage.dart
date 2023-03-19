import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_authentication_task/models/email_pass_model.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final CollectionReference _usersRef =
      FirebaseFirestore.instance.collection('users');

  Future<String?> uploadImage(String userId, String? email) async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile == null) {
      return null;
    }
    File file = File(pickedFile.path);
    Reference reference = _storage.ref().child('users/$userId/profile.jpg');
    UploadTask uploadTask = reference.putFile(file);
    TaskSnapshot taskSnapshot = await uploadTask;
    String url = await taskSnapshot.ref.getDownloadURL();
    return url;
  }

  Future<String?> getImageUrl(String userId) async {
    try {
      Reference reference = _storage.ref().child('users/$userId/profile.jpg');
      String url = await reference.getDownloadURL();
      return url;
    } catch (e) {
      return null;
    }
  }

  // Future<void> updateUser(user) async {
  //   await _usersRef.doc(user.email).set(user.toMap());
  // }

  Future<void> updateUser(UserModel user) async {
    await _usersRef.doc(user.email).update(user.toMap());
  }


  Future<UserModel?> getUser(String email, String password) async {
    QuerySnapshot querySnapshot = await _usersRef
        .where('email', isEqualTo: email)
        .where('password', isEqualTo: password)
        .get();

    if (querySnapshot.docs.isEmpty) {
      return null;
    } else {
      DocumentSnapshot documentSnapshot = querySnapshot.docs.first;
      return UserModel.fromMap(documentSnapshot.data() as Map<String, dynamic>);
    }
  }

}
