import 'package:flutter/material.dart';
import 'package:shop_smart/core/consts/assets.dart';
import 'package:shop_smart/core/widgets/title_text.dart';

import '../widgets/subtitle_text.dart';

class MyAppFunctions {
  static Future<void> showErrorOrWarningDialog({
    required BuildContext context,
    required String subtitle,
    bool isError = true,
    required Function fct,
  }) async {
    await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0)),
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  isError
                      ? Assets.assetsImagesError
                      : Assets.assetsImagesWarning,
                  height: 60,
                  width: 60,
                ),
                const SizedBox(
                  height: 16.0,
                ),
                SubtitleTextWidget(
                  label: subtitle,
                  fontWeight: FontWeight.w600,
                ),
                const SizedBox(
                  height: 16.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Visibility(
                      visible: !isError,
                      child: TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const SubtitleTextWidget(
                          label: "Cancel",
                          color: Colors.green,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const SubtitleTextWidget(
                        label: "OK",
                        color: Colors.red,
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        });
  }

  static Future<void> imagePickerDialog({
    required BuildContext context,
    required Function cameraFUNC,
    required Function galleryFUNC,
    required Function removeFUNC,
  }) async {
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Center(
            child: TitlesTextWidget(
              label: "Choose your options",
            ),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                TextButton.icon(
                  onPressed: () {
                    cameraFUNC();
                    if (Navigator.canPop(context)) {
                      Navigator.pop(context);
                    }
                  },
                  label: const Text("Camera"),
                  icon: const Icon(Icons.camera_alt_outlined),
                ),
                TextButton.icon(
                  onPressed: () {
                    cameraFUNC();
                    if (Navigator.canPop(context)) {
                      Navigator.pop(context);
                    }
                  },
                  label: const Text("Gallery"),
                  icon: const Icon(Icons.image),
                ),
                TextButton.icon(
                  onPressed: () {
                    cameraFUNC();
                    if (Navigator.canPop(context)) {
                      Navigator.pop(context);
                    }
                  },
                  label: const Text("Remove"),
                  icon: const Icon(Icons.remove_circle_outline),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
