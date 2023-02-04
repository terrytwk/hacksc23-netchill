import 'package:flutter/material.dart';
import 'package:netchill/components/inserted_box.dart';
import 'package:netchill/components/my_button_to_mainpage.dart';

class InterestPage extends StatefulWidget {
  @override
  _InterestPageState createState() => _InterestPageState();
}

class _InterestPageState extends State<InterestPage> {
  List<String> interests = [];
  List<bool> selected = [];
  void signUserIn() {}
  @override
  void initState() {
    super.initState();
    // interests from database
    interests = [
      'Photography 📸',
      'Book & Novels 📚',
      'Music 🎶',
      'Gaming 🕹️',
      'Basketball 🏀',
      'Soccer ⚽️',
      'Traveling 🚗',
      'Cooking 👩‍🍳',
      'Coffee ☕️',
      'Hiking ⛰️',
      'Rock Climbing 🧗‍♀️',
      'Movies 🍿',
      'Singing 🎤',
      'Food Discovery 🍔',
      'Gym & Fitness 💪',
      'Drawing & Painting 🎨',
      'Hacking 🧑‍💻',
      'Dancing 🕺'
    ];
    interests.sort((a, b) => a.compareTo(b));
    selected = List.filled(interests.length, false);
  }

  void toggleInterest(int index) {
    setState(() {
      selected[index] = !selected[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Your Interest'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: interests.length,
                itemBuilder: (BuildContext context, int index) {
                  return InterestBox(
                    key: Key(interests[index]),
                    title: interests[index],
                    selected: selected[index],
                    onTap: () {
                      toggleInterest(index);
                    },
                  );
                },
              ),
            ),
            MyButtonMainpage(
              // need to work on button clicked -> verify the username & password
              onTap: signUserIn,
            ),
            // RaisedButton(
            //   child: Text('Submit'),
            //   onPressed: () {
            //     // Submit the selected interests to the database here
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}

class InterestBox extends StatelessWidget {
  final String title;
  final bool selected;
  final VoidCallback onTap;

  const InterestBox({
    Key? key,
    required this.title,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Container(
          height: 64,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: selected ? Colors.blue : Colors.white,
            border: Border.all(
              color: Color.fromARGB(255, 173, 181, 255),
              width: 3,
            ),
          ),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: selected ? Colors.white : Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
