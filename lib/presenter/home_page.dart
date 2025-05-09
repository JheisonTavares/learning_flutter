import 'package:flutter/material.dart';
import 'package:studies/presenter/details/details.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        backgroundColor: const Color.fromARGB(255, 38, 51, 61),
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Details()),
                );
              },
              style: ButtonStyle(
                fixedSize: WidgetStateProperty.all(Size(200, 40)),
                backgroundColor: WidgetStateProperty.all(Colors.black54),
              ),
              child: const Icon(Icons.forward),
            ),
          ],
        ),
      ),
    );
  }
}
