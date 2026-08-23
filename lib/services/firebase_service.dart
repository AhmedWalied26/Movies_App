import 'package:firebase_auth/firebase_auth.dart';
import 'package:movies_app/l10n/app_localizations.dart';

class AuthResult {
  final bool success;
  final String? errorCode;
  final User? user;

  AuthResult({required this.success, this.errorCode, this.user});
}

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<AuthResult> login({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await _auth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password,
      );
      return AuthResult(success: true, user: credential.user);
    } on FirebaseAuthException catch (e) {
      return AuthResult(success: false, errorCode: e.code);
    } catch (e) {
      return AuthResult(success: false, errorCode: 'unknown');
    }
  }

  Future<AuthResult> register({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await _auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password,
      );
      return AuthResult(success: true, user: credential.user);
    } on FirebaseAuthException catch (e) {
      return AuthResult(success: false, errorCode: e.code);
    } catch (e) {
      return AuthResult(success: false, errorCode: 'unknown');
    }
  }
}

  String getAuthErrorMessage(AppLocalizations l10n, String code) {
  switch (code) {
    case 'user-not-found':
      return l10n.user_not_found;
    case 'wrong-password':
      return l10n.wrong_password;
    case 'invalid-email':
      return l10n.invalid_email;
    case 'user-disabled':
      return l10n.user_disabled;
    case 'weak-password':
      return l10n.weak_password;
    case 'email-already-in-use':
      return l10n.email_already_in_use;
    case 'invalid-credential':
      return l10n.invalid_credential;
    case 'too-many-requests':
      return l10n.too_many_requests;
    case 'network-request-failed':
      return l10n.network_request_failed;
    case 'operation-not-allowed':
      return l10n.operation_not_allowed;
    default:
      return l10n.something_went_wrong;
  }

  }
