import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ia_final_project_front/number_translator/presentation/bloc/configurations/configurations_cubit.dart';

class ConfigurationsPage extends StatelessWidget {
  const ConfigurationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final height = MediaQuery.of(context).size.height;
    final cubit = context.read<ConfigurationsCubit>();
    final controller = cubit.controller;

    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Text(tr('configurations_page_title'), style: const TextStyle(fontSize: 20)),
        ),
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              context.pop();
            }),
        toolbarHeight: height * 0.1,
      ),
      body: Column(
        children: [
          buildHotsPotIpAddressConfiguration(themeData, cubit, controller),
          ListTile(
            title: Text(tr("translation_configuration_title")),
            subtitle: Text(tr("translation_configuration_subtitle")),
          ),
        ],
      ),
    );
  }

  ExpansionTile buildHotsPotIpAddressConfiguration(ThemeData themeData, ConfigurationsCubit cubit, TextEditingController controller) {
    return ExpansionTile(
      leading: const Icon(Icons.route_outlined),
      title: Text(tr('hotspot_ip_address_label')),
      subtitle: Text(tr('input_your_hotspot_ip_address')),
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: SizedBox(
            height: 65,
            child: BlocConsumer<ConfigurationsCubit, ConfigurationsState>(
              listener: (context, state) {
                if (state is ConfigurationsInitial) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      duration: const Duration(seconds: 1),
                      content: Text(
                        '${tr('the_base_has_been_changed')} ${state.hotspotAddress}',
                        style: themeData.textTheme.bodyLarge?.copyWith(
                          color: themeData.colorScheme.onSecondary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                }
              },
              builder: (context, state) {
                final state = cubit.state as ConfigurationsInitial;
                return TextFormField(
                  controller: controller..text = state.hotspotAddress,
                  textAlignVertical: TextAlignVertical.top,
                  cursorHeight: 25,
                  decoration: InputDecoration(
                    suffix: IconButton(
                      icon: const Icon(Icons.save),
                      onPressed: () => cubit.setBaseUrl(controller.text),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: themeData.colorScheme.secondary,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: themeData.colorScheme.secondary,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        )
      ],
    );
  }
}