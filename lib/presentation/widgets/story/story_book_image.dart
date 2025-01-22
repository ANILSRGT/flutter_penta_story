import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:penta_story/core/configs/constants/app_icons.dart';
import 'package:penta_story/core/configs/constants/app_vectors.dart';
import 'package:penta_story/core/utils/image_string_converter.dart';

class StoryBookImage extends StatelessWidget {
  const StoryBookImage({
    required this.image,
    super.key,
  });

  final String image;

  static Widget opened({
    required String image,
  }) =>
      _StoryBookOpenedImage(
        image: image,
      );

  @override
  Widget build(BuildContext context) {
    const ratioX = 120;
    const ratioY = 150;
    return AspectRatio(
      aspectRatio: ratioX / ratioY,
      child: LayoutBuilder(
        builder: (_, cst) {
          final xScalePercent = cst.maxWidth * 100 / ratioX / 100;
          final yScalePercent = cst.maxHeight * 100 / ratioY / 100;
          final fullScalePercent =
              xScalePercent < yScalePercent ? xScalePercent : yScalePercent;
          return Stack(
            fit: StackFit.expand,
            children: [
              Card(
                color: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(fullScalePercent * 12),
                ),
              ),
              Positioned(
                left: 5,
                top: 0,
                right: 0,
                bottom: 5,
                child: Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(fullScalePercent * 12),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft + const Alignment(0.25, 0.05),
                child: Transform.scale(
                  scaleX: xScalePercent,
                  scaleY: yScalePercent,
                  child: Icon(
                    AppIcons.bookmark,
                    color: Colors.red[700],
                  ),
                ),
              ),
              Positioned(
                left: 0,
                top: 0,
                right: 0,
                bottom: 10,
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(fullScalePercent * 12),
                  ),
                  child: DecoratedBox(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.black,
                          Colors.black12,
                        ],
                      ),
                    ),
                    child: ImageStringConverter.imageProviderBuilder(
                      image: image,
                      onError: SvgPicture.asset(AppVectors.images),
                      builder: (p0) {
                        return Image(
                          image: p0,
                          errorBuilder: (context, error, stackTrace) {
                            return const SizedBox();
                          },
                          fit: BoxFit.cover,
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _StoryBookOpenedImage extends StatelessWidget {
  const _StoryBookOpenedImage({
    required this.image,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, cst) {
        return AspectRatio(
          aspectRatio: 240 / 150,
          child: Stack(
            fit: StackFit.expand,
            clipBehavior: Clip.none,
            children: [
              Positioned(
                left: -6,
                top: 0,
                right: -6,
                bottom: -10,
                child: ClipPath(
                  clipper: _StoryBookOpenedClipper(),
                  child: const ColoredBox(color: Colors.black),
                ),
              ),
              Positioned(
                left: -3,
                top: 0,
                right: -3,
                bottom: -8,
                child: ClipPath(
                  clipper: _StoryBookOpenedClipper(),
                  child: const ColoredBox(color: Colors.white),
                ),
              ),
              Positioned(
                left: 15,
                bottom: -12,
                child: Icon(
                  AppIcons.bookmark,
                  color: Colors.red[700],
                ),
              ),
              ClipPath(
                clipper: _StoryBookOpenedClipper(),
                child: ImageStringConverter.imageProviderBuilder(
                  image: image,
                  onError: SvgPicture.asset(AppVectors.images),
                  builder: (p0) {
                    return Image(
                      image: p0,
                      errorBuilder: (context, error, stackTrace) {
                        return const SizedBox();
                      },
                      fit: BoxFit.cover,
                    );
                  },
                ),
              ),
              Positioned.fill(
                bottom: -10,
                child: ClipPath(
                  clipper: _StoryBookOpenedClipper(),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.transparent,
                          Colors.white12,
                          Colors.black.withValues(alpha: 0.7),
                          Colors.white12,
                          Colors.transparent,
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _StoryBookOpenedClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final width = size.width;
    final height = size.height;

    final path = Path()
      ..moveTo(0, height * .1)
      ..cubicTo(
        0,
        0,
        width * .25,
        -10,
        width * .5,
        height * .05,
      )
      ..cubicTo(
        width * .75,
        -10,
        width,
        0,
        width,
        height * .1,
      )
      ..lineTo(width, height)
      ..cubicTo(
        width,
        height,
        width * .75,
        height - height * .05 - 10,
        width * .5,
        height,
      )
      ..cubicTo(
        width * .25,
        height - height * .05 - 10,
        0,
        height,
        0,
        height,
      )
      ..close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
