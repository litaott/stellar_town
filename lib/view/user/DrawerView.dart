// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// import '../../entity/user/User.dart';
//
// class DrawerView extends StatefulWidget {
//   const DrawerView({Key? key}) : super(key: key);
//
//   @override
//   DrawerViewState createState() => DrawerViewState();
// }
//
// class DrawerViewState extends State<DrawerView> {
//   final User user = User.currentUser;
//
//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       child: ListView(
//         padding: const EdgeInsets.only(top: 100.0, bottom: 100.0, left: 16.0, right: 16.0),
//         children: <Widget>[
//           ListTile(
//             contentPadding: EdgeInsets.zero,
//             visualDensity: const VisualDensity(horizontal: -4, vertical: 0), // 调整间距
//             leading: const Icon(Icons.edit), // 添加编辑资料的图标
//             title: const Text(
//               '编辑资料',
//               style: TextStyle(
//                 fontSize: 20.0,
//                 color: Colors.black87,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             onTap: () {
//               Navigator.pop(context);
//               _navigateToModifyProfile(context);
//             },
//           ),
//           ListTile(
//             contentPadding: EdgeInsets.zero,
//             visualDensity: const VisualDensity(horizontal: -4, vertical: 0), // 调整间距
//             leading: const Icon(Icons.settings), // 添加设置的图标
//             title: const Text(
//               '设置',
//               style: TextStyle(
//                 fontSize: 20.0,
//                 color: Colors.black87,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             onTap: () {
//               Navigator.pop(context);
//               _navigateToSettings(context);
//             },
//           ),
//         ],
//       ),
//     );
//   }
//
//   void _navigateToModifyProfile(BuildContext context) {
//     // TODO: Navigate to Modify Profile screen
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => EditPersonalInfoView(onUpdateUsername: (String ) {  },),
//       ),
//     );
//   }
//
//   void _navigateToSettings(BuildContext context) {
//     // TODO: Navigate to Settings screen
//   }
// }
