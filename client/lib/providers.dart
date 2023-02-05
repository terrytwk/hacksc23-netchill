import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:netchill/constants/constants.dart';
import 'package:netchill/models/api.dart';
import 'package:netchill/models/user.dart';

final apiProvider = StateNotifierProvider<ApiNotifier, ApiCredentials>((ref) {
  return ApiNotifier(ref);
});

final requestsProvider = StateProvider<List<User>>((ref) {
  return [
    NetChillConstants.jonathanUser,
  ];
});

final nearbyProvider = StateProvider<List<User>>((ref) {
  return [
    NetChillConstants.jonathanUser,
    NetChillConstants.clementUser,
    NetChillConstants.ericUser,
  ];
});
