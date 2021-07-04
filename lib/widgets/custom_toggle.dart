import 'package:flutter/material.dart';

class CustomToggle extends StatelessWidget {
  final bool isActive;
  final Function onTap;

  const CustomToggle({
    Key key,
    this.isActive,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        child: Stack(
          children: [
            Container(height: 24),
            Align(
              alignment: Alignment.center,
              child: RepaintBoundary(
                child: Container(
                  width: 40,
                  height: 14,
                  decoration: BoxDecoration(
                      color: !isActive ? Colors.grey[600] : Color(0xFFCF9C95),
                      borderRadius: BorderRadius.circular(20)),
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  margin: EdgeInsets.only(top: 5),
                ),
              ),
            ),
            Positioned(
              left: !isActive ? 0 : null,
              right: isActive ? 0 : null,
              child: Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: !isActive ? Colors.grey[800] : Color(0xFFD16758),
                  shape: BoxShape.circle,
                ),
                padding: EdgeInsets.only(left: 32),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
