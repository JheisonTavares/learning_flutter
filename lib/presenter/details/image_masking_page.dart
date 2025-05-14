import 'dart:async';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class ImageMaskingPage extends StatefulWidget {
  const ImageMaskingPage({super.key});

  @override
  State<ImageMaskingPage> createState() => _ImageMaskingPageState();
}

class _ImageMaskingPageState extends State<ImageMaskingPage> {
  ui.Image? maskImage;
  ui.Image? fillImage;

  @override
  void initState() {
    super.initState();
    _loadImages();
  }

  Future<void> _loadImages() async {
    maskImage = await _loadUiImage('assets/images/veado.png');
    fillImage = await _loadUiImage('assets/images/flo.jpg');

    setState(() {});
  }

  Future<ui.Image> _loadUiImage(String path) async {
    final completer = Completer<ui.Image>();
    final imageProvider = AssetImage(path);
    final stream = imageProvider.resolve(ImageConfiguration());
    stream.addListener(
      ImageStreamListener((ImageInfo info, _) {
        completer.complete(info.image);
      }),
    );
    return completer.future;
  }

  @override
  Widget build(BuildContext context) {
    if (maskImage == null || fillImage == null) {
      return const Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      backgroundColor: const ui.Color.fromARGB(255, 152, 152, 152),
      body: Center(
        child: ShaderMask(
          shaderCallback: (Rect bounds) {
            return ImageShader(
              fillImage!,
              TileMode.clamp,
              TileMode.clamp,
              Matrix4.identity().storage,
            );
          },
          blendMode: BlendMode.srcIn,
          child: RawImage(
            image: maskImage,
            width: 300,
            height: 300,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
