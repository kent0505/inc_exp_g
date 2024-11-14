import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/models/profile.dart';
import '../../../core/utils.dart';
import '../../../core/widgets/buttons/primary_button.dart';
import '../../../core/widgets/custom_appbar.dart';
import '../../../core/widgets/others/image_pick_widget.dart';
import '../../../core/widgets/textfields/profile_field.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final controller1 = TextEditingController();
  final controller2 = TextEditingController();
  final controller3 = TextEditingController();
  final controller4 = TextEditingController();

  ImagePicker picker = ImagePicker();
  XFile image = XFile('');

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

  @override
  void initState() {
    super.initState();
    controller1.text = profile.name;
    controller2.text = profile.email;
    controller3.text = profile.username;
    controller4.text = profile.image;
  }

  @override
  void dispose() {
    controller1.dispose();
    controller2.dispose();
    controller3.dispose();
    controller4.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const CustomAppbar(title: 'Profile'),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                const SizedBox(height: 15),
                const Center(
                  child: Text(
                    'Id: 0001',
                    style: TextStyle(
                      color: AppColors.main,
                      fontSize: 24,
                      fontFamily: Fonts.ns400,
                    ),
                  ),
                ),
                const SizedBox(height: 46),
                ImagePickWidget(
                  imagePath: controller4.text,
                  onPressed: onPickImage,
                ),
                const SizedBox(height: 46),
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
                const SizedBox(height: 82),
                Center(
                  child: PrimaryButton(
                    title: 'Share your profile',
                    onPressed: onSave,
                  ),
                ),
                const SizedBox(height: 55),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
