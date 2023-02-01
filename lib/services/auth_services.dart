import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleAuthService {
  GoogleSignIn googleSignin = GoogleSignIn();
  Future<void> clogingoogle() async {
    GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    print(googleUser?.displayName);
    print(googleAuth?.accessToken);
    print(googleAuth?.idToken);

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.idToken,
    );
    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);
    print(userCredential.user);
  }

  Future<void> googlessignout() async {
    await FirebaseAuth.instance.signOut().then((value) {
      googleSignin.signOut();
    });
  }

  void signinbygoogle() {}
}
