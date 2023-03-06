class VerifyArguments {
  final String phone;
  final String firstname;
  final String lastname;
  final bool isSingUp;

  VerifyArguments({
    required this.phone,
    required this.firstname,
    required this.lastname,
    required this.isSingUp,
  });
}

class NotificationDetailArguments {
  final String id;

  NotificationDetailArguments({
    required this.id,
  });
}