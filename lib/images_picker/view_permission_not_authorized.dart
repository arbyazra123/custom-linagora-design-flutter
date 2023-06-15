
import 'package:flutter/material.dart';
import 'package:linagora_design_flutter/colors/linagora_sys_colors.dart';
import 'package:linagora_design_flutter/images_picker/use_camera_widget.dart';
import 'package:photo_manager/photo_manager.dart';

class PermissionNotAuthorizedWidget extends StatelessWidget {
  const PermissionNotAuthorizedWidget({
    super.key,
    this.backgroundColor,
    this.goToSettingsWidget,
    this.onCameraPressed,
    this.backgroundImageCamera
  });

  final Color? backgroundColor;

  final Widget? goToSettingsWidget;

  final ImageProvider<Object>? backgroundImageCamera;

  final void Function()? onCameraPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 32,
          height: 4,
          margin: const EdgeInsets.symmetric(vertical: 16.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100.0),
            color: backgroundColor ?? LinagoraSysColors.material().outline.withOpacity(0.4),
          ),
        ),
        Expanded(
          child: GridView.custom(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            ),
            childrenDelegate: SliverChildBuilderDelegate((context, index) {
              if (index == 0) {
                return UseCameraWidget(
                  onPressed: onCameraPressed,
                  backgroundImage: backgroundImageCamera
                );
              }
              return GestureDetector(
                onTap: () => PhotoManager.openSetting(),
                child: goToSettingsWidget ?? SizedBox(
                  height: 40,
                  width: 40,
                  child: Icon(
                    Icons.photo,
                    color: Theme.of(context).colorScheme.surfaceVariant,
                  ),
                ),
              );
            },
            childCount: 2,
            ),
          ),
        )
      ],
    );
  }
}