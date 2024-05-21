import 'package:bonus_app_admin/exports.dart';

class UserInfo extends StatelessWidget {
   UserInfo({
    super.key,
    required this.controller
  });
HomeController controller;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Icon(Icons.person, size: 40),
        const SizedBox(width: 5),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              controller.user!.name,
              style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20),
            ),
            Text(controller.user!.username)
          ],
        ),
      ],
    );
  }
}