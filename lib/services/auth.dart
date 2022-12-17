import 'package:carpto/Models/userUid.dart';
import 'package:carpto/services/fire_data.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
class AuthService{
  final auth.FirebaseAuth _auth = auth.FirebaseAuth.instance;
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // create user object based on FirebaseUser
  UserUID _userFromFirebaseUser(auth.User? user){
    return user!= null ? UserUID(user.uid): UserUID("");
  }
  GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
    ]
  );

  // auth change user stream
  Stream<UserUID> get user {
    return _auth.authStateChanges().map(_userFromFirebaseUser);
  }

  //sign in annon
  Future signInAnon() async{
    try{
      auth.UserCredential result = await _auth.signInAnonymously();
      auth.User? user = result.user;
      return _userFromFirebaseUser(user);
    } catch(e){
      print(e.toString());
      return null;
    }
  }
  //sign in with email & password
  Future signInWithEmailAndPassword(String email, String password) async{
    try{
      auth.UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      auth.User? user = result.user;
      return _userFromFirebaseUser(user);
    }catch(e){
      print(e.toString());
      return null;
    }
  }

  //add email & password
  Future registerWithEmailAndPassword(String email, String password, String name, String handle) async{
    try{
      auth.UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      auth.User? user = result.user;
      DatabaseService db = DatabaseService(uid: result.user!.uid,email: user!.email??"");
      await db.updateUser(email,handle,"");
      return _userFromFirebaseUser(user);
    }catch(e){
      print(e.toString());
      return null;
    }
  }
  // sign out
  Future signOut() async{
    try{
      final SharedPreferences prefs = await _prefs;
      prefs.remove('name');
      prefs.remove('email');
      prefs.remove('userImageURL');
      _googleSignIn.signOut();
      return await _auth.signOut();
    }catch(e){
      print(e.toString());
      return null;
    }
  }
}