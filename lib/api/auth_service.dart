import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  AuthService._();

  static final AuthService instance = AuthService._();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  User? get currentUser => _auth.currentUser;

  Future<UserCredential> signInWithEmail({
    required String email,
    required String password,
  }) {
    return _auth.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<UserCredential?> signInWithGoogle() async {
    final googleUser = await GoogleSignIn().signIn();
    if (googleUser == null) return null;

    final googleAuth = await googleUser.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    final result = await _auth.signInWithCredential(credential);
    final user = result.user!;
    await saveProfile(
      name: user.displayName ?? googleUser.displayName ?? '',
      email: user.email,
    );
    return result;
  }

  Future<UserCredential> register({
    required String name,
    required String email,
    required String password,
    required String phone,
    required String avatar,
  }) async {
    final credential = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    await credential.user!.updateDisplayName(name);
    await saveProfile(name: name, phone: phone, avatar: avatar, email: email);
    return credential;
  }

  Future<DocumentSnapshot<Map<String, dynamic>>?> getProfile() {
    final user = currentUser;
    if (user == null) return Future.value(null);
    return _firestore.collection('users').doc(user.uid).get();
  }

  Future<void> saveProfile({
    String? name,
    String? phone,
    String? avatar,
    String? email,
  }) async {
    final user = currentUser;
    if (user == null) return;
    final profile = <String, dynamic>{};
    if (name != null) profile['name'] = name;
    if (phone != null) profile['phone'] = phone;
    if (avatar != null) profile['avatar'] = avatar;
    if (email != null) profile['email'] = email;
    await _firestore.collection('users').doc(user.uid).set(
      profile,
      SetOptions(merge: true),
    );
  }

  Future<void> sendPasswordResetEmail(String email) {
    return _auth.sendPasswordResetEmail(email: email);
  }

  Future<void> updatePassword({
    required String oldPassword,
    required String newPassword,
  }) async {
    final user = currentUser;
    if (user?.email == null) return;
    final credential = EmailAuthProvider.credential(
      email: user!.email!,
      password: oldPassword,
    );
    await user.reauthenticateWithCredential(credential);
    await user.updatePassword(newPassword);
  }

  Future<void> deleteAccount() async {
    final user = currentUser;
    if (user == null) return;
    await _firestore.collection('users').doc(user.uid).delete();
    await user.delete();
  }

  Future<void> signOut() async {
    await GoogleSignIn().signOut();
    await _auth.signOut();
  }
}