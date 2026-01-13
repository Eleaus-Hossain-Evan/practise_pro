import 'dart:math';

import 'package:flutter/material.dart';

import 'dbrand_skin.dart';

class DbrandSkinSelection extends StatefulWidget {
  const DbrandSkinSelection({super.key});

  @override
  State<DbrandSkinSelection> createState() => _DbrandSkinSelectionState();
}

class _DbrandSkinSelectionState extends State<DbrandSkinSelection>
    with SingleTickerProviderStateMixin {
  DbrandSkin current = skin.first;
  DbrandSkin past = skin.first;
  late AnimationController _controller;

  final alignList = [
    Alignment.center,
    Alignment.topLeft,
    Alignment.topCenter,
    Alignment.topRight,
    Alignment.centerLeft,
    Alignment.centerRight,
    Alignment.bottomLeft,
    Alignment.bottomCenter,
    Alignment.bottomRight,
  ];
  int randomAlignIndex = 0;

  void _onSkinSelected(DbrandSkin skin) {
    setState(() {
      current = skin;
    });
    _controller.forward(from: 0).whenComplete(() {
      setState(() {
        past = current;
        randomAlignIndex = Random().nextInt(alignList.length);
      });
    });
  }

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      upperBound: 2.5,
      duration: const Duration(milliseconds: 400),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.alphaBlend(
        Color(current.color).withOpacity(0.2),
        Colors.grey[600]!,
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        centerTitle: true,
        title: const Text('DBrand Skin Selection'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Positioned.fill(
                  child: Image.asset(past.image, fit: BoxFit.cover),
                ),
                Positioned.fill(
                  child: AnimatedBuilder(
                    animation: _controller,
                    builder: (context, child) {
                      return ClipPath(
                        clipper: _SkinClipper(
                          alignment: alignList[randomAlignIndex],
                          percent: _controller.value,
                        ),
                        child: Image.asset(current.image, fit: BoxFit.cover),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                const SizedBox(height: 20),
                Text(
                  current.name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  child: GridView.builder(
                    padding: const EdgeInsets.all(20),
                    itemCount: skin.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return _SkinButton(
                        skin: skin[index],
                        selected: skin[index].color == current.color,
                        onTap: _controller.isAnimating
                            ? null
                            : () {
                                _onSkinSelected(skin[index]);
                              },
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SkinButton extends StatelessWidget {
  const _SkinButton({
    required this.skin,
    required this.onTap,
    required this.selected,
  });
  final DbrandSkin skin;
  final VoidCallback? onTap;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.white,
              width: selected ? 8 : 1.0,
            )),
        child: DecoratedBox(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Color(skin.color),
          ),
        ),
      ),
    );
  }
}

class _SkinClipper extends CustomClipper<Path> {
  final double percent;
  final Alignment alignment;

  _SkinClipper({required this.percent, required this.alignment});

  @override
  Path getClip(Size size) {
    final path = Path();
    path.addOval(
      Rect.fromCenter(
        center: alignment.toOffset(size),
        width: size.width * percent,
        height: size.height * percent,
      ),
    );
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

extension on Alignment {
  Offset toOffset(Size size) {
    return switch (this) {
      Alignment.center => Offset(size.width / 2, size.height / 2),
      Alignment.topLeft => const Offset(0, 0),
      Alignment.topCenter => Offset(size.width / 2, 0),
      Alignment.topRight => Offset(size.width, 0),
      Alignment.centerLeft => Offset(0, size.height / 2),
      Alignment.centerRight => Offset(size.width, size.height / 2),
      Alignment.bottomLeft => Offset(0, size.height),
      Alignment.bottomCenter => Offset(size.width / 2, size.height),
      Alignment.bottomRight => Offset(size.width, size.height),
      _ => Offset(size.width / 2, size.height / 2),
    };
  }
}
