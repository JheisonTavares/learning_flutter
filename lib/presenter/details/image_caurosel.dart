import 'dart:math';

import 'package:flutter/material.dart';

class ImageCarousel extends StatefulWidget {
  const ImageCarousel({super.key});

  @override
  State<ImageCarousel> createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  final PageController _controller = PageController(viewportFraction: 0.4);
  double _currentPage = 0.0;

  final List<String> _images = [
    'https://picsum.photos/id/236/300/300',
    'https://picsum.photos/id/238/300/300',
    'https://picsum.photos/id/239/300/300',
    'https://picsum.photos/id/240/300/300',
    'https://picsum.photos/id/241/300/300',
  ];

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        _currentPage = _controller.page!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5, // Pode ajustar a elevação conforme necessário
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15), // Bordas arredondadas
      ),
      margin: const EdgeInsets.all(15), // Margem externa do card
      color: const Color.fromARGB(149, 56, 72, 189), // Cor do fundo do card
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: 350,
          child: PageView.builder(
            controller: _controller,
            scrollDirection: Axis.horizontal,
            itemCount: _images.length,
            itemBuilder: (context, index) {
              final scale = max(1 - (_currentPage - index).abs(), 0.8);
              return Transform.scale(
                scale: scale,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(_images[index], fit: BoxFit.cover),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
