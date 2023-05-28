import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:grocery_app/consts/firebase_consts.dart';
import 'package:grocery_app/fetch_screen.dart';
import 'package:grocery_app/widgets/text_widget.dart';

import '../screens/btm_bar.dart';
import '../services/global_methods.dart';

class GoogleButton extends StatelessWidget {
  const GoogleButton({Key? key}) : super(key: key);

  Future<void> _googleSignIn(context) async {
    final googleSignIn = GoogleSignIn(scopes: ['profile', 'email']);
    final googleAccount = await googleSignIn.signIn();
    if (googleAccount != null) {
      print('@debuging_Op haaaaaaaaaaaaaaay your data has been found!');
      print(
          '@debuging_Op haaaaaaaaaaaaaaay googleAccount is defined like this');
      print('@debuging_Op ${googleAccount}');
      try {
        final googleAuth = await googleAccount.authentication;
        print('@debuging_Op authonticate this user  ${googleAuth}');

        if (googleAuth.accessToken != null && googleAuth.idToken != null) {
          try {
            final authResult = await authInstance.signInWithCredential(
              GoogleAuthProvider.credential(
                  idToken: googleAuth.idToken,
                  accessToken: googleAuth.accessToken),
            );

            if (authResult.additionalUserInfo!.isNewUser) {
              await FirebaseFirestore.instance
                  .collection('users')
                  .doc(authResult.user!.uid)
                  .set({
                'id': authResult.user!.uid,
                'name': authResult.user!.displayName,
                'email': authResult.user!.email,
                'shipping-address': '',
                'userWish': [],
                'userCart': [],
                'createdAt': Timestamp.now(),
              });
            }
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => const FetchScreen(),
              ),
            );
          } on FirebaseException catch (error) {
            GlobalMethods.errorDialog(
                subtitle: '${error.message}', context: context);
          } catch (error) {
            GlobalMethods.errorDialog(subtitle: '$error', context: context);
          } finally {}
        }
      } catch (e) {
        print('@debuging_Op authonticate error  ${e.toString()}');
      }
      ;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.blue,
      child: InkWell(
        onTap: () {
          _googleSignIn(context);
        },
        child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          Container(
            color: Colors.white,
            child: Image.asset(
              'assets/images/google.png',
              width: 40.0,
            ),
          ),
          SizedBox(
            width: 8.w,
          ),
          TextWidget(
              text: 'Sign in with google', color: Colors.white, textSize: 12.sp)
        ]),
      ),
    );
  }
}
