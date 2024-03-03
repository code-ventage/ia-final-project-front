import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ia_final_project_front/config/config_data/configuration_data.dart';
import 'package:ia_final_project_front/config/service_locator/get_it.dart';
import 'package:ia_final_project_front/number_translator/presentation/bloc/configurations/configurations_cubit.dart';

import '../../../../go_router/routes.dart';

class ConfigurationsPage extends StatelessWidget {
  const ConfigurationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    var controller = context.read<ConfigurationsCubit>().controller;

    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(left: 10.0),
          child: Text('Configurations', style: TextStyle(fontSize: 20)),
        ),
        leading: IconButton(icon: const Icon(Icons.arrow_back), onPressed: (){
          context.pop();
        }),
        toolbarHeight: height * 0.1,
      ),
      body: Column(
        children: [
          ExpansionTile(
            leading: const Icon( Icons.route_outlined ),
            title: const Text('Hotspot IP Address'),
            subtitle: const Text('Input your hotspot IP address'),
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: SizedBox(
                  height: 65,
                  child: TextFormField(
                    controller: controller,
                    textAlignVertical: TextAlignVertical.top,
                    cursorHeight: 25,
                    decoration: InputDecoration(
                      suffix: IconButton(
                        icon: const Icon(Icons.save),
                        onPressed: () {
                          context.read<ConfigurationsCubit>().setBaseUrl(controller.text);
                        },
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
