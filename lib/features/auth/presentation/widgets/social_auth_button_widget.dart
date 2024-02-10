import 'package:ensa_campus/features/auth/domain/common/auth_method.dart';
import 'package:flutter/material.dart';

import 'package:ionicons/ionicons.dart';

class SocialAuthButton extends StatelessWidget {
  const SocialAuthButton(this.authMethod, {super.key, required this.onPressed});

  final AuthMethod authMethod;
  final void Function(AuthMethod) onPressed;

  @override
  Widget build(BuildContext context) {
    if (authMethod is ManualEntryAuthMethod) {
      throw Exception('This method is not supported');
    }

    // TODO: Verify the colors used here are correct
    return InkWell(
      onTap: () => onPressed(authMethod),
      borderRadius: BorderRadius.circular(8.0),
      child: Container(
        width: 64.0,
        height: 64.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
        ),
        child: Icon(
          getIconForSocialAuthMethod(authMethod),
          size: getSizeForSocialAuthMethod(authMethod),
          color: Theme.of(context).colorScheme.onSurface,
        ),
      ),
    );
  }

  IconData getIconForSocialAuthMethod(AuthMethod authMethod) {
    if (authMethod is GoogleAuthMethod) return Ionicons.logo_google;
    if (authMethod is AppleAuthMethod) return Icons.apple;

    throw Exception('This method is not supported');
  }

  double getSizeForSocialAuthMethod(AuthMethod authMethod) {
    // This is done to make the google icon and apple icon match
    // in size visually
    if (authMethod is AppleAuthMethod) return 28.0;

    return 24.0;
  }
}
