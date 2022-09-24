

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_practice/provider/example_one_provider.dart';

class ExampleOneScreen extends StatefulWidget {
  ExampleOneScreen({Key? key}) : super(key: key);

  @override
  State<ExampleOneScreen> createState() => _ExampleOneScreenState();
}

class _ExampleOneScreenState extends State<ExampleOneScreen> {
  @override
  Widget build(BuildContext context) {
    debugPrint('Build');
    final provider1=Provider.of<ExampleOneProvider>(context,listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Subscriber'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<ExampleOneProvider>(builder: (context, provider, child) {
            return Slider(
              min: 0,
              max: 1,
              value: provider.value, onChanged: (val) {
              provider.setValue(val);
            },);
          },),
         
          Consumer<ExampleOneProvider>(builder: (context, provider, child) {
            return Row(
              children: [
                Expanded(
                  child: Container(
                    height: 100,
                    color: Colors.green.withOpacity(provider.value),
                    child: const Center(child: Text('Container 1')),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 100,
                    color: Colors.red.withOpacity(provider.value),
                    child: const Center(child: Text('Container 1')),
                  ),
                ),
              ],
            );
          },)
        ],
      ),
    );
  }
}
