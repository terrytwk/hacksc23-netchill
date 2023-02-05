import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netchill/components/inserted_box.dart';
import 'package:netchill/components/my_button_to_mainpage.dart';

class InterestPage extends StatefulWidget {
  @override
  _InterestPageState createState() => _InterestPageState();
}

class _InterestPageState extends State<InterestPage> {
  List<String> interests = [];
  List<String> selectedInterests = [];
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
      if (selected[index]) {
        selected[index] = false;
        selectedInterests.remove(interests[index]);
      } else {
        selected[index] = true;
        selectedInterests.add(interests[index]);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Your Interest'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              height: 80,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: interests
                    .asMap()
                    .entries
                    .where((entry) => selected[entry.key])
                    .map((entry) => Container(
                          margin: EdgeInsets.all(10),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color.fromARGB(255, 150, 196, 255),
                          ),
                          child: Text(
                            entry.value,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ))
                    .toList(),
              ),
            ),
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
        padding: const EdgeInsets.only(top: 20),
        child: Container(
          height: 50,
          width: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: selected ? Colors.blue : Colors.white,
            border: Border.all(
              color: Color.fromARGB(255, 148, 156, 223),
              width: 3,
            ),
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(255, 181, 227, 255),
                offset: Offset(0.0, 3.0), //(x,y)
                blurRadius: 5.0,
              ),
            ],
          ),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: selected ? Colors.white : Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
