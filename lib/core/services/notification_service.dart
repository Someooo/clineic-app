import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:logger/logger.dart';

class NotificationService {
  static final Logger _logger = Logger(printer: PrettyPrinter(colors: true, printEmojis: true));
  
  static Future<void> init() async {
    // Initialize OneSignal
    OneSignal.initialize('eed7048b-579e-444e-adba-a76a9426d5c7');
    
    // Request notification permissions (optional but recommended)
    await OneSignal.Notifications.requestPermission(true);
    
    // Set up notification handlers
    OneSignal.Notifications.addForegroundWillDisplayListener((event) {
      // Display notification while app is in foreground
      event.preventDefault();
      event.notification.display();
    });
    
    OneSignal.Notifications.addClickListener((event) {
      // Handle notification click when app is open or background
      _logger.i('Notification clicked: ${event.notification.title}');
      // You can add navigation logic here based on the notification data
    });
  }
}
