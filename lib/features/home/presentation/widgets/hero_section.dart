import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/data/mock_data.dart';
import '../../../../core/widgets/app_icon.dart';

class HeroSection extends StatefulWidget {
  const HeroSection({super.key});

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.primaryBlack,
            AppColors.secondaryBlack,
            AppColors.charcoalGray,
          ],
        ),
        borderRadius: BorderRadius.circular(25),
        border: Border.all(
          color: AppColors.primaryGold.withOpacity(0.3),
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryGold.withOpacity(0.2),
            blurRadius: 30,
            spreadRadius: 2,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Stack(
        children: [
          // Background pattern
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(23),
              child: Container(
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    center: Alignment.topRight,
                    radius: 1.2,
                    colors: [
                      AppColors.primaryGold.withOpacity(0.1),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),
          ),

          // Main content
          Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Welcome text
                Row(
                  children: [
                    Icon(Icons.wb_sunny, color: AppColors.primaryGold, size: 28)
                        .animate()
                        .scale(begin: const Offset(0, 0), delay: 500.ms)
                        .rotate(begin: 0, end: 1, delay: 500.ms),
                    const SizedBox(width: 10),
                    Text(
                      'Welcome to',
                      style: AppTextStyles.sectionTitle.copyWith(fontSize: 16),
                    ).animate().fadeIn(delay: 300.ms).slideX(begin: -0.3),
                  ],
                ),
                const SizedBox(height: 10),

                // Dr Abu name with animation
                Shimmer.fromColors(
                  baseColor: AppColors.primaryGold,
                  highlightColor: AppColors.textWhite,
                  period: const Duration(seconds: 3),
                  child: Text(
                    'DR ABU\'S WORLD',
                    style: AppTextStyles.characterName.copyWith(
                      fontSize: 36,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ).animate().fadeIn(delay: 600.ms).slideY(begin: 0.3),

                const SizedBox(height: 15),

                // Daily quote with typewriter effect
                SizedBox(
                  height: 60,
                  child: AnimatedTextKit(
                    animatedTexts: MockData.dailyQuotes
                        .map(
                          (quote) => TypewriterAnimatedText(
                            quote,
                            textStyle: AppTextStyles.cardSubtitle.copyWith(
                              fontSize: 14,
                              height: 1.4,
                              color: AppColors.textGray,
                            ),
                            speed: const Duration(milliseconds: 50),
                          ),
                        )
                        .toList(),
                    totalRepeatCount: 1,
                    displayFullTextOnTap: true,
                  ),
                ),

                const SizedBox(height: 20),

                // Stats row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildStatItem('2.7M+', 'Followers'),
                    _buildDivider(),
                    _buildStatItem('1.5B+', 'Views'),
                    _buildDivider(),
                    _buildStatItem('Global', 'Fanbase'),
                  ],
                ),
              ],
            ),
          ),

          // Floating elements
          Positioned(
            top: 20,
            right: 20,
            child:
                Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.richRed,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.richRed.withOpacity(0.4),
                            blurRadius: 10,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Text(
                        '🔥 TRENDING',
                        style: AppTextStyles.cardSubtitle.copyWith(
                          color: AppColors.textWhite,
                          fontWeight: FontWeight.bold,
                          fontSize: 11,
                        ),
                      ),
                    )
                    .animate()
                    .scale(begin: const Offset(0, 0), delay: 1000.ms)
                    .then()
                    .shimmer(duration: 2000.ms),
          ),
        ],
      ),
    ).animate().fadeIn(duration: 800.ms).scale(begin: const Offset(0.8, 0.8));
  }

  Widget _buildStatItem(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: AppTextStyles.cardTitle.copyWith(
            color: AppColors.primaryGold,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ).animate().fadeIn(delay: 800.ms).scale(begin: const Offset(0.5, 0.5)),
        const SizedBox(height: 4),
        Text(
          label,
          style: AppTextStyles.cardSubtitle.copyWith(fontSize: 12),
        ).animate().fadeIn(delay: 900.ms),
      ],
    );
  }

  Widget _buildDivider() {
    return Container(
      height: 30,
      width: 1,
      color: AppColors.primaryGold.withOpacity(0.3),
    ).animate().scaleY(begin: 0, delay: 1000.ms);
  }
}
