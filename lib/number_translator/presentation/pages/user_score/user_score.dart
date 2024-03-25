import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ia_final_project_front/number_translator/domain/entities/user_score_entity.dart';

import '../../widgets/custom_text_form_field_widget.dart';

class UserScorePage extends StatelessWidget {
  const UserScorePage({super.key});

  @override
  Widget build(BuildContext context) {
    final scores = <UserScoreEntity>[
      UserScoreEntity(username: 'pepe', score: '200'),
      UserScoreEntity(username: 'pepe', score: '200'),
      UserScoreEntity(username: 'pepe', score: '200'),
      UserScoreEntity(username: 'pepe', score: '200'),
      UserScoreEntity(username: 'pepe', score: '200'),
      UserScoreEntity(username: 'pepe', score: '200'),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(tr('user_score_title')),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Gap(20),
          Center(
            child: SizedBox(
              height: 60,
              width: MediaQuery.of(context).size.width * 0.9,
              child: CustomTextFormField(
                suffix: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    //TODO 3/25/24 palmerodev : make the filter
                  }
                ),
                controller: TextEditingController(),
                readOnly: false,
              ),
            ),
          ),
          const Gap(20),
          SingleChildScrollView(child: Scores(scores: scores)),
        ],
      ),
    );
  }
}

class Scores extends StatelessWidget {
  const Scores({
    super.key,
    required this.scores,
  });

  final List<UserScoreEntity> scores;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.8,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: ListView.builder(
          itemCount: scores.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(scores[index].score, style: const TextStyle(fontSize: 20)),
              trailing: Text(scores[index].username, style: const TextStyle(fontSize: 20)),
              leading: const Icon(Icons.sports_score, size: 32)
            );
          },
        ),
      ),
    );
  }
}