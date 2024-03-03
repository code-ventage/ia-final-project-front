import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ia_final_project_front/go_router/routes.dart';

class ConfigurationsPage extends StatelessWidget {
  const ConfigurationsPage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Configurations Page'),
      ),
      body: Column(
        children: [
          ListTile(
            title: const Text('Base Url'),
            subtitle: const Text('Configure base url'),
            trailing: const Icon( Icons.route_outlined ),
            onTap: () {
              context.pushNamed(Routes.baseUrl.name);
            },
          )
        ],
      ),
    );
  }
}
