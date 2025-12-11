import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:iconsax/iconsax.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../../../../core/theme/app_theme.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/data/mock_data.dart';

class VideoFeedScreen extends StatefulWidget {
  const VideoFeedScreen({super.key});

  @override
  State<VideoFeedScreen> createState() => _VideoFeedScreenState();
}

class _VideoFeedScreenState extends State<VideoFeedScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  String selectedCategory = 'All';

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: MockData.categories.length,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBlack,
      body: SafeArea(
        child: Column(
          children: [
            // Custom App Bar
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppColors.primaryBlack,
                    AppColors.primaryBlack.withOpacity(0.9),
                  ],
                ),
              ),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(
                      Iconsax.arrow_left_2,
                      color: AppColors.primaryGold,
                    ),
                    onPressed: () => Navigator.of(context).pop(),
                  ).animate().slideX(begin: -0.3, delay: 200.ms).fadeIn(),

                  const SizedBox(width: 10),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'ABU VIDEO VAULT',
                          style: AppTextStyles.heroTitle.copyWith(fontSize: 18),
                        ).animate().fadeIn(delay: 400.ms).slideX(begin: 0.3),

                        Text(
                          'Exclusive content & behind-scenes',
                          style: AppTextStyles.cardSubtitle.copyWith(
                            fontSize: 12,
                          ),
                        ).animate().fadeIn(delay: 600.ms),
                      ],
                    ),
                  ),

                  IconButton(
                    icon: const Icon(
                      Iconsax.search_normal_1,
                      color: AppColors.primaryGold,
                    ),
                    onPressed: () {},
                  ).animate().slideX(begin: 0.3, delay: 300.ms).fadeIn(),

                  IconButton(
                    icon: const Icon(
                      Iconsax.filter,
                      color: AppColors.primaryGold,
                    ),
                    onPressed: () {},
                  ).animate().slideX(begin: 0.3, delay: 400.ms).fadeIn(),
                ],
              ),
            ),

            // Category Tabs
            Container(
              height: 60,
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: TabBar(
                controller: _tabController,
                isScrollable: true,
                indicatorColor: AppColors.primaryGold,
                indicatorWeight: 3,
                labelColor: AppColors.primaryGold,
                unselectedLabelColor: AppColors.textGray,
                labelStyle: AppTextStyles.cardTitle.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
                unselectedLabelStyle: AppTextStyles.cardSubtitle.copyWith(
                  fontSize: 14,
                ),
                tabs: MockData.categories.map((category) {
                  return Tab(text: category.toUpperCase());
                }).toList(),
                onTap: (index) {
                  setState(() {
                    selectedCategory = MockData.categories[index];
                  });
                },
              ),
            ).animate().fadeIn(delay: 600.ms).slideY(begin: -0.3),

            // Video Grid
            Expanded(
              child: AnimationLimiter(
                child: GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.all(20),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    childAspectRatio: 1.1,
                    mainAxisSpacing: 20,
                  ),
                  itemCount: MockData.featuredVideos.length,
                  itemBuilder: (context, index) {
                    return AnimationConfiguration.staggeredGrid(
                      position: index,
                      duration: const Duration(milliseconds: 600),
                      columnCount: 1,
                      child: SlideAnimation(
                        verticalOffset: 50.0,
                        child: FadeInAnimation(
                          child: _buildVideoCard(
                            MockData.featuredVideos[index],
                            index,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVideoCard(DrAbuVideo video, int index) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppColors.secondaryBlack, AppColors.charcoalGray],
        ),
        borderRadius: BorderRadius.circular(25),
        border: Border.all(
          color: AppColors.primaryGold.withOpacity(0.2),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryGold.withOpacity(0.1),
            blurRadius: 25,
            spreadRadius: 2,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(25),
          onTap: () {
            // Show video player modal or navigate to video player
            _showVideoPlayerModal(video);
          },
          child: Column(
            children: [
              // Video thumbnail with play overlay
              Expanded(
                flex: 3,
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(25),
                      ),
                      child: CachedNetworkImage(
                        imageUrl: video.thumbnailUrl,
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                        placeholder: (context, url) => Container(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: AppColors.goldGradient,
                            ),
                          ),
                          child: const Center(
                            child: Icon(
                              Iconsax.video,
                              color: AppColors.primaryBlack,
                              size: 60,
                            ),
                          ),
                        ),
                        errorWidget: (context, url, error) => Container(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: AppColors.goldGradient,
                            ),
                          ),
                          child: const Center(
                            child: Icon(
                              Iconsax.video_play,
                              color: AppColors.primaryBlack,
                              size: 60,
                            ),
                          ),
                        ),
                      ),
                    ),

                    // Gradient overlay
                    Positioned.fill(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(25),
                          ),
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              AppColors.primaryBlack.withOpacity(0.4),
                              AppColors.primaryBlack.withOpacity(0.7),
                            ],
                          ),
                        ),
                      ),
                    ),

                    // Play button
                    Positioned.fill(
                      child: Center(
                        child:
                            Container(
                                  padding: const EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                    color: AppColors.primaryGold,
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                        color: AppColors.primaryGold
                                            .withOpacity(0.4),
                                        blurRadius: 20,
                                        offset: const Offset(0, 5),
                                      ),
                                    ],
                                  ),
                                  child: const Icon(
                                    Iconsax.play,
                                    color: AppColors.primaryBlack,
                                    size: 30,
                                  ),
                                )
                                .animate(
                                  onPlay: (controller) =>
                                      controller.repeat(reverse: true),
                                )
                                .scale(
                                  begin: const Offset(1.0, 1.0),
                                  end: const Offset(1.1, 1.1),
                                )
                                .then()
                                .scale(
                                  begin: const Offset(1.1, 1.1),
                                  end: const Offset(1.0, 1.0),
                                ),
                      ),
                    ),

                    // Premium/Exclusive badge
                    if (video.isPremium || video.isExclusive)
                      Positioned(
                        top: 15,
                        right: 15,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: video.isExclusive
                                ? AppColors.richRed
                                : AppColors.primaryGold,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color:
                                    (video.isExclusive
                                            ? AppColors.richRed
                                            : AppColors.primaryGold)
                                        .withOpacity(0.5),
                                blurRadius: 10,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Text(
                            video.isExclusive ? 'EXCLUSIVE' : 'PREMIUM',
                            style: AppTextStyles.cardSubtitle.copyWith(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: video.isExclusive
                                  ? AppColors.textWhite
                                  : AppColors.primaryBlack,
                            ),
                          ),
                        ),
                      ),

                    // Duration
                    Positioned(
                      bottom: 15,
                      right: 15,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.primaryBlack.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          '${video.duration.inMinutes}:${(video.duration.inSeconds % 60).toString().padLeft(2, '0')}',
                          style: AppTextStyles.cardSubtitle.copyWith(
                            fontSize: 12,
                            color: AppColors.textWhite,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Video details
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        video.title,
                        style: AppTextStyles.cardTitle.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),

                      const SizedBox(height: 8),

                      Text(
                        video.description,
                        style: AppTextStyles.cardSubtitle.copyWith(
                          fontSize: 12,
                          height: 1.4,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),

                      const Spacer(),

                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 3,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.primaryGold.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              video.category.toUpperCase(),
                              style: AppTextStyles.cardSubtitle.copyWith(
                                fontSize: 10,
                                color: AppColors.primaryGold,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),

                          const Spacer(),

                          Icon(
                            Iconsax.eye,
                            size: 14,
                            color: AppColors.textGray,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '${(video.views / 1000000).toStringAsFixed(1)}M',
                            style: AppTextStyles.cardSubtitle.copyWith(
                              fontSize: 11,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 4),

                      Text(
                        timeago.format(video.uploadDate),
                        style: AppTextStyles.cardSubtitle.copyWith(
                          fontSize: 11,
                          color: AppColors.textLightGray,
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
    );
  }

  void _showVideoPlayerModal(DrAbuVideo video) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.9,
        decoration: const BoxDecoration(
          color: AppColors.primaryBlack,
          borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
        ),
        child: Column(
          children: [
            // Handle
            Container(
              margin: const EdgeInsets.only(top: 10, bottom: 20),
              width: 50,
              height: 5,
              decoration: BoxDecoration(
                color: AppColors.primaryGold,
                borderRadius: BorderRadius.circular(3),
              ),
            ),

            // Video placeholder (would be actual video player in real app)
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppColors.secondaryBlack,
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: NetworkImage(video.thumbnailUrl),
                    fit: BoxFit.cover,
                  ),
                ),
                child: const Center(
                  child: Icon(
                    Iconsax.play_circle,
                    color: AppColors.primaryGold,
                    size: 80,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
