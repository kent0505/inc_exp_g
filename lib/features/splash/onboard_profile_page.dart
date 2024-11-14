import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

import '../../core/config/app_colors.dart';
import '../../core/models/profile.dart';
import '../../core/utils.dart';
import '../../core/widgets/buttons/cuper_button.dart';
import '../../core/widgets/buttons/primary_button.dart';
import '../../core/widgets/others/image_pick_widget.dart';
import '../../core/widgets/textfields/profile_field.dart';

class OnboardProfilePage extends StatefulWidget {
  const OnboardProfilePage({super.key});

  @override
  State<OnboardProfilePage> createState() => _OnboardProfilePageState();
}

class _OnboardProfilePageState extends State<OnboardProfilePage> {
  final controller1 = TextEditingController();
  final controller2 = TextEditingController();
  final controller3 = TextEditingController();
  final controller4 = TextEditingController();

  ImagePicker picker = ImagePicker();
  XFile image = XFile('');
  bool pick = false;

  String getTitle() {
    return pick ? 'Add your photo' : 'Let\'s get to know you!';
  }

  String getDescription() {
    return pick
        ? 'To make it easy for your friends to find you.'
        : 'Enter your name, email and desired username';
  }

  void onPickImage() async {
    image = await pickImage();
    controller4.text = image.path;
    setState(() {});
  }

  Future<XFile> pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return XFile('');
      return image;
    } catch (e) {
      return XFile('');
    }
  }

  void onSave() async {
    await saveProfile(
      Profile(
        name: controller1.text,
        email: controller2.text,
        username: controller3.text,
        image: controller4.text,
      ),
    ).then((_) {
      if (mounted) context.pop();
    });
  }

  void onSkip() async {
    await saveOnboard().then((value) {
      if (mounted) context.go('/home');
    });
  }

  void onNext() async {
    if (pick) {
      await saveProfile(
        Profile(
          name: controller1.text,
          email: controller2.text,
          username: controller3.text,
          image: controller4.text,
        ),
      );
      await saveOnboard().then((value) {
        if (mounted) context.go('/home');
      });
    } else {
      setState(() {
        pick = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    controller1.text = profile.name;
    controller2.text = profile.email;
    controller3.text = profile.username;
    controller4.text = profile.image;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 20 + getStatusBar(context)),
          Row(
            children: [
              const Spacer(),
              CuperButton(
                onPressed: onSkip,
                minSize: 20,
                child: const Text(
                  'Skip',
                  style: TextStyle(
                    color: AppColors.main,
                    fontSize: 12,
                    fontFamily: Fonts.ns700,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              const SizedBox(width: 45),
            ],
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              getTitle(),
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: AppColors.main,
                fontSize: 32,
                fontFamily: Fonts.ns700,
              ),
            ),
          ),
          const Spacer(),
          if (pick) ...[
            ImagePickWidget(
              imagePath: controller4.text,
              onPressed: onPickImage,
            ),
          ] else ...[
            const Center(
              child: Text(
                'Name',
                style: TextStyle(
                  color: AppColors.main,
                  fontSize: 24,
                  fontFamily: Fonts.ns400,
                ),
              ),
            ),
            const SizedBox(height: 12),
            ProfileField(
              controller: controller1,
              hintText: 'Name',
            ),
            const SizedBox(height: 16),
            const Center(
              child: Text(
                'E-mail',
                style: TextStyle(
                  color: AppColors.main,
                  fontSize: 24,
                  fontFamily: Fonts.ns400,
                ),
              ),
            ),
            const SizedBox(height: 12),
            ProfileField(
              controller: controller2,
              hintText: 'E-mail',
            ),
            const SizedBox(height: 16),
            const Center(
              child: Text(
                'Username',
                style: TextStyle(
                  color: AppColors.main,
                  fontSize: 24,
                  fontFamily: Fonts.ns400,
                ),
              ),
            ),
            const SizedBox(height: 12),
            ProfileField(
              controller: controller3,
              hintText: 'Username',
            ),
          ],
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 52),
            child: Text(
              getDescription(),
              textAlign: TextAlign.center,
              style: const TextStyle(
                height: 1.8,
                color: AppColors.main,
                fontSize: 18,
                fontFamily: Fonts.ns300,
              ),
            ),
          ),
          const SizedBox(height: 30),
          PrimaryButton(
            title: pick ? 'Start' : 'Next',
            onPressed: onNext,
          ),
          const SizedBox(height: 55),
        ],
      ),
    );
  }
}
