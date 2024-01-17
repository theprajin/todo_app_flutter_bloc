import 'package:flutter/material.dart';

class DonePage extends StatelessWidget {
  const DonePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Done'),
        actions: const [
          Icon(Icons.search),
          SizedBox(
            width: 15,
          ),
          Icon(Icons.delete_forever_sharp),
          SizedBox(
            width: 15,
          ),
        ],
      ),
      body: const Center(child: Text('Done Page')),
    );
  }
}
