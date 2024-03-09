import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:ia_final_project_front/config/service_locator/service_locator.dart';
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
          const Gap(20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: DropdownMenu(
              enableSearch: true,
              controller: TextEditingController(text: tr('current_language')),
              width: MediaQuery.of(context).size.width - 20,
              dropdownMenuEntries: [
                DropdownMenuEntry(
                  value: 'es',
                  label: tr('spanish_language'),
                ),
                DropdownMenuEntry(
                  value: 'en',
                  label: tr('english_language'),
                ),
              ],
              onSelected: (value) {
                serviceLocator.get<ConfigurationsCubit>().changeLanguage(value == 'es');
              },
            ),
          ),
        ],
      ),
    );
  }

  ExpansionTile buildHotsPotIpAddressConfiguration(ThemeData themeData, ConfigurationsCubit cubit, TextEditingController controller) {
    return ExpansionTile(
      leading: const Icon(Icons.route_outlined, color: Colors.lightBlueAccent),
      title: Text(tr('hotspot_ip_address_label'), style: const TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 16
      )),
      subtitle: Text(tr('input_your_hotspot_ip_address')),
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: SizedBox(
            height: 58,
            child: BlocBuilder<ConfigurationsCubit, ConfigurationsState>(
              builder: (context, state) {
                final state = cubit.state as ConfigurationsInitial;
                return TextFormField(
                  controller: controller..text = state.hotspotAddress,
                  textAlignVertical: TextAlignVertical.center,
                  cursorHeight: 22,
                  decoration: InputDecoration(
                    suffix: IconButton(
                      icon: const Icon(Icons.save, color: Colors.lightBlueAccent),
                      onPressed: () => cubit.setBaseUrl(controller.text, (){
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
                      }),
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