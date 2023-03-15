import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final firebaseAuth = FirebaseAuth.instance;

  Future<String?> signIn(String email, String password) async {
    String? res;
    try {
      final result = await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      res = "success";
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        res = "Kullanıcı Bulunamadı";
      } else if (e.code == "wrong-password") {
        res = "Şifre Yanlış";
      } else if (e.code == "user-disabled") {
        res = "Kullanıcı pasif";
      }
    }
    return res;
  }
}
