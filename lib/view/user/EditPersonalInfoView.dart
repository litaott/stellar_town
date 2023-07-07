// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:stellar_town/entity/user/User.dart';
// import 'package:stellar_town/constant/ConstUrl.dart';
// import 'package:stellar_town/util/HttpUtil.dart';
//
// class EditPersonalInfoView extends StatefulWidget {
//   const EditPersonalInfoView({Key? key, required this.onUpdateUsername})
//       : super(key: key);
//
//   final Function(String) onUpdateUsername;
//
//   @override
//   EditPersonalInfoViewState createState() => EditPersonalInfoViewState();
// }
//
// class EditPersonalInfoViewState extends State<EditPersonalInfoView> {
//   final TextEditingController _usernameController = TextEditingController();
//   final TextEditingController _avatarController = TextEditingController();
//   final TextEditingController _signatureController = TextEditingController();
//
//   @override
//   void initState() {
//     _usernameController.text = User.currentUser.username;
//     _avatarController.text = User.currentUser.avatar;
//     _signatureController.text = User.currentUser.signature;
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     _usernameController.dispose();
//     _avatarController.dispose();
//     _signatureController.dispose();
//     super.dispose();
//   }
//
//   Future<void> updateUserInfo() async {
//     try {
//       // Construct the request URL
//       //Uri url = Uri.parse(ConstUrl.updateUserInfo);
//
//       // Prepare the request body
//       Map<String, dynamic> body = {
//         'username': _usernameController.text,
//         'avatar': _avatarController.text,
//         'signature': _signatureController.text,
//       };
//
//       // Send a POST request
//       Response response = await HttpUtil.putJson(ConstUrl.updateUserInfo, body);
//
//       // Check the response status code
//       if (response.statusCode == 200) {
//         // Request successful
//         updateSuccessDialog();
//       } else {
//         // Request failed
//         updateFailDialog('Failed to update personal information');
//       }
//     } catch (e) {
//       // Exception handling
//       updateFailDialog('Exception occurred: $e');
//     }
//   }
//
//   void updateSuccessDialog() {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: const Text('Update Successful'),
//           content: const Padding(
//             padding: EdgeInsets.all(8.0),
//             child: Text('Personal information has been successfully updated.'),
//           ),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.pop(context, true);
//               },
//               child: const Text('OK'),
//             ),
//           ],
//         );
//       },
//     ).then((value) {
//       if (value == true) {
//         User updatedUser = User(
//           username: _usernameController.text,
//           avatar: _avatarController.text,
//           signature: _signatureController.text,
//         );
//         User.currentUser.username = _usernameController.text;
//         User.currentUser.avatar = _avatarController.text;
//         User.currentUser.signature = _signatureController.text;
//         widget.onUpdateUsername(updatedUser
//             .username); // Call the callback function to update the username
//         Navigator.pop(context, updatedUser); // Return the updated user data
//       }
//     });
//   }
//
//   void updateFailDialog(String message) {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: const Text('Update Failed'),
//           content: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Text(message),
//           ),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//               child: const Text('OK'),
//             ),
//           ],
//         );
//       },
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Edit Personal Information'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           // Added to stretch the form fields horizontally
//           children: [
//             // const Text(
//             //   'Username',
//             //   style: TextStyle(
//             //     fontSize: 18,
//             //     fontWeight: FontWeight.bold,
//             //   ),
//             // ),
//             TextFormField(
//               controller: _usernameController,
//               decoration: const InputDecoration(
//                 labelText: 'Username',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             const SizedBox(height: 16.0),
//             // const Text(
//             //   'Avatar URL',
//             //   style: TextStyle(
//             //     fontSize: 18,
//             //     fontWeight: FontWeight.bold,
//             //   ),
//             // ),
//             TextFormField(
//               controller: _avatarController,
//               decoration: const InputDecoration(
//                 labelText: 'Avatar URL',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             const SizedBox(height: 16.0),
//             // const Text(
//             //   'Signature',
//             //   style: TextStyle(
//             //     fontSize: 18,
//             //     fontWeight: FontWeight.bold,
//             //   ),
//             // ),
//             TextFormField(
//               controller: _signatureController,
//               decoration: const InputDecoration(
//                 labelText: 'Signature',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             const SizedBox(height: 16.0),
//             ElevatedButton(
//               onPressed: () {
//                 updateUserInfo();
//               },
//               style: ElevatedButton.styleFrom(
//                 padding: const EdgeInsets.symmetric(vertical: 16.0),
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(8.0)),
//               ),
//               child: const Text(
//                 'Save',
//                 style: TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }





// import 'dart:io';
// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:stellar_town/entity/user/User.dart';
// import 'package:stellar_town/constant/ConstUrl.dart';
// import 'package:stellar_town/util/HttpUtil.dart';
//
// class EditPersonalInfoView extends StatefulWidget {
//   EditPersonalInfoView({Key? key, required this.onUpdateUsername})
//       : super(key: key);
//
//   final Function(String) onUpdateUsername;
//   User user = User.currentUser;
//
//   @override
//   EditPersonalInfoViewState createState() => EditPersonalInfoViewState();
// }
//
// class EditPersonalInfoViewState extends State<EditPersonalInfoView> {
//   final TextEditingController _usernameController = TextEditingController();
//   final TextEditingController _avatarController = TextEditingController();
//   final TextEditingController _signatureController = TextEditingController();
//
//   File? _selectedAvatar; // Added to store the selected avatar file
//
//   @override
//   void initState() {
//     _usernameController.text = User.currentUser.username;
//     _avatarController.text = User.currentUser.avatar;
//     _signatureController.text = User.currentUser.signature;
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     _usernameController.dispose();
//     _avatarController.dispose();
//     _signatureController.dispose();
//     super.dispose();
//   }
//
//   Future<void> updateUserInfo() async {
//     try {
//       // Construct the request URL
//       //Uri url = Uri.parse(ConstUrl.updateUserInfo);
//
//       // Prepare the request body
//       Map<String, dynamic> body = {
//         'username': _usernameController.text,
//         'avatar': _avatarController.text,
//         'signature': _signatureController.text,
//       };
//
//       // Send a POST request
//       Response response = await HttpUtil.putJson(ConstUrl.updateUserInfo, body);
//
//       // Check the response status code
//       if (response.statusCode == 200) {
//         // Request successful
//         updateSuccessDialog();
//       } else {
//         // Request failed
//         updateFailDialog('更新失败');
//       }
//     } catch (e) {
//       // Exception handling
//       updateFailDialog('Exception occurred: $e');
//     }
//   }
//
//   void updateSuccessDialog() {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: const Text('更新成功'),
//           content: const Padding(
//             padding: EdgeInsets.all(8.0),
//             child: Text('个人资料已保存'),
//           ),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.pop(context, true);
//               },
//               child: const Text('OK'),
//             ),
//           ],
//         );
//       },
//     ).then((value) {
//       if (value == true) {
//         User updatedUser = User(
//           username: _usernameController.text,
//           avatar: _avatarController.text,
//           signature: _signatureController.text,
//         );
//         User.currentUser.username = _usernameController.text;
//         User.currentUser.avatar = _avatarController.text;
//         User.currentUser.signature = _signatureController.text;
//         widget.onUpdateUsername(updatedUser
//             .username); // Call the callback function to update the username
//         Navigator.pop(context, updatedUser); // Return the updated user data
//       }
//     });
//   }
//
//   void updateFailDialog(String message) {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: const Text('出错了(°ー°〃)'),
//           content: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Text(message),
//           ),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//               child: const Text('OK'),
//             ),
//           ],
//         );
//       },
//     );
//   }
//
//   void _pickAvatarImage() async {
//     final pickedFile =
//         await ImagePicker().getImage(source: ImageSource.gallery);
//     if (pickedFile != null) {
//       setState(() {
//         _selectedAvatar = File(pickedFile.path);
//         _avatarController.text = pickedFile.path;
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('编辑个人资料'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           // Added to stretch the form fields horizontally
//           children: [
//             const SizedBox(height: 30),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 InkWell(
//                   onTap: _pickAvatarImage,
//                   child: CircleAvatar(
//                     radius: 40,
//                     foregroundImage: NetworkImage(widget.user.avatar),
//                     backgroundImage: const AssetImage('assets/image/planet.png'),
//                   ),
//                 ),
//
//               ],
//             ),
//             const SizedBox(height: 50),
//             TextFormField(
//               controller: _usernameController,
//               decoration: const InputDecoration(
//                 labelText: '昵称',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             // const SizedBox(height: 16.0),
//             // TextFormField(
//             //   controller: _avatarController,
//             //   decoration: const InputDecoration(
//             //     labelText: 'Avatar URL',
//             //     border: OutlineInputBorder(),
//             //   ),
//             // ),
//             const SizedBox(height: 25.0),
//             TextFormField(
//               controller: _signatureController,
//               decoration: const InputDecoration(
//                 labelText: '个性签名',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             const SizedBox(height: 25.0),
//             ElevatedButton(
//               onPressed: () {
//                 updateUserInfo();
//               },
//               style: ElevatedButton.styleFrom(
//                 padding: const EdgeInsets.symmetric(vertical: 16.0),
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(8.0)),
//               ),
//               child: const Text(
//                 '保存',
//                 style: TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }




//
// import 'dart:io';
// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
//
// // Import the necessary files and classes
// import 'package:stellar_town/entity/user/User.dart';
// import 'package:stellar_town/constant/ConstUrl.dart';
// import 'package:stellar_town/util/HttpUtil.dart';
//
// class EditPersonalInfoView extends StatefulWidget {
//   EditPersonalInfoView({Key? key, required this.onUpdateUsername})
//       : super(key: key);
//
//   final Function(String) onUpdateUsername;
//   User user = User.currentUser;
//
//   @override
//   EditPersonalInfoViewState createState() => EditPersonalInfoViewState();
// }
//
// class EditPersonalInfoViewState extends State<EditPersonalInfoView> {
//   late int _selectedGender = User.currentUser.gender; // 默认使用当前用户的性别值
//
//   final TextEditingController _usernameController = TextEditingController();
//   final TextEditingController _avatarController = TextEditingController();
//   final TextEditingController _signatureController = TextEditingController();
//   final TextEditingController _addressController = TextEditingController();
//   final TextEditingController _genderController = TextEditingController();
//   final TextEditingController _ageController = TextEditingController();
//
//   File? _selectedAvatar; // Added to store the selected avatar file
//
//   @override
//   void initState() {
//     _usernameController.text = User.currentUser.username;
//     _avatarController.text = User.currentUser.avatar;
//     _signatureController.text = User.currentUser.signature;
//     _addressController.text = User.currentUser.address;
//     _genderController.text = User.currentUser.gender.toString();
//     _ageController.text = User.currentUser.age.toString();
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     _usernameController.dispose();
//     _avatarController.dispose();
//     _signatureController.dispose();
//     _addressController.dispose();
//     _genderController.dispose();
//     _ageController.dispose();
//     super.dispose();
//   }
//
//   Future<void> updateUserInfo() async {
//     try {
//       // Prepare the request body
//       Map<String, dynamic> body = {
//         'username': _usernameController.text,
//         'avatar': _avatarController.text,
//         'signature': _signatureController.text,
//         'address': _addressController.text,
//         'gender': _selectedGender.toString(),
//         'age': int.tryParse(_ageController.text) ?? User.currentUser.age,
//       };
//
//       // Send a PUT request
//       Response response = await HttpUtil.putJson(ConstUrl.updateUserInfo, body);
//
//       // Check the response status code
//       if (response.statusCode == 200) {
//         // Request successful
//         updateSuccessDialog();
//       } else {
//         // Request failed
//         updateFailDialog('更新失败');
//       }
//     } catch (e) {
//       // Exception handling
//       updateFailDialog('Exception occurred: $e');
//     }
//   }
//
//   void updateSuccessDialog() {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: const Text('更新成功'),
//           content: const Padding(
//             padding: EdgeInsets.all(8.0),
//             child: Text('个人资料已保存'),
//           ),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.pop(context, true);
//               },
//               child: const Text('OK'),
//             ),
//           ],
//         );
//       },
//     ).then((value) {
//       if (value == true) {
//         User updatedUser = User(
//           username: _usernameController.text,
//           avatar: _avatarController.text,
//           signature: _signatureController.text,
//           address: _addressController.text,
//           gender: _selectedGender,
//           age: int.tryParse(_ageController.text) ?? User.currentUser.age,
//         );
//
//         User.currentUser.username = _usernameController.text;
//         User.currentUser.avatar = _avatarController.text;
//         User.currentUser.signature = _signatureController.text;
//         User.currentUser.address = _addressController.text;
//         User.currentUser.gender = _selectedGender;
//         User.currentUser.age = int.tryParse(_ageController.text) ?? User.currentUser.age;
//         widget.onUpdateUsername(updatedUser
//             .username); // Call the callback function to update the username
//         Navigator.pop(context, updatedUser); // Return the updated user data
//       }
//     });
//   }
//
//   void updateFailDialog(String message) {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: const Text('出错了(°ー°〃)'),
//           content: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Text(message),
//           ),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//               child: const Text('OK'),
//             ),
//           ],
//         );
//       },
//     );
//   }
//
//   void _pickAvatarImage() async {
//     final pickedFile =
//     await ImagePicker().getImage(source: ImageSource.gallery);
//     if (pickedFile != null) {
//       setState(() {
//         _selectedAvatar = File(pickedFile.path);
//         _avatarController.text = pickedFile.path;
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('编辑个人资料'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             const SizedBox(height: 30),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 InkWell(
//                   onTap: _pickAvatarImage,
//                   child: CircleAvatar(
//                     radius: 40,
//                     foregroundImage: NetworkImage(widget.user.avatar),
//                     backgroundImage: const AssetImage('assets/image/planet.png'),
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 50),
//             TextFormField(
//               controller: _usernameController,
//               decoration: const InputDecoration(
//                 labelText: '昵称',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             const SizedBox(height: 25.0),
//             TextFormField(
//               controller: _signatureController,
//               decoration: const InputDecoration(
//                 labelText: '个性签名',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             const SizedBox(height: 25.0),
//             TextFormField(
//               controller: _addressController,
//               decoration: const InputDecoration(
//                 labelText: '地址',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             const SizedBox(height: 25.0),
//             //
//             DropdownButtonFormField<int>(
//               value: _selectedGender,
//               onChanged: (value) {
//                 setState(() {
//                   _selectedGender = value!;
//                 });
//               },
//               decoration: const InputDecoration(
//                 labelText: '性别',
//                 border: OutlineInputBorder(),
//               ),
//               items: const [
//                 DropdownMenuItem<int>(
//                   value: 0,
//                   child: Text('男'),
//                 ),
//                 DropdownMenuItem<int>(
//                   value: 1,
//                   child: Text('女'),
//                 ),
//                 DropdownMenuItem<int>(
//                   value: 2,
//                   child: Text('保密'),
//                 ),
//               ],
//             ),
//
//             const SizedBox(height: 25.0),
//             TextFormField(
//               controller: _ageController,
//               keyboardType: TextInputType.number,
//               decoration: const InputDecoration(
//                 labelText: '年龄',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             const SizedBox(height: 25.0),
//             ElevatedButton(
//               onPressed: () {
//                 updateUserInfo();
//               },
//               style: ElevatedButton.styleFrom(
//                 padding: const EdgeInsets.symmetric(vertical: 16.0),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(8.0),
//                 ),
//               ),
//               child: const Text(
//                 '保存',
//                 style: TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

// Import the necessary files and classes
import 'package:stellar_town/entity/user/User.dart';
import 'package:stellar_town/constant/ConstUrl.dart';
import 'package:stellar_town/util/HttpUtil.dart';

class EditPersonalInfoView extends StatefulWidget {
  EditPersonalInfoView({Key? key, required this.onUpdateUsername})
      : super(key: key);

  final Function(String) onUpdateUsername;
  User user = User.currentUser;

  @override
  EditPersonalInfoViewState createState() => EditPersonalInfoViewState();
}

class EditPersonalInfoViewState extends State<EditPersonalInfoView> {
  late int _selectedGender = User.currentUser.gender; // 默认使用当前用户的性别值

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _avatarController = TextEditingController();
  final TextEditingController _signatureController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();

  File? _selectedAvatar; // Added to store the selected avatar file

  @override
  void initState() {
    _usernameController.text = User.currentUser.username;
    _avatarController.text = User.currentUser.avatar;
    _signatureController.text = User.currentUser.signature;
    _addressController.text = User.currentUser.address;
    _genderController.text = User.currentUser.gender.toString();
    _ageController.text = User.currentUser.age.toString();
    super.initState();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _avatarController.dispose();
    _signatureController.dispose();
    _addressController.dispose();
    _genderController.dispose();
    _ageController.dispose();
    super.dispose();
  }

  Future<void> updateUserInfo() async {
    try {
      // Prepare the request body
      // Map<String, dynamic> body = {
      //   'username': _usernameController.text,
      //   'avatar': _avatarController.text,
      //   'signature': _signatureController.text,
      //   'address': _addressController.text,
      //   'gender': _selectedGender.toString(),
      //   'age': int.tryParse(_ageController.text) ?? User.currentUser.age,
      // };

      Map bodyUsername = {
        'username': _usernameController.text,
      };

      Map bodyUserSignature = {
        'signature': _signatureController.text,
      };

      Map bodyUserAddress = {
        'address': _addressController.text,
      };

      Map bodyGender = {
        'gender': _selectedGender.toString(),
      };

      Map bodyAge = {
        'age': int.tryParse(_ageController.text) ?? User.currentUser.age,
      };

      Map bodyAvatar = {
        'avatar': _avatarController.text,
      };


      // Send a PUT request
      //Response response = await HttpUtil.putJson(ConstUrl.updateUserInfo, body);

      Response resUsername = await HttpUtil.putForm(ConstUrl.updateUsername, bodyUsername);
      Response resUserSignature = await HttpUtil.putForm(ConstUrl.updateUserSignature, bodyUserSignature);
      Response resUserAddress = await HttpUtil.putForm(ConstUrl.updateUserAddress, bodyUserAddress);
      Response resGender = await HttpUtil.putForm(ConstUrl.updateGender, bodyGender);
      Response resAge = await HttpUtil.putForm(ConstUrl.updateAge, bodyAge);
      Response resAvatar = await HttpUtil.postForm(ConstUrl.uploadAvatar, bodyAvatar);

      // Check the response status code
      //print(resUsername.data);
      if (resUsername.data['code'] ~/ 100 != 2
          || resUserSignature.data['code'] ~/ 100 != 2
          || resUserAddress.data['code'] ~/ 100 != 2
          || resGender.data['code'] ~/ 100 != 2
          || resAge.data['code'] ~/ 100 != 2
          || resAvatar.data['code'] ~/ 100 != 2) {
        //print(resUsername.data);
        // Request failed
        updateFailDialog('更新失败');
      } else {
        // Request successful
        updateSuccessDialog();
      }
    } catch (e) {
      // Exception handling
      updateFailDialog('Exception occurred: $e');
    }
  }

  void updateSuccessDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('更新成功'),
          content: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('个人资料已保存'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context, true);
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    ).then((value) {
      if (value == true) {
        User updatedUser = User(
          username: _usernameController.text,
          avatar: _avatarController.text,
          signature: _signatureController.text,
          address: _addressController.text,
          gender: _selectedGender,
          age: int.tryParse(_ageController.text) ?? User.currentUser.age,
        );

        User.currentUser.username = _usernameController.text;
        User.currentUser.avatar = _avatarController.text;
        User.currentUser.signature = _signatureController.text;
        User.currentUser.address = _addressController.text;
        User.currentUser.gender = _selectedGender;
        User.currentUser.age =
            int.tryParse(_ageController.text) ?? User.currentUser.age;
        widget.onUpdateUsername(updatedUser
            .username); // Call the callback function to update the username
        Navigator.pop(context, updatedUser); // Return the updated user data
      }
    });
  }

  void updateFailDialog(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('出错了(°ー°〃)'),
          content: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(message),
          ),
        );
      },
    );
  }

  void _pickAvatarImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _selectedAvatar = File(pickedFile.path);
        _avatarController.text = pickedFile.path;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('编辑个人资料'),
      ),
      body: SingleChildScrollView(
        // Wrap the Column with SingleChildScrollView
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: _pickAvatarImage,
                    child: CircleAvatar(
                      radius: 40,
                      foregroundImage: NetworkImage(widget.user.avatar),
                      backgroundImage:
                          const AssetImage('assets/image/planet.png'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50),
              TextFormField(
                keyboardType: TextInputType.text,
                controller: _usernameController,
                decoration: const InputDecoration(
                  labelText: '昵称',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 25.0),
              TextFormField(
                keyboardType: TextInputType.text,
                controller: _signatureController,
                decoration: const InputDecoration(
                  labelText: '个性签名',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 25.0),
              TextFormField(
                keyboardType: TextInputType.text,
                controller: _addressController,
                decoration: const InputDecoration(
                  labelText: '地址',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 25.0),
              DropdownButtonFormField<int>(
                value: _selectedGender,
                onChanged: (value) {
                  setState(() {
                    _selectedGender = value!;
                  });
                },
                decoration: const InputDecoration(
                  labelText: '性别',
                  border: OutlineInputBorder(),
                ),
                items: const [
                  DropdownMenuItem<int>(
                    value: 0,
                    child: Text('男'),
                  ),
                  DropdownMenuItem<int>(
                    value: 1,
                    child: Text('女'),
                  ),
                  DropdownMenuItem<int>(
                    value: 2,
                    child: Text('保密'),
                  ),
                ],
              ),
              const SizedBox(height: 25.0),
              TextFormField(
                controller: _ageController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: '年龄',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 25.0),
              ElevatedButton(
                onPressed: () {
                  updateUserInfo();
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: const Text(
                  '保存',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}