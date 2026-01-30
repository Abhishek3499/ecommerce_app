import 'package:ecommerceapp/models/story_model.dart';

/// Service that provides mock stories data for the app
/// In a real app, this would fetch from a backend API
class StoriesService {
  static final List<StoryModel> stories = [
    StoryModel('assets/media/BFC6A77A-C42F-4C07-A26D-E5583E7DD7B6.png', true),
    StoryModel('assets/media/02.png', false),
    StoryModel('assets/media/03.png', false),
    StoryModel("assets/media/Placeholder_02.png", false),
  ];
}
