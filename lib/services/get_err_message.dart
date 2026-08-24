import 'package:movies_app/l10n/app_localizations.dart';

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