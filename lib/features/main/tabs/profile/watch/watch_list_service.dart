import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:movies_app/api/model/movie_details_response/movie.dart';

class WatchListService {
  WatchListService._();

  static final WatchListService instance = WatchListService._();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  CollectionReference<Map<String, dynamic>>? _watchListReference() {
    final user = _auth.currentUser;
    if (user == null) return null;
    return _firestore
        .collection('users')
        .doc(user.uid)
        .collection('watchlist');
  }

  Future<List<Movie>> loadSavedMovies() async {
    final ref = _watchListReference();
    if (ref == null) return [];

    final snapshot = await ref.get();
    return snapshot.docs.map((doc) => Movie.fromJson(doc.data())).toList();
  }

  Stream<List<Movie>> watchSavedMovies() {
    final user = _auth.currentUser;
    if (user == null) return Stream.value(const <Movie>[]);

    return _firestore
        .collection('users')
        .doc(user.uid)
        .collection('watchlist')
        .snapshots()
        .map(
          (snapshot) => snapshot.docs
              .map((doc) => Movie.fromJson(doc.data()))
              .toList(),
        );
  }

  Future<bool> isSaved(int? movieId) async {
    if (movieId == null) return false;
    final ref = _watchListReference();
    if (ref == null) return false;

    final doc = await ref.doc(movieId.toString()).get();
    return doc.exists;
  }

  Future<bool> toggleSave(Movie movie) async {
    final ref = _watchListReference();
    if (ref == null || movie.id == null) return false;

    final docRef = ref.doc(movie.id.toString());
    final doc = await docRef.get();

    if (doc.exists) {
      await docRef.delete();
      return false;
    } else {
      await docRef.set(movie.toJson());
      return true;
    }
  }
}