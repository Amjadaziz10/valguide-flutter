import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rxdart/rxdart.dart';
import 'package:valguide3/features/agent/business/entities/agent_entity.dart';
import 'package:valguide3/features/agent/data/models/agent_model.dart';
import 'auth.dart';
import 'models.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<List<Topic>> getTopics() async {
    var ref = _db.collection('topics');
    var snapshot = await ref.get();
    var data = snapshot.docs.map((s) => s.data());
    var topics = data.map((d) => Topic.fromJson(d));
    return topics.toList();
  }

  Future<Quiz> getQuiz(String quizId) async {
    var ref = _db.collection('quizzes').doc(quizId);
    var snapshot = await ref.get();
    return Quiz.fromJson(snapshot.data() ?? {});
  }

  Stream<Report> streamReport() {
    return AuthService().userStream.switchMap((user) {
      if (user != null) {
        var ref = _db.collection('reports').doc(user.uid);
        return ref.snapshots().map((doc) => Report.fromJson(doc.data()!));
      } else {
        return Stream.fromIterable([Report()]);
      }
    });
  }

  Future<void> updateUserReport(Quiz quiz) {
    var user = AuthService().user!;
    var ref = _db.collection('reports').doc(user.uid);

    var data = {
      'total': FieldValue.increment(1),
      'topics': {
        quiz.topic: FieldValue.arrayUnion([quiz.id])
      }
    };
    return ref.set(data, SetOptions(merge: true));
  }

  Stream<AgentModel> streamFavAgent() {
    return AuthService().userStream.switchMap((user) {
      if (user != null) {
        var ref = _db.collection('fav_agent').doc(user.uid);
        return ref.snapshots().map((doc) => AgentModel.fromJson(doc.data()!));
      } else {
        return Stream.fromIterable([AgentModel(status: 0, data: [])]);
      }
    });
  }

  // Future<List<AgentDataModel>> getFavAgent() async {
  //   var user = AuthService().user!;
  //   var ref = await _db.collection('fav_agent').doc(user.uid).get();
  //   var data = ref.data();
  //   var agent = data.
  //   return agent.toList();
  // }

  Future<void> updateUserFavAgent(AgentDataEntity agent) {
    var user = AuthService().user!;
    var ref = _db.collection('fav_agent').doc(user.uid);
    var abbility = [];
    for (var i = 0; i <= agent.abilities.length - 1; i++) {
      abbility.add({
        'slot': agent.abilities[i].slot,
        'displayName': agent.abilities[i].displayName,
        'description': agent.abilities[i].description,
        'displayIcon': agent.abilities[i].displayIcon,
      });
    }
    var data = {
      'status': 0,
      'data': FieldValue.arrayUnion([
        {
          'uuid': agent.uuid,
          'displayName': agent.displayName,
          'description': agent.description,
          'displayIcon': agent.displayIcon,
          'fullPortraitV2': agent.fullPortraitV2,
          'background': agent.background,
          'role': {
            'uuid': agent.role.uuid,
            'displayName': agent.role.displayName,
            'description': agent.role.description,
            'displayIcon': agent.role.displayIcon,
          },
          'abilities': abbility
        }
      ])
    };
    return ref.set(data, SetOptions(merge: true));
  }
}
