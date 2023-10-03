import 'package:flutter/material.dart';

import '../../../../core/services/firestore.dart';
import '../../../../core/shared/colors.dart';
import '../../../../core/shared/error.dart';
import '../../../../core/shared/loading.dart';
import '../widgets/topic_item.dart';

class TopicPage extends StatelessWidget {
  const TopicPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: FirestoreService().getTopics(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Scaffold(
              backgroundColor: blackVal,
              body: Center(
                child: buildCircularProgressIndicator(),
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: ErrorMessage(
                message: snapshot.error.toString(),
              ),
            );
          } else if (snapshot.hasData) {
            var topics = snapshot.data!;
            return Scaffold(
              backgroundColor: blackVal,
              body: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                primary: false,
                padding: const EdgeInsets.all(20.0),
                children:
                    topics.map((topic) => TopicItem(topic: topic)).toList(),
              ),
            );
          } else {
            return const Text("No Quiz found in Firestore");
          }
        });
  }
}
