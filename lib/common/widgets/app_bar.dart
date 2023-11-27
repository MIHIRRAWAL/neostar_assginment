import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({
    super.key,
    this.onPressed,
    required this.title,
  });

  final VoidCallback? onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: preferredSize,
      child: AppBar(
        leading: onPressed != null
            ? IconButton(
                onPressed: onPressed,
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
              )
            : const SizedBox.shrink(),
        title: Text(
          title,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
