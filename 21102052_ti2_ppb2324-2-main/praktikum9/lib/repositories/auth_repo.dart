import 'package:firebase_auth/firebase_auth.dart';

class AuthRepo {
  final _auth = FirebaseAuth.instance;

  Future<void> login({required String email, required String password}) async {
    try {
      final User = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      // Jika login berhasil, userCredential akan berisi informasi pengguna.
      // Anda dapat mengaksesnya jika diperlukan.
    } on FirebaseAuthException catch (e) {
      // Penanganan kesalahan berdasarkan jenis kesalahan dari FirebaseAuth
      throw e.message ?? 'Something went wrong!';
    } catch (e) {
      // Penanganan kesalahan umum
      throw 'Something went wrong!';
    }
  }

  Future<void> register(
      {required String email, required String password}) async {
    try {
      final User = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      // Jika registrasi berhasil, userCredential akan berisi informasi pengguna.
      // Anda dapat mengaksesnya jika diperlukan.
    } on FirebaseAuthException catch (e) {
      // Penanganan kesalahan berdasarkan jenis kesalahan dari FirebaseAuth
      throw e.message ?? 'Something went wrong!';
    } catch (e) {
      // Penanganan kesalahan umum
      throw 'Something went wrong!';
    }
  }
}
