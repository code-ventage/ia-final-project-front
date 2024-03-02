import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/number_translator_cubit.dart';

class NumberTranslatorPage extends StatelessWidget {
  const NumberTranslatorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<NumberTranslatorCubit, NumberTranslatorState>(
          builder: (context, state) {
            if(state is NumberTranslatorBlocInitial) {
              return Column(
                children: [
                  Text(state.counter.toString()),
                  ElevatedButton(
                    onPressed: () {
                      context.read<NumberTranslatorCubit>().counter(counter: state.counter + 1);
                    },
                    child: const Text("Translate"),
                  ),
                ],
              );
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}