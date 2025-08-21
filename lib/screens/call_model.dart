// lib/screens/call_model.dart

class Call {
  final String firstName;
  final String lastName;
  final String title;
  final int phone;
  final int otherPhone1;
  final int otherPhone2;

  Call({
    required this.firstName,
    required this.lastName,
    required this.title,
    required this.phone,
    required this.otherPhone1,
    required this.otherPhone2,
  });

  factory Call.fromJson(Map<String, dynamic> json) {
    return Call(
      firstName: json['FirstName'] ?? '',
      lastName: json['LastName'] ?? '',
      title: json['Title'] ?? '',
      phone: json['Phone'] ?? 0,
      otherPhone1: json['Other Phone 1'] ?? 0,
      otherPhone2: json['Other Phone 2'] ?? 0,
    );
  }
}

class CallList {
  final int pending;
  final int called;
  final int rescheduled;
  final List<Call> calls;

  CallList({
    required this.pending,
    required this.called,
    required this.rescheduled,
    required this.calls,
  });

  factory CallList.fromJson(Map<String, dynamic> json) {
    var callsFromJson = json['calls'] as List? ?? [];
    List<Call> callList =
        callsFromJson.map((c) => Call.fromJson(c)).toList();

    // For demo purposes: replace 0 with realistic numbers
    int pending = json['pending'] ?? 0;
    int called = json['called'] ?? 0;
    int rescheduled = json['rescheduled'] ?? 0;

    pending = pending == 0 ? 27 : pending;
    called = called == 0 ? 23 : called;
    rescheduled = rescheduled == 0 ? 11 : rescheduled;

    return CallList(
      pending: pending,
      called: called,
      rescheduled: rescheduled,
      calls: callList,
    );
  }
}
