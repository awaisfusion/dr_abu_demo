import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:iconsax/iconsax.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../../../../core/theme/app_theme.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/data/mock_data.dart';

class FeaturedContentSection extends StatelessWidget {
  const FeaturedContentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final featuredVideos = MockData.featuredVideos.take(3).toList();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Featured Content',
                style: AppTextStyles.sectionTitle,
              ).animate().fadeIn(delay: 200.ms).slideX(begin: -0.3),

              TextButton.icon(
                onPressed: () {},
                icon: const Icon(
                  Iconsax.arrow_right_2,
                  color: AppColors.primaryGold,
                  size: 16,
                ),
                label: Text(
                  'See All',
                  style: AppTextStyles.cardSubtitle.copyWith(
                    color: AppColors.primaryGold,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ).animate().fadeIn(delay: 400.ms),
            ],
          ),

          const SizedBox(height: 15),

          SizedBox(
            height: 250,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: featuredVideos.length,
              itemBuilder: (context, index) {
                final video = featuredVideos[index];
                return _buildVideoCard(video, index);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVideoCard(DrAbuVideo video, int index) {
    return Container(
          width: 200,
          margin: EdgeInsets.only(right: 15, left: index == 0 ? 0 : 0),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [AppColors.secondaryBlack, AppColors.charcoalGray],
            ),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: AppColors.primaryGold.withOpacity(0.2),
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.primaryGold.withOpacity(0.1),
                blurRadius: 20,
                spreadRadius: 1,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(20),
              onTap: () {},
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Video thumbnail
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(20),
                        ),
                        child: CachedNetworkImage(
                          imageUrl: video.thumbnailUrl,
                          height: 120,
                          width: double.infinity,
                          fit: BoxFit.cover,
                          placeholder: (context, url) => Container(
                            height: 120,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  AppColors.charcoalGray,
                                  AppColors.softGray,
                                ],
                              ),
                            ),
                            child: const Icon(
                              Iconsax.video,
                              color: AppColors.textGray,
                              size: 40,
                            ),
                          ),
                          errorWidget: (context, url, error) => Container(
                            height: 120,
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                colors: AppColors.goldGradient,
                              ),
                            ),
                            child: const Icon(
                              Iconsax.video_play,
                              color: AppColors.primaryBlack,
                              size: 40,
                            ),
                          ),
                        ),
                      ),

                      // Play button overlay
                      Positioned.fill(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(20),
                            ),
                            gradient: LinearGradient(
                              begin: Alignment.center,
                              end: Alignment.center,
                              colors: [
                                Colors.transparent,
                                AppColors.primaryBlack.withOpacity(0.3),
                              ],
                            ),
                          ),
                          child: const Center(
                            child: Icon(
                              Iconsax.play_circle,
                              color: AppColors.primaryGold,
                              size: 50,
                            ),
                          ),
                        ),
                      ),

                      // Premium/Exclusive badge
                      if (video.isPremium || video.isExclusive)
                        Positioned(
                          top: 10,
                          right: 10,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: video.isExclusive
                                  ? AppColors.richRed
                                  : AppColors.primaryGold,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color:
                                      (video.isExclusive
                                              ? AppColors.richRed
                                              : AppColors.primaryGold)
                                          .withOpacity(0.4),
                                  blurRadius: 8,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Text(
                              video.isExclusive ? 'EXCLUSIVE' : 'PREMIUM',
                              style: AppTextStyles.cardSubtitle.copyWith(
                                fontSize: 9,
                                fontWeight: FontWeight.bold,
                                color: video.isExclusive
                                    ? AppColors.textWhite
                                    : AppColors.primaryBlack,
                              ),
                            ),
                          ),
                        ),

                      // Duration badge
                      Positioned(
                        bottom: 10,
                        right: 10,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 6,
                            vertical: 3,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.primaryBlack.withOpacity(0.8),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            '${video.duration.inMinutes}:${(video.duration.inSeconds % 60).toString().padLeft(2, '0')}',
                            style: AppTextStyles.cardSubtitle.copyWith(
                              fontSize: 10,
                              color: AppColors.textWhite,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  // Video details
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            video.title,
                            style: AppTextStyles.cardTitle.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),

                          const SizedBox(height: 8),

                          Text(
                            video.category.toUpperCase(),
                            style: AppTextStyles.cardSubtitle.copyWith(
                              fontSize: 10,
                              color: AppColors.primaryGold,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.5,
                            ),
                          ),

                          const Spacer(),

                          Row(
                            children: [
                              Icon(
                                Iconsax.eye,
                                size: 12,
                                color: AppColors.textGray,
                              ),
                              const SizedBox(width: 4),
                              Expanded(
                                child: Text(
                                  '${(video.views / 1000000).toStringAsFixed(1)}M views',
                                  style: AppTextStyles.cardSubtitle.copyWith(
                                    fontSize: 10,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 2),

                          Text(
                            timeago.format(video.uploadDate),
                            style: AppTextStyles.cardSubtitle.copyWith(
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
        .animate()
        .fadeIn(delay: Duration(milliseconds: 400 + (index * 100)))
        .slideX(begin: 0.3);
  }
}
