import 'package:e_member_app/core/theme/app_color/app_color.dart';
import 'package:flutter/material.dart';

class AppUpdateDialog extends StatelessWidget {
  const AppUpdateDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColor.transparent,
      elevation: 0,
      child: Container(
        decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Illustration Image
            Image.asset(
              'assets/images/software-update 1.png',
              height: 180,
              width: 180,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 180,
                  width: 180,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    Icons.system_update_alt,
                    size: 80,
                    color: Colors.grey[400],
                  ),
                );
              },
            ),
            const SizedBox(height: 24),

            // Title
            const Text(
              'ആപ്പ് അപ്ഡേറ്റ് ലഭ്യമാണ്!',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: AppColor.black,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),

            // Description
            const Text(
              'നിങ്ങളുടെ ആപ്പിന്റെ പുതിയ പതിപ്പ് ലഭ്യമാണ്. ചെയ്യേണ്ട പ്രകടനത്തിനും പുതിയ സവിശേഷതകൾക്കും ദയവായി അപ്ഡേറ്റ് ചെയ്യുക.',
              style: TextStyle(
                fontSize: 14,
                color: AppColor.textLabel,
                height: 1.5,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),

            // Buttons
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.backgroundColor1,
                      foregroundColor: AppColor.white,
                      elevation: 0,
                      //padding: const EdgeInsets.symmetric(vertical: 14),
                      fixedSize: const Size(145, 35),

                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      'Cancel',

                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle update action
                      // You can add URL launcher to open play store/app store
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.button,
                      foregroundColor: AppColor.white,
                      elevation: 0,
                      fixedSize: const Size(145, 35),
                      // padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      'Update',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _handleUpdate() {
    // Add your update logic here
    // Example with url_launcher package:
    // final url = Platform.isAndroid
    //     ? 'https://play.google.com/store/apps/details?id=your.package.name'
    //     : 'https://apps.apple.com/app/idYOUR_APP_ID';
    // launchUrl(Uri.parse(url));
  }
}



// import 'package:url_launcher/url_launcher.dart';
// import 'dart:io';

// void _handleUpdate() async {
//   final url = Platform.isAndroid
//       ? 'https://play.google.com/store/apps/details?id=com.yourapp.package'
//       : 'https://apps.apple.com/app/id123456789';
  
//   if (await canLaunchUrl(Uri.parse(url))) {
//     await launchUrl(Uri.parse(url));
//   }
// }