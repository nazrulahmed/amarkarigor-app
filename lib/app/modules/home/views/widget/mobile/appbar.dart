import 'package:flutter/material.dart';
class MyAppbar extends StatelessWidget implements PreferredSize{
  const MyAppbar({ Key? key }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      color:Colors.red
    );
  }

  @override
  
  Widget get child => Text('');

  @override
  Size get preferredSize =>  Size(double.infinity,60);
}
Widget getHomeAppBar() {
  return ListTile(
    title: Text('Welcome',
        style: TextStyle(
            color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold)),
    subtitle: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text('Guest'),
    ),
    trailing: ClipOval(
      child: Container(
        color: Colors.red,
        height: 50,
        width: 50,
      ),
    ),
  );
}
