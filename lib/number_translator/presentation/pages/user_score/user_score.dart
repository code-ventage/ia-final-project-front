import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:ia_final_project_front/config/service_locator/service_locator.dart';
import 'package:ia_final_project_front/number_translator/domain/entities/user_score_entity.dart';
import 'package:ia_final_project_front/number_translator/presentation/bloc/score/score_cubit.dart';

import '../../widgets/custom_text_form_field_widget.dart';

class UserScorePage extends StatelessWidget {
  const UserScorePage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = serviceLocator.get<ScoreCubit>();
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
                onChanged: (value){
                  cubit.filter(value);
                },
                controller: cubit.filterEditingController,
                readOnly: false,
              ),
            ),
          ),
          const Gap(20),
          BlocBuilder<ScoreCubit, ScoreState>(
            builder: (context, state) {
              final scores = cubit.userScores;
              if (scores == null) {
                cubit.initialize();
                return const Center(child: CircularProgressIndicator());
              }
              return SizedBox(
                height: MediaQuery.of(context).size.height * 0.8,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: ListView.builder(
                    itemCount: cubit.userScores!.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                          title: Text(cubit.userScores![index].score, style: const TextStyle(fontSize: 20)),
                          trailing: Text(cubit.userScores![index].username, style: const TextStyle(fontSize: 20)),
                          subtitle: const Text('2001-12-12'), //TODO 3/25/24 palmerodev : get this from the scores
                          leading: const Icon(Icons.sports_score, size: 40));
                    },
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}