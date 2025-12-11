import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class DrAbuAppIcon extends StatelessWidget {
  final double size;
  final bool showShadow;

  const DrAbuAppIcon({super.key, this.size = 80, this.showShadow = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          size * 0.225,
        ), // iOS app icon radius
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.primaryGold,
            AppColors.deepGold,
            AppColors.richRed,
          ],
          stops: [0.0, 0.6, 1.0],
        ),
        boxShadow: showShadow
            ? [
                BoxShadow(
                  color: AppColors.primaryGold.withOpacity(0.4),
                  blurRadius: size * 0.15,
                  offset: Offset(0, size * 0.05),
                  spreadRadius: size * 0.025,
                ),
                BoxShadow(
                  color: AppColors.richRed.withOpacity(0.3),
                  blurRadius: size * 0.25,
                  offset: Offset(0, size * 0.1),
                ),
              ]
            : null,
      ),
      child: Stack(
        children: [
          // Background pattern
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(size * 0.225),
              child: Container(
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    center: const Alignment(0.3, -0.3),
                    radius: 0.8,
                    colors: [
                      AppColors.textWhite.withOpacity(0.2),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),
          ),

          // Main content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Crown icon representing Dr Abu's status
                Icon(
                  Icons.auto_awesome,
                  size: size * 0.3,
                  color: AppColors.primaryBlack,
                ),

                SizedBox(height: size * 0.05),

                // "DR ABU" text
                Text(
                  'DR\nABU',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: size * 0.18,
                    fontWeight: FontWeight.w900,
                    color: AppColors.primaryBlack,
                    height: 0.9,
                    letterSpacing: size * 0.01,
                    shadows: [
                      Shadow(
                        color: AppColors.textWhite.withOpacity(0.3),
                        offset: const Offset(0, 1),
                        blurRadius: 2,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Accent elements
          Positioned(
            top: size * 0.15,
            right: size * 0.15,
            child: Container(
              width: size * 0.1,
              height: size * 0.1,
              decoration: BoxDecoration(
                color: AppColors.primaryBlack.withOpacity(0.3),
                shape: BoxShape.circle,
              ),
            ),
          ),

          Positioned(
            bottom: size * 0.2,
            left: size * 0.2,
            child: Container(
              width: size * 0.08,
              height: size * 0.08,
              decoration: BoxDecoration(
                color: AppColors.textWhite.withOpacity(0.4),
                shape: BoxShape.circle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DrAbuIconGenerator {
  static Widget generateIcon({required double size, bool forAppIcon = false}) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(forAppIcon ? size * 0.225 : 0),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFFFFD700), // Primary Gold
            Color(0xFFB8860B), // Deep Gold
            Color(0xFFDC143C), // Rich Red
          ],
          stops: [0.0, 0.6, 1.0],
        ),
      ),
      child: Stack(
        children: [
          // Shine effect
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(
                forAppIcon ? size * 0.225 : 0,
              ),
              child: Container(
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    center: const Alignment(-0.4, -0.4),
                    radius: 1.2,
                    colors: [
                      Colors.white.withOpacity(0.3),
                      Colors.white.withOpacity(0.1),
                      Colors.transparent,
                    ],
                    stops: const [0.0, 0.4, 1.0],
                  ),
                ),
              ),
            ),
          ),

          // Main content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Crown/Star representing global status
                Icon(
                  Icons.auto_awesome,
                  size: size * 0.25,
                  color: const Color(0xFF0A0A0A),
                ),

                SizedBox(height: size * 0.02),

                // "ABU" text
                Text(
                  'ABU',
                  style: TextStyle(
                    fontSize: size * 0.16,
                    fontWeight: FontWeight.w900,
                    color: const Color(0xFF0A0A0A),
                    letterSpacing: size * 0.008,
                    shadows: [
                      Shadow(
                        color: Colors.white.withOpacity(0.4),
                        offset: const Offset(0, 1),
                        blurRadius: 2,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
