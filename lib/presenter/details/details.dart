import 'package:flutter/material.dart';
import 'package:studies/presenter/details/image_carousel2.dart';
import 'package:studies/presenter/details/image_caurosel.dart';

class Details extends StatelessWidget {
  static const String routeName = '/details';

  const Details({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(153, 189, 188, 245),
      appBar: AppBar(
        elevation: 5,
        backgroundColor: const Color.fromARGB(255, 52, 77, 98),
        title: const Text('Detalhes'),
      ),
      body: Center(
        child: Column(children: [ImageCarousel(), ImageCarousel2()]),
      ),
    );
  }
}
