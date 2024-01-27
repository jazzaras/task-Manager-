import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  OverlayPortalController overlayPortalController = OverlayPortalController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (overlayPortalController.isShowing) {
          overlayPortalController.hide();
        }
      },
      child: Container(
        color: Colors.green,
        child: Center(
          child: InkWell(
            onTap: () => overlayPortalController.toggle(),
            child: SizedBox(
              height: 100,
              width: 100,
              child: OverlayPortal(
                controller: overlayPortalController,
                overlayChildBuilder: (context) {
                  return Positioned(
                    left: 50,
                    child: Container(
                      height: 100,
                      width: 90,
                      child: Text("hee;p00"),
                      color: Colors.amber,
                    ),
                  );
                },
                child: const Icon(
                  Icons.functions_rounded,
                  size: 200,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
