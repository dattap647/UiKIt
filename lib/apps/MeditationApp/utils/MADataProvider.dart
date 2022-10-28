
import 'package:mighty_ui_kit/apps/MeditationApp/models/MaBasicModel.dart';
import 'package:mighty_ui_kit/apps/MeditationApp/models/MAIntrestModel.dart';
import 'package:mighty_ui_kit/apps/MeditationApp/models/MAWalkThroughModel.dart';

import 'MAAppContants.dart';
import 'MAImages.dart';

List<MaWalkThroughClass> walkThroughClass = [
  MaWalkThroughClass(text: "Anxiety & Stress Reduction", name: "Meditation apps can help to relax an anxious mind by providing a 20-minute directed or unstructured video", img: MAWalk1),
  MaWalkThroughClass(
      text: "Deep Sleep",
      name:
          "This type of meditation focus on creating a fun and soothing environment by playing calming nature and melody tracks. This assists users in feeling a sense of peace, which encourages sleep.",
      img: MAWalk2),
  MaWalkThroughClass(
      text: "Concentration & Focus",
      name: "These apps help their users to block distractions such as other apps, messages, and phone calls, enabling them to focus and concentrate better at work.",
      img: MAWalk3)
];

List<MAInterestModel> interestList = [
  MAInterestModel(name: "Anxiety", img: MAStress),
  MAInterestModel(name: "Stress", img: MAStress),
  MAInterestModel(name: "Happiness", img: MAHappiness),
  MAInterestModel(name: "Sleep", img: MAHappiness),
  MAInterestModel(name: "Self-care", img: MASelfCare),
  MAInterestModel(name: "Focus", img: MASelfCare),
  MAInterestModel(name: "Emotions", img: MAInnerPeace),
  MAInterestModel(name: "Inner Peace", img: MAInnerPeace),
  MAInterestModel(name: "Beginners", img: MABeginners),
  MAInterestModel(name: "Mindfulness", img: MABeginners),
  MAInterestModel(name: "Anxiety", img: MAStress),
  MAInterestModel(name: "Stress", img: MAStress),
  MAInterestModel(name: "Happiness", img: MAHappiness),
  MAInterestModel(name: "Sleep", img: MAHappiness),
  MAInterestModel(name: "Self-care", img: MASelfCare),
  MAInterestModel(name: "Focus", img: MASelfCare),
  MAInterestModel(name: "Emotions", img: MAInnerPeace),
  MAInterestModel(name: "Inner Peace", img: MAInnerPeace),
  MAInterestModel(name: "Beginners", img: MABeginners),
  MAInterestModel(name: "Mindfulness", img: MABeginners)
];

List<MAInterestModel> meditationList = [
  MAInterestModel(name: "Anxiety", img: MAStress, height: 180),
  MAInterestModel(name: "Stress", img: MASelfCare, height: 200),
  MAInterestModel(name: "Happiness", img: MABeginners, height: 200),
  MAInterestModel(name: "Sleep", img: MAHappiness, height: 180),
  MAInterestModel(name: "Self-care", img: MASelfCare, height: 200),
  MAInterestModel(name: "Focus", img: MAInnerPeace, height: 180),
  MAInterestModel(name: "Emotions", img: MAInnerPeace, height: 180),
  MAInterestModel(name: "Inner Peace", img: MAStress, height: 180),
  MAInterestModel(name: "Beginners", img: MABeginners, height: 180),
  MAInterestModel(name: "Mindfulness", img: MABeginners, height: 180)
];

List<MABasicModel> courseList = [
  MABasicModel(img: MAStress, characterImg: MAProfile_image, title: 'Basics', subtitle: 'course', time: '3-5 min'),
  MABasicModel(img: MABeginners, characterImg: MAProfile_image1, title: 'Relaxation', subtitle: 'music', time: '3-5 min'),
  MABasicModel(img: MAHappiness, characterImg: MAProfile_image2, title: 'Basics', subtitle: 'course', time: '3-5 min'),
  MABasicModel(img: MAInnerPeace, characterImg: MAProfile_image3, title: 'Relaxation', subtitle: 'music', time: '3-5 min'),
  MABasicModel(img: MASelfCare, characterImg: MAProfile_image, title: 'Basics', subtitle: 'course', time: '3-5 min'),
  MABasicModel(img: MASelfCare, characterImg: MAProfile_image1, title: 'Relaxation', subtitle: 'music', time: '3-5 min'),
];

List<MABasicModel> favList = [
  MABasicModel(
      img: MAStress,
      characterImg: MAWalk1,
      title: 'Basics',
      subtitle: 'course',
      time: '3-5 min',
      shortDesc:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."),
  MABasicModel(
      img: MABeginners,
      characterImg: MAWalk1,
      title: 'Relaxation',
      subtitle: 'music',
      time: '3-5 min',
      shortDesc:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."),
  MABasicModel(
      img: MAHappiness,
      characterImg: MAWalk1,
      title: 'Basics',
      subtitle: 'course',
      time: '3-5 min',
      shortDesc:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."),
  MABasicModel(
      img: MAInnerPeace,
      characterImg: MAWalk1,
      title: 'Relaxation',
      subtitle: 'music',
      time: '3-5 min',
      shortDesc:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."),
  MABasicModel(
      img: MASelfCare,
      characterImg: MAWalk1,
      title: 'Basics',
      subtitle: 'course',
      time: '3-5 min',
      shortDesc:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."),
  MABasicModel(
      img: MASelfCare,
      characterImg: MAWalk1,
      title: 'Relaxation',
      subtitle: 'music',
      time: '3-5 min',
      shortDesc:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."),
];

List<MABasicModel> offLineList = [
  MABasicModel(
      img:MAStress,
      characterImg: MAWalk1,
      title: 'Basics',
      subtitle: 'course',
      time: '3-5 min',
      shortDesc:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."),
  MABasicModel(
      img:MABeginners,
      characterImg: MAWalk1,
      title: 'Relaxation',
      subtitle: 'music',
      time: '3-5 min',
      shortDesc:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."),
  MABasicModel(
      img:MAHappiness,
      characterImg: MAWalk1,
      title: 'Basics',
      subtitle: 'course',
      time: '3-5 min',
      shortDesc:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."),
  MABasicModel(
      img:MAInnerPeace,
      characterImg: MAWalk1,
      title: 'Relaxation',
      subtitle: 'music',
      time: '3-5 min',
      shortDesc:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."),
  MABasicModel(
      img:MASelfCare,
      characterImg: MAWalk1,
      title: 'Basics',
      subtitle: 'course',
      time: '3-5 min',
      shortDesc:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."),
  MABasicModel(
      img:MASelfCare,
      characterImg: MAWalk1,
      title: 'Relaxation',
      subtitle: 'music',
      time: '3-5 min',
      shortDesc:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."),
];

List<MABasicModel> courseDetailList = [
  MABasicModel(
      img: MABg1,
      characterImg: MAWalk1,
      title: 'Chapter 1',
      subtitle: 'course',
      time: '3-5 min',
      shortDesc:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
      extention: audio,
      attachedFile: MAMeditation_audio),
  MABasicModel(
    img: MABg2,
    characterImg: MAWalk1,
    title: 'Chapter 2',
    subtitle: 'music',
    time: '3-5 min',
    shortDesc:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
    extention: youtube,
    attachedFile: "https://www.youtube.com/watch?v=inpok4MKVLM",
  ),
  MABasicModel(
      img: MABg1,
      characterImg: MAWalk1,
      title: 'Chapter 3',
      subtitle: 'course',
      time: '3-5 min',
      shortDesc:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
      extention: video,
      attachedFile: MAMeditation_video1),
  MABasicModel(
      img: MABg2,
      characterImg: MAWalk1,
      title: 'Chapter 4',
      subtitle: 'music',
      time: '3-5 min',
      shortDesc:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
      extention: video,
      attachedFile: MAMeditation_video1),
  MABasicModel(
      img: MABg1,
      characterImg: MAWalk1,
      title: 'Chapter 5',
      subtitle: 'course',
      time: '3-5 min',
      shortDesc:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
      extention: youtube,
      attachedFile: "https://www.youtube.com/watch?v=inpok4MKVLM"),
  MABasicModel(
      img: MABg2,
      characterImg: MAWalk1,
      title: 'Chapter 6',
      subtitle: 'music',
      time: '3-5 min',
      shortDesc:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
      extention: youtube,
      attachedFile: "https://www.youtube.com/watch?v=inpok4MKVLM"),
];

List<MABasicModel> reminderList = [
  MABasicModel(img: MABg1, title: 'Start fresh ', subtitle: 'course', time: '5:00 AM'),
  MABasicModel(img: MABg2, title: 'Take a break', subtitle: 'music', time: '2:30 PM'),
  MABasicModel(img: MABg1, title: 'Relax', subtitle: 'course', time: '10:00 pM'),
  MABasicModel(img: MABg2, title: 'Chapter 4', subtitle: 'music', time: '3-5 min'),
  MABasicModel(img: MABg1, title: 'Chapter 5', subtitle: 'course', time: '3-5 min'),
  MABasicModel(img: MABg2, title: 'Chapter 6', subtitle: 'music', time: '3-5 min'),
];

List<MABasicModel> upcomingList = [
  MABasicModel(img: MABg1, title: 'feel fresh', subtitle: 'course', time: '5:00 AM', isSelected: true),
  MABasicModel(img: MABg2, title: 'after work day', subtitle: 'music', time: '7:00 PM', isSelected: true),
];

List<MABasicModel> whatYouLikeList = [
  MABasicModel(title: "Anxiety", img: MABg2, isSelected: false),
  MABasicModel(title: "Stress", img: MABg3, isSelected: false),
  MABasicModel(title: "Happiness", img: MABg4, isSelected: false),
  MABasicModel(title: "Sleep", img: MAHappiness, isSelected: false),
  MABasicModel(title: "Self-care", img: MASelfCare, isSelected: false),
  MABasicModel(title: "Focus", img: MABg5, isSelected: false),
  MABasicModel(title: "Emotions", img: MAInnerPeace, isSelected: false),
  MABasicModel(title: "Inner Peace", img: MAStress, isSelected: false),
  MABasicModel(title: "Beginners", img: MABeginners, isSelected: false),
  MABasicModel(title: "Mindfulness", img: MABeginners, isSelected: false)
];

List<MABasicModel> relatedSleepList = [
  MABasicModel(title: "Anxiety & Stress Reduction", subtitle: "Meditation apps can help to relax an anxious mind by providing a 20-minute directed or unstructured video", img: MAStress),
  MABasicModel(
      title: "Deep Sleep",
      subtitle:
          "This type of meditation focus on creating a fun and soothing environment by playing calming nature and melody tracks. This assists users in feeling a sense of peace, which encourages sleep.",
      img: MABeginners),
  MABasicModel(
      title: "Concentration & Focus",
      subtitle: "These apps help their users to block distractions such as other apps, messages, and phone calls, enabling them to focus and concentrate better at work.",
      img: MAHappiness),
  MABasicModel(title: "Anxiety & Stress Reduction", subtitle: "Meditation apps can help to relax an anxious mind by providing a 20-minute directed or unstructured video", img: MAInnerPeace),
  MABasicModel(
      title: "Deep Sleep",
      subtitle:
          "This type of meditation focus on creating a fun and soothing environment by playing calming nature and melody tracks. This assists users in feeling a sense of peace, which encourages sleep.",
      img: MASelfCare),
  MABasicModel(
      title: "Concentration & Focus",
      subtitle: "These apps help their users to block distractions such as other apps, messages, and phone calls, enabling them to focus and concentrate better at work.",
      img: MASelfCare)
];

List<MABasicModel> musicList = [
  MABasicModel(
      img: MABg1,
      characterImg: MAWalk1,
      title: 'Daily Calm',
      subtitle: 'by artist',
      time: '3:00 min',
      shortDesc:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
      attachedFile: "www.google.com"),
  MABasicModel(
    img: MABg2,
    characterImg: MAWalk1,
    title: 'Stay Happy',
    subtitle: 'by artist',
    time: '3:00 min',
    shortDesc:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
    attachedFile: "https://www.youtube.com/watch?v=inpok4MKVLM",
  ),
  MABasicModel(
      img: MABg1,
      characterImg: MAWalk1,
      title: 'Take a break',
      subtitle: 'by artist',
      time: '3:00 min',
      shortDesc:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
      attachedFile: MAMeditation_audio),
  MABasicModel(
      img: MABg2,
      characterImg: MAWalk1,
      title: 'Void',
      subtitle: 'by artist',
      time: '3:00 min',
      shortDesc:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
      attachedFile: MAMeditation_audio),
  MABasicModel(
      img: MABg1,
      characterImg: MAWalk1,
      title: 'Feel Free',
      subtitle: 'by artist',
      time: '3:00 min',
      shortDesc:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
      attachedFile: "https://www.youtube.com/watch?v=inpok4MKVLM"),
  MABasicModel(
      img: MABg2,
      characterImg: MAWalk1,
      title: 'New Day',
      subtitle: 'by artist',
      time: '3:00 min',
      shortDesc:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
      attachedFile: "https://www.youtube.com/watch?v=inpok4MKVLM"),
];

List<MaWalkThroughClass> musicFeaturedList = [
  MaWalkThroughClass(text: "Anxiety & Stress Reduction", name: "Meditation apps can help to relax an anxious mind by providing a 20-minute directed or unstructured video", img: MAHappiness),
  MaWalkThroughClass(
      text: "Deep Sleep",
      name:
          "This type of meditation focus on creating a fun and soothing environment by playing calming nature and melody tracks. This assists users in feeling a sense of peace, which encourages sleep.",
      img: MAStress),
  MaWalkThroughClass(
      text: "Concentration & Focus",
      name: "These apps help their users to block distractions such as other apps, messages, and phone calls, enabling them to focus and concentrate better at work.",
      img: MAInnerPeace)
];
