import 'package:gradus/components/custom_notification.dart';
import 'package:in_app_notification/in_app_notification.dart';

showAlert({
  error = false,
  required text,
  required context,
}) {
  InAppNotification.show(
    duration: Duration(seconds: 2),
    child: CustomNotification(
      error: error,
      text: text,
    ),
    context: context,
  );
}