import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:netchill/models/api.dart';

final apiProvider = StateNotifierProvider<ApiNotifier, ApiCredentials>((ref) {
  return ApiNotifier(ref);
});
