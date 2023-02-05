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
      profilePic:
          'https://media.licdn.com/dms/image/D5603AQGV_-ab_hwoCg/profile-displayphoto-shrink_400_400/0/1671822048092?e=1681344000&v=beta&t=iuWmWrwua0Qi38l3DchAAoPeM-ZKYAbum_huy_YPlrg',
    ),
    const User(
      firstName: 'Emily',
      lastName: 'Kleinman',
      position: 'Computer Science',
      organization: 'USC',
    ),
  ];
});

final nearbyProvider = StateProvider<List<User>>((ref) {
  return [
    const User(
      firstName: 'Jonathan',
      lastName: 'Liu',
      position: 'Computer Science',
      organization: 'USC',
      profilePic:
          'https://media.licdn.com/dms/image/D5603AQGV_-ab_hwoCg/profile-displayphoto-shrink_400_400/0/1671822048092?e=1681344000&v=beta&t=iuWmWrwua0Qi38l3DchAAoPeM-ZKYAbum_huy_YPlrg',
    ),
    const User(
      firstName: 'Clement',
      lastName: 'Chan',
      position: 'Computer Science',
      organization: 'USC',
      profilePic:
          'https://media.licdn.com/dms/image/C5603AQFQI7RkaN3dFw/profile-displayphoto-shrink_400_400/0/1600186467882?e=1681344000&v=beta&t=K1ByhUK3CYzvUjHcC2DYOCBwZ3mvoFUgLOwKXmAkNM4',
    ),
    const User(
      firstName: 'Eric',
      lastName: 'Kim',
      position: 'Computer Science',
      organization: 'UCLA',
      profilePic:
          'https://media.licdn.com/dms/image/D5603AQFo6naixE0v0A/profile-displayphoto-shrink_400_400/0/1675106587984?e=1681344000&v=beta&t=bptkI2z7B3Mvwp2tEK2yo94bW8XzJuT6VnAIRY7Z4VI',
    ),
  ];
});
