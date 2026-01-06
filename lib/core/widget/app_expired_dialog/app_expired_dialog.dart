import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Function to show the expired dialog
void showAppExpiredDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false, // User cannot dismiss by tapping outside
    builder: (BuildContext context) {
      return const AppExpiredDialog();
    },
  );
}

// App Expired Dialog Widget
class AppExpiredDialog extends StatelessWidget {
  const AppExpiredDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false, // Disable back button
      child: Dialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Illustration Image
              Image.asset(
                'assets/expired_illustration.png',
                height: 180,
                width: 180,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  // Fallback illustration if image not found
                  return Container(
                    height: 180,
                    width: 180,
                    decoration: BoxDecoration(
                      color: Colors.red[50],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      Icons.error_outline,
                      size: 80,
                      color: Colors.red[400],
                    ),
                  );
                },
              ),
              const SizedBox(height: 24),

              // Title
              const Text(
                'ആപ്പ് കാലഹരണപ്പെട്ടു!',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),

              // Description
              const Text(
                'നിങ്ങളുടെ ആപ്പ് കാലഹരണപ്പെട്ടിരിക്കുന്നു. ആപ്പ് തുടരാൻ ദയവായി പുതിയ പതിപ്പിലേക്ക് അപ്ഡേറ്റ് ചെയ്യുക.',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black87,
                  height: 1.5,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),

              // Buttons
              Row(
                children: [
                  // Exit Button
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        _handleExit();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey[300],
                        foregroundColor: Colors.black87,
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        'Exit',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),

                  // Update Button
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        _handleUpdate();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        'Update',
                        style: TextStyle(
                          fontSize: 16,
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
      ),
    );
  }

  void _handleExit() {
    // Close the app
    SystemNavigator.pop();
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

// // Optional: Function to check if app is expired
// Future<bool> isAppExpired() async {
//   // Example 1: Check with server
//   // final response = await http.get(Uri.parse('https://your-api.com/app-status'));
//   // final data = json.decode(response.body);
//   // return data['is_expired'] ?? false;
  
//   // Example 2: Check expiry date
//   // final expiryDate = DateTime(2024, 12, 31);
//   // return DateTime.now().isAfter(expiryDate);
  
//   // For demo purposes
//   return false; // Change to true to test the dialog
// }