import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/constants/app_colors.dart';

class QuickActionsSection extends StatelessWidget {
  const QuickActionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Quick Actions',
            style: AppTextStyles.sectionTitle,
          ).animate().fadeIn(delay: 200.ms).slideX(begin: -0.3),

          const SizedBox(height: 15),

          Row(
            children: [
              Expanded(
                child: _buildActionCard(
                  icon: Iconsax.alarm,
                  title: 'Set Alarm',
                  subtitle: 'Abu wake-up calls',
                  color: AppColors.emeraldGreen,
                  delay: 300,
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: _buildActionCard(
                  icon: Iconsax.music,
                  title: 'Ringtones',
                  subtitle: 'Premium sounds',
                  color: AppColors.vibrantOrange,
                  delay: 400,
                ),
              ),
            ],
          ),

          const SizedBox(height: 15),

          Row(
            children: [
              Expanded(
                child: _buildActionCard(
                  icon: Iconsax.video_play,
                  title: 'Videos',
                  subtitle: 'Latest content',
                  color: AppColors.richRed,
                  delay: 500,
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: _buildActionCard(
                  icon: Iconsax.message,
                  title: 'Chat',
                  subtitle: 'Talk to Abu',
                  color: AppColors.royalPurple,
                  delay: 600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActionCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
    required int delay,
  }) {
    return Container(
      height: 120,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppColors.secondaryBlack, AppColors.charcoalGray],
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withOpacity(0.3), width: 1.5),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.1),
            blurRadius: 15,
            spreadRadius: 1,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(icon, color: color, size: 32)
                    .animate()
                    .scale(
                      begin: const Offset(0.5, 0.5),
                      delay: Duration(milliseconds: delay),
                    )
                    .then()
                    .shimmer(duration: 2000.ms, color: color.withOpacity(0.5)),

                const Spacer(),

                Text(
                  title,
                  style: AppTextStyles.cardTitle.copyWith(
                    color: AppColors.textWhite,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  subtitle,
                  style: AppTextStyles.cardSubtitle.copyWith(
                    fontSize: 11,
                    color: AppColors.textGray,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ).animate().fadeIn(delay: Duration(milliseconds: delay)).slideY(begin: 0.3);
  }
}
