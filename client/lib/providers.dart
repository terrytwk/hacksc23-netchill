import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:netchill/models/api.dart';
import 'package:netchill/models/user.dart';

final apiProvider = StateNotifierProvider<ApiNotifier, ApiCredentials>((ref) {
  return ApiNotifier(ref);
});

final requestsProvider = StateProvider<List<User>>((ref) {
  return [
    const User(
      firstName: 'Jonathan',
      lastName: 'Liu',
      position: 'Computer Science',
      organization: 'USC',
    ),
    const User(
      firstName: 'Emily',
      lastName: 'Kleinman',
      position: 'Computer Science',
      organization: 'USC',
    ),
  ];
});
