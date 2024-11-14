import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/models/profile.dart';
import '../../../core/utils.dart';
import '../../../core/widgets/buttons/cuper_button.dart';
import '../../../core/widgets/buttons/primary_button.dart';
import '../../../core/widgets/custom_appbar.dart';
import '../../../core/widgets/others/svg_widget.dart';

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
      logger(e);
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
                Container(
                  height: 168,
                  width: 168,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    border: Border.all(
                      width: 4,
                      color: AppColors.main,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.25),
                        blurRadius: 20,
                        spreadRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: CuperButton(
                    onPressed: onPickImage,
                    child: Center(
                      child: controller4.text.isEmpty
                          ? const SvgWidget(
                              'assets/s1.svg',
                              color: AppColors.main,
                              height: 96,
                            )
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(84),
                              child: Image.file(
                                File(controller4.text),
                                height: 160,
                                width: 160,
                                fit: BoxFit.cover,
                              ),
                            ),
                    ),
                  ),
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
                _ProfileField(
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
                _ProfileField(
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
                _ProfileField(
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

class _ProfileField extends StatelessWidget {
  const _ProfileField({
    required this.controller,
    required this.hintText,
  });

  final TextEditingController controller;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 36,
        width: 260,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(36),
          border: Border.all(
            width: 1,
            color: AppColors.main,
          ),
        ),
        child: TextField(
          controller: controller,
          textAlign: TextAlign.center,
          inputFormatters: [LengthLimitingTextInputFormatter(20)],
          textCapitalization: TextCapitalization.sentences,
          style: const TextStyle(
            color: AppColors.main,
            fontSize: 14,
            fontFamily: Fonts.ns400,
          ),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              vertical: 0,
              horizontal: 24,
            ),
            hintText: hintText,
            hintStyle: const TextStyle(
              color: Color(0xffD3D3D3),
              fontSize: 14,
              fontFamily: Fonts.ns400,
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
            ),
          ),
          onTapOutside: (event) {
            FocusManager.instance.primaryFocus?.unfocus();
          },
        ),
      ),
    );
  }
}
