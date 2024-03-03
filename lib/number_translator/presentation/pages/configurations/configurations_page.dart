import 'package:flutter/material.dart';

class ConfigurationsPage extends StatelessWidget {
  const ConfigurationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(left: 10.0),
          child: Text('Configurations', style: TextStyle(fontSize: 20)),
        ),
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
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  decoration: InputDecoration(
                    suffix: IconButton(
                      icon: const Icon(Icons.save),
                      onPressed: () {},
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
              )
            ],
          )
        ],
      ),
    );
  }
}
