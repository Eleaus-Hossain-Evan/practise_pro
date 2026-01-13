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

  void _onSkinSelected(DbrandSkin skin) {
    setState(() {
      current = skin;
    });
    _controller.forward(from: 0).whenComplete(() {
      setState(() {
        past = current;
      });
    });
  }

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
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
                        clipper: _SkinClipper(_controller.value),
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
                        onTap: () {
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
    super.key,
    required this.skin,
    required this.onTap,
    required this.selected,
  });
  final DbrandSkin skin;
  final VoidCallback onTap;
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
  _SkinClipper(this.percent);

  @override
  Path getClip(Size size) {
    final path = Path();
    path.addOval(
      Rect.fromCenter(
        center: Offset(size.width / 2, size.height / 2),
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
