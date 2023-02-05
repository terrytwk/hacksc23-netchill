import 'package:netchill/models/user.dart';

class NetChillConstants {
  static const jonathanUser = User(
    email: 'jonathan@usc.edu',
    firstName: 'Jonathan',
    lastName: 'Liu',
    position: 'Computer Science',
    organization: 'USC',
    profilePic:
        'https://media.licdn.com/dms/image/D5603AQGV_-ab_hwoCg/profile-displayphoto-shrink_400_400/0/1671822048092?e=1681344000&v=beta&t=iuWmWrwua0Qi38l3DchAAoPeM-ZKYAbum_huy_YPlrg',
    bio: 'Passionate about all things tech and entrepreneurship!',
    phone: '1231234567',
    interests: [
      'photography',
      'art',
      'singing',
      'reading',
      'dancing',
      'movies'
    ],
  );

  static const clementUser = User(
    email: 'clement@usc.edu',
    firstName: 'Clement',
    lastName: 'Chan',
    position: 'Computer Science',
    organization: 'USC',
    profilePic:
        'https://media.licdn.com/dms/image/C5603AQFQI7RkaN3dFw/profile-displayphoto-shrink_400_400/0/1600186467882?e=1681344000&v=beta&t=K1ByhUK3CYzvUjHcC2DYOCBwZ3mvoFUgLOwKXmAkNM4',
    bio: 'Game dev and musical genius',
    phone: '1231234567',
    interests: [
      'backend web dev',
      'game dev',
      'music production',
    ],
  );

  static const ericUser = User(
    email: 'eric@ucla.edu',
    firstName: 'Eric',
    lastName: 'Kim',
    position: 'Computer Science',
    organization: 'UCLA',
    profilePic:
        'https://media.licdn.com/dms/image/D5603AQFo6naixE0v0A/profile-displayphoto-shrink_400_400/0/1675106587984?e=1681344000&v=beta&t=bptkI2z7B3Mvwp2tEK2yo94bW8XzJuT6VnAIRY7Z4VI',
    bio: 'Love learning new things and gaining new skills',
    phone: '1231234567',
    interests: ['mobile app dev', 'frontend web dev'],
  );

  static const terryUser = User(
    email: 'terry@mit.edu',
    firstName: 'Terry',
    lastName: 'Kim',
    position: 'Computer Science',
    organization: 'MIT',
    profilePic:
        'https://media.licdn.com/dms/image/C4D03AQExx2j7-onEBA/profile-displayphoto-shrink_400_400/0/1647106099164?e=1681344000&v=beta&t=mJHnToAI_Ep2Dn97A327SLFchOOQTXk8WJy30HMYBNg',
    bio: "Hello! I am passionate about mobile app dev and meeting new people!",
    phone: '1231234567',
    interests: ["web dev", "cyber security", "cloud", 'exercise', 'hiking'],
  );
}
