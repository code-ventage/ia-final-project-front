import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ia_final_project_front/number_translator/presentation/bloc/configurations/configurations_cubit.dart';

class BaseUrlPage extends StatelessWidget {
  const BaseUrlPage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<ConfigurationsCubit>().getIP();

    return BlocBuilder<ConfigurationsCubit, ConfigurationsState>(
      builder: (context, state) {

        return Scaffold(
          appBar: AppBar(
            title: const Text('Base Url Page'),
          ),
          body: Center(
              child: Text((state as ConfigurationsInitial).wifiIp)
          ),
        );
      },
    );
  }
}
