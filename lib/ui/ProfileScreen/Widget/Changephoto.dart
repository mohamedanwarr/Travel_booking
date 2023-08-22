import 'package:flutter/material.dart';

class Change_photo extends StatelessWidget {
  const Change_photo({
    super.key,
    this.container,
    this.ontap,
    this.backgroundImage,
  });

  final Widget? container;
  final void Function()? ontap;
  final dynamic backgroundImage;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: 150,
      width: 150,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            // Wrap the CircleAvatar in a Container
            constraints: const BoxConstraints(
              maxWidth: 150,
              maxHeight: 150,
            ),
            child: CircleAvatar(
              backgroundColor: Colors.transparent,
              backgroundImage: backgroundImage??AssetImage('assets/images/User-Profile.png'),
            ),
          ),
          if (container != null)
            Positioned(
                right: 1,
                bottom: 0,
                child: GestureDetector(
                  onTap: ontap,
                  child: container!,
                )),
        ],
      ),
    );
  }
}
