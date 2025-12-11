import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/data/mock_data.dart';

class StatsSection extends StatelessWidget {
  const StatsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final stats = MockData.userStats;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Your Abu Journey',
            style: AppTextStyles.sectionTitle,
          ).animate().fadeIn(delay: 200.ms).slideX(begin: -0.3),

          const SizedBox(height: 15),

          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(25),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  AppColors.secondaryBlack,
                  AppColors.charcoalGray.withOpacity(0.8),
                ],
              ),
              borderRadius: BorderRadius.circular(25),
              border: Border.all(
                color: AppColors.primaryGold.withOpacity(0.3),
                width: 1.5,
              ),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primaryGold.withOpacity(0.1),
                  blurRadius: 20,
                  spreadRadius: 2,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Column(
              children: [
                // Level badge
                Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: AppColors.goldGradient,
                        ),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.primaryGold.withOpacity(0.4),
                            blurRadius: 15,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Iconsax.crown,
                            color: AppColors.primaryBlack,
                            size: 20,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            stats['level'],
                            style: AppTextStyles.cardTitle.copyWith(
                              color: AppColors.primaryBlack,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    )
                    .animate()
                    .scale(begin: const Offset(0.5, 0.5), delay: 400.ms)
                    .then()
                    .shimmer(duration: 2000.ms),

                const SizedBox(height: 25),

                // Stats grid
                Row(
                  children: [
                    Expanded(
                      child: _buildStatCard(
                        icon: Iconsax.clock,
                        value: stats['totalWatchTime'],
                        label: 'Watch Time',
                        delay: 500,
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: _buildStatCard(
                        icon: Iconsax.heart,
                        value: '${stats['favoriteVideos']}',
                        label: 'Favorites',
                        delay: 600,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 15),

                Row(
                  children: [
                    Expanded(
                      child: _buildStatCard(
                        icon: Iconsax.alarm,
                        value: '${stats['alarmsSet']}',
                        label: 'Alarms Set',
                        delay: 700,
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: _buildStatCard(
                        icon: Iconsax.flash_circle,
                        value: '${stats['streakDays']} days',
                        label: 'Daily Streak',
                        delay: 800,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ).animate().fadeIn(delay: 300.ms).slideY(begin: 0.3),
        ],
      ),
    );
  }

  Widget _buildStatCard({
    required IconData icon,
    required String value,
    required String label,
    required int delay,
  }) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: AppColors.primaryBlack.withOpacity(0.5),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: AppColors.primaryGold.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: AppColors.primaryGold, size: 20)
              .animate()
              .scale(
                begin: const Offset(0.5, 0.5),
                delay: Duration(milliseconds: delay),
              )
              .then()
              .shimmer(
                duration: 2000.ms,
                color: AppColors.primaryGold.withOpacity(0.5),
              ),

          const SizedBox(height: 5),

          Text(
            value,
            style: AppTextStyles.cardTitle.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: AppColors.textWhite,
            ),
          ),

          Text(
            label,
            style: AppTextStyles.cardSubtitle.copyWith(
              fontSize: 10,
              color: AppColors.textGray,
            ),
          ),
        ],
      ),
    ).animate().fadeIn(delay: Duration(milliseconds: delay)).slideY(begin: 0.2);
  }
}
