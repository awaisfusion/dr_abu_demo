import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/constants/app_colors.dart';
import '../widgets/hero_section.dart';
import '../widgets/featured_content_section.dart';
import '../widgets/quick_actions_section.dart';
import '../widgets/stats_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late AnimationController _heroController;
  late AnimationController _contentController;

  @override
  void initState() {
    super.initState();
    _heroController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );
    _contentController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    // Start animations
    _heroController.forward();
    Future.delayed(const Duration(milliseconds: 800), () {
      _contentController.forward();
    });
  }

  @override
  void dispose() {
    _heroController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBlack,
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            // Custom App Bar with Dr Abu branding
            SliverAppBar(
              expandedHeight: 80,
              floating: false,
              pinned: true,
              backgroundColor: AppColors.primaryBlack.withOpacity(0.9),
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: AnimatedBuilder(
                  animation: _heroController,
                  builder: (context, child) {
                    return Transform.scale(
                      scale: 0.7 + (_heroController.value * 0.3),
                      child:
                          Text(
                            'DR ABU',
                            style: AppTextStyles.heroTitle.copyWith(
                              fontSize: 20,
                            ),
                          ).animate().shimmer(
                            duration: 2000.ms,
                            color: AppColors.primaryGold.withOpacity(0.5),
                          ),
                    );
                  },
                ),
              ),
              actions: [
                IconButton(
                      icon: const Icon(
                        Iconsax.notification,
                        color: AppColors.primaryGold,
                      ),
                      onPressed: () {},
                    )
                    .animate()
                    .slideX(begin: 1, duration: 800.ms, delay: 1200.ms)
                    .fadeIn(),
                IconButton(
                      icon: const Icon(
                        Iconsax.profile_circle,
                        color: AppColors.primaryGold,
                      ),
                      onPressed: () {},
                    )
                    .animate()
                    .slideX(begin: 1, duration: 800.ms, delay: 1400.ms)
                    .fadeIn(),
              ],
            ),

            // Hero Section
            SliverToBoxAdapter(
              child: AnimationLimiter(
                child: Column(
                  children: AnimationConfiguration.toStaggeredList(
                    duration: const Duration(milliseconds: 600),
                    childAnimationBuilder: (widget) => SlideAnimation(
                      horizontalOffset: 50.0,
                      child: FadeInAnimation(child: widget),
                    ),
                    children: [
                      const HeroSection(),
                      const SizedBox(height: 30),
                      const QuickActionsSection(),
                      const SizedBox(height: 30),
                      const FeaturedContentSection(),
                      const SizedBox(height: 30),
                      const StatsSection(),
                      const SizedBox(height: 100),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),

      // Floating Action Button for Video Feed
      floatingActionButton:
          Container(
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: AppColors.goldGradient,
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primaryGold.withOpacity(0.4),
                      blurRadius: 20,
                      spreadRadius: 2,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: FloatingActionButton.extended(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  onPressed: () => context.push('/video-feed'),
                  label: Text(
                    'WATCH NOW',
                    style: AppTextStyles.buttonText.copyWith(
                      color: AppColors.primaryBlack,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  icon: const Icon(
                    Iconsax.play_circle,
                    color: AppColors.primaryBlack,
                    size: 24,
                  ),
                ),
              )
              .animate()
              .scale(
                begin: const Offset(0.5, 0.5),
                duration: 1000.ms,
                delay: 2000.ms,
              )
              .fadeIn(delay: 2000.ms),
    );
  }
}
