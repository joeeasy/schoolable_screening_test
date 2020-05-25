import 'package:schoolable/core/model/user_model.dart';

class Comment {
  final User sender;
  final String
      time; // Would usually be type DateTime or Firebase Timestamp in production apps
  final String text;

  Comment({
    this.sender,
    this.time,
    this.text,
  });
}

//Current user - You
final User currentUser = User(
    id: 0,
    name: 'Current User',
    imageUrl: 'assets/images/dummy_profile.jpg',
    userType: 'GUARDIAN');

/*
Other users including school
* */
// USERS
final User schoolBoard = User(
    id: 1,
    name: 'Vintage Heights',
    imageUrl: 'assets/images/profile_icon.png',
    userType: 'SCHOOL_BOARD');

List<Comment> commentList = [
  Comment(
    sender: schoolBoard,
    text: 'This is how comments would look like on the mobile application',
    time: '5 January, 2020',
  ),
  Comment(
    sender: currentUser,
    text: 'Wow... this is Awesome',
    time: '5 January, 2020',
  ),
  Comment(
    sender: schoolBoard,
    text: 'This is how comments would look like on the mobile application',
    time: '5 January, 2020',
  ),
  Comment(
    sender: currentUser,
    text: 'Wow... this is Awesome',
    time: '5 January, 2020',
  ),
  Comment(
    sender: schoolBoard,
    text: 'This is how comments would look like on the mobile application',
    time: '5 January, 2020',
  )
];

List months = [
  'January',
  'Febuary',
  'March',
  'April',
  'May',
  'June',
  'July',
  'August',
  'September',
  'October',
  'November',
  'December'
];

String getTime() {
  var now = new DateTime.now();
  var month = now.month;
  var day = now.day;
  var year = now.year;
  return '$day ${months[month]}, $year';
}

