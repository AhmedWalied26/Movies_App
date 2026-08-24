import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfileService {
  ProfileService._();

  static final ProfileService instance = ProfileService._();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  DocumentReference<Map<String, dynamic>> _profileReference(User user) {
    return _firestore.collection('users').doc(user.uid);
  }

  Future<Map<String, dynamic>> loadProfile() async {
    final user = _auth.currentUser;
    if (user == null) return {};

    final snapshot = await _profileReference(user).get();
    return snapshot.data() ?? {};
  }

  Future<void> updateProfile({
    required String name,
    required String phone,
    required String avatar,
  }) async {
    final user = _auth.currentUser;
    if (user == null) return;

    await user.updateDisplayName(name);
    await user.reload();
    await _profileReference(user).set({
      'name': name,
      'phone': phone,
      'avatar': avatar,
      'email': user.email,
    }, SetOptions(merge: true));
  }

  Future<void> deleteAccount() async {
    final user = _auth.currentUser;
    if (user == null) return;

    await _profileReference(user).delete();
    await user.delete();
  }
}
