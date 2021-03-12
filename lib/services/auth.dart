import 'package:hobbyhub/modules/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'database.dart';
class AuthService{
  final FirebaseAuth _auth = FirebaseAuth.instance;

  MyUser _userFromFirebaseUser(User user)
  {
    return user != null ? MyUser(uid: user.uid): null;
  }
//  UserData _tutorFromFirebaseUser(User tutor)
//  {
//    return tutor != null ? UserData(uid: tutor.uid): null;
//  }

  Stream<MyUser> get user {
    return _auth.authStateChanges().map(_userFromFirebaseUser);
  }

  Future signInWithEmail(String email, String password)async
  {
    try{
      UserCredential result= await _auth.signInWithEmailAndPassword(email: email, password: password);
      User user = result.user;
      return _userFromFirebaseUser(user);
    }
    catch(e){
      print(e);
      return null;
    }
  }
  Future registerWithEmail(String email, String password)async
  {
    try{
      UserCredential result= await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User user = result.user;
//      await DatabaseService(uid: user.uid, category: 'dance').updateUserData('Name', '1234567890', 'Location','4 yrs');
      return _userFromFirebaseUser(user);
    }
    catch(e){
      print(e);
      return null;
    }
  }
//  Future tutorRegister(String name, String contact, String location, String experience, String category)async
//  {
//    try{
////      UserCredential result= await _auth.createUserWithEmailAndPassword(email: email, password: password);
////      User user = result.user;
//      await DatabaseService(uid: user.uid, category: category).updateUserData(name, contact, location,experience);
////      return _userFromFirebaseUser(user);
//    }
//    catch(e){
//      print(e);
//      return null;
//    }
//  }
  Future signingOut() async {
    try{
      return await _auth.signOut();
    }
    catch(e)
    {
      print(e);
      return null;
    }
  }
}
