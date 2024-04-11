import 'package:flutter/material.dart';

class ImageSlider extends StatelessWidget {
  final Function(int) onChange;
  final int currentImage;
  final List<String> imageUrls;
  const ImageSlider({
    Key? key,
    required this.onChange,
    required this.currentImage,
    required this.imageUrls,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: PageView.builder(
        itemCount: imageUrls.length,
        onPageChanged: onChange,
        itemBuilder: (context, index) {
          return Image.network(imageUrls[index],fit: BoxFit.fitHeight,);
        },
      ),
    );
  }
}
