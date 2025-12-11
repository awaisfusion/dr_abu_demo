class DrAbuVideo {
  final String id;
  final String title;
  final String description;
  final String thumbnailUrl;
  final String videoUrl;
  final String youtubeVideoId;
  final String category;
  final Duration duration;
  final int views;
  final DateTime uploadDate;
  final bool isPremium;
  final bool isExclusive;
  final List<String> tags;

  DrAbuVideo({
    required this.id,
    required this.title,
    required this.description,
    required this.thumbnailUrl,
    required this.videoUrl,
    required this.youtubeVideoId,
    required this.category,
    required this.duration,
    required this.views,
    required this.uploadDate,
    this.isPremium = false,
    this.isExclusive = false,
    this.tags = const [],
  });
}

class DrAbuAlarm {
  final String id;
  final String name;
  final String description;
  final String audioUrl;
  final Duration duration;
  final String category;
  final bool isPremium;
  final String thumbnailUrl;

  DrAbuAlarm({
    required this.id,
    required this.name,
    required this.description,
    required this.audioUrl,
    required this.duration,
    required this.category,
    this.isPremium = false,
    required this.thumbnailUrl,
  });
}

class MockData {
  static List<DrAbuVideo> get featuredVideos => [
    DrAbuVideo(
      id: 'video_1',
      title: 'Dr Abu\'s Morning Motivation',
      description:
          'Start your day with Dr Abu\'s infectious energy and wisdom!',
      thumbnailUrl: 'https://img.youtube.com/vi/y-ezpJOFMKU/maxresdefault.jpg',
      videoUrl: 'https://youtube.com/shorts/y-ezpJOFMKU?si=F9x7E6ZA-84J4sTM',
      youtubeVideoId: 'y-ezpJOFMKU',
      category: 'Motivation',
      duration: const Duration(minutes: 3, seconds: 45),
      views: 2500000,
      uploadDate: DateTime.now().subtract(const Duration(days: 2)),
      isExclusive: true,
      tags: ['motivation', 'morning', 'energy'],
    ),
    DrAbuVideo(
      id: 'video_2',
      title: 'Abu\'s Comedy Special',
      description: 'Laugh out loud with Dr Abu\'s latest comedy sketches!',
      thumbnailUrl: 'https://img.youtube.com/vi/9t7an2an_GE/maxresdefault.jpg',
      videoUrl: 'https://youtube.com/shorts/9t7an2an_GE?si=efaYrsN2ZEgC32Tl',
      youtubeVideoId: '9t7an2an_GE',
      category: 'Comedy',
      duration: const Duration(minutes: 5, seconds: 20),
      views: 1800000,
      uploadDate: DateTime.now().subtract(const Duration(days: 5)),
      tags: ['comedy', 'entertainment', 'funny'],
    ),
    DrAbuVideo(
      id: 'video_3',
      title: 'Behind the Scenes: UK Tour',
      description:
          'Exclusive behind-the-scenes footage from Dr Abu\'s UK tour!',
      thumbnailUrl: 'https://img.youtube.com/vi/gKY6ZDeNjGM/maxresdefault.jpg',
      videoUrl: 'https://youtube.com/shorts/gKY6ZDeNjGM?si=UMbex9l5yCnkaT9n',
      youtubeVideoId: 'gKY6ZDeNjGM',
      category: 'Tour',
      duration: const Duration(minutes: 8, seconds: 15),
      views: 950000,
      uploadDate: DateTime.now().subtract(const Duration(days: 1)),
      isPremium: true,
      isExclusive: true,
      tags: ['tour', 'behind-scenes', 'exclusive'],
    ),
    DrAbuVideo(
      id: 'video_4',
      title: 'Dr Abu\'s Life Lessons',
      description: 'Wisdom and life advice from the one and only Dr Abu',
      thumbnailUrl: 'https://img.youtube.com/vi/VaZdUkGVqAA/maxresdefault.jpg',
      videoUrl: 'https://youtube.com/shorts/VaZdUkGVqAA?si=HN1abdxUDDFhhUWE',
      youtubeVideoId: 'VaZdUkGVqAA',
      category: 'Wisdom',
      duration: const Duration(minutes: 6, seconds: 30),
      views: 3200000,
      uploadDate: DateTime.now().subtract(const Duration(days: 7)),
      tags: ['wisdom', 'advice', 'inspiration'],
    ),
    DrAbuVideo(
      id: 'video_5',
      title: 'African Culture Celebration',
      description:
          'Dr Abu celebrates the beauty of African culture and heritage',
      thumbnailUrl: 'https://img.youtube.com/vi/VGmJ8UzJvpQ/maxresdefault.jpg',
      videoUrl: 'https://youtube.com/shorts/VGmJ8UzJvpQ?si=K2A77L8fGoQytSMK',
      youtubeVideoId: 'VGmJ8UzJvpQ',
      category: 'Culture',
      duration: const Duration(minutes: 4, seconds: 55),
      views: 1650000,
      uploadDate: DateTime.now().subtract(const Duration(days: 3)),
      tags: ['culture', 'heritage', 'celebration'],
    ),
  ];

  static List<DrAbuAlarm> get alarmTones => [
    DrAbuAlarm(
      id: 'alarm_1',
      name: 'Abu\'s Energy Boost',
      description: 'Wake up with Dr Abu\'s high-energy morning call!',
      audioUrl: 'sample_audio_url_1',
      duration: const Duration(seconds: 30),
      category: 'Energy',
      thumbnailUrl: 'https://picsum.photos/200/200?random=11',
    ),
    DrAbuAlarm(
      id: 'alarm_2',
      name: 'Gentle Abu Wake-up',
      description: 'A gentle and motivating wake-up call from Dr Abu',
      audioUrl: 'sample_audio_url_2',
      duration: const Duration(seconds: 25),
      category: 'Gentle',
      thumbnailUrl: 'https://picsum.photos/200/200?random=12',
    ),
    DrAbuAlarm(
      id: 'alarm_3',
      name: 'Abu\'s Wisdom Call',
      description: 'Start your day with Dr Abu\'s words of wisdom',
      audioUrl: 'sample_audio_url_3',
      duration: const Duration(seconds: 40),
      category: 'Wisdom',
      isPremium: true,
      thumbnailUrl: 'https://picsum.photos/200/200?random=13',
    ),
  ];

  static List<String> get dailyQuotes => [
    "Rise up, my friend! Today is your day to shine! - Dr Abu",
    "Laughter is the medicine for the soul. Keep smiling! - Dr Abu",
    "Every challenge is an opportunity in disguise. Embrace it! - Dr Abu",
    "Your potential is limitless. Believe in yourself! - Dr Abu",
    "Success begins with a positive mindset. Stay strong! - Dr Abu",
  ];

  static List<String> get categories => [
    'All',
    'Comedy',
    'Motivation',
    'Wisdom',
    'Tour',
    'Culture',
    'Behind-Scenes',
  ];

  static Map<String, dynamic> get userStats => {
    'totalWatchTime': '523 minutes',
    'favoriteVideos': 12,
    'alarmsSet': 5,
    'streakDays': 28,
    'level': 'Abu Superfan',
  };
}
