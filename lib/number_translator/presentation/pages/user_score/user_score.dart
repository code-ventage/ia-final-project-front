import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ia_final_project_front/number_translator/domain/entities/user_score_entity.dart';
import 'package:ia_final_project_front/number_translator/presentation/bloc/score/score_cubit.dart';
import 'package:ia_final_project_front/number_translator/presentation/widgets/custom_text_form_field_widget.dart';

class UserScorePage extends StatelessWidget {
  const UserScorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ScoreCubit, ScoreState>(
      builder: (context, state) {
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
          body: SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Center(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: CustomTextFormField(
                        controller: TextEditingController(),
                        readOnly: false,
                      ),
                    ),
                  ),
                  ...scores
                      .map(
                        (e) => ListTile(
                          title: Text(e.username),
                          trailing: Text(e.score),
                        ),
                      )
                      .toList()
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
