import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_authentication_task/functions/firestore_service_user_data_image_storage.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class HomePage extends StatefulWidget {
  final User? user;

  const HomePage({Key? key, this.user}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirestoreService _firestoreService = FirestoreService();
  final ImagePicker _picker = ImagePicker();
  final storage = FirebaseStorage.instance;
  String? imageUrl;
  XFile? image;

  @override
  void initState() {
    super.initState();
    if (widget.user != null) {
      _firestoreService.getImageUrl(widget.user!.uid).then((value) {
        setState(() {
          imageUrl = value;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () async {
                image = await _picker.pickImage(source: ImageSource.gallery);
                setState(() async {
                  if (image != null) {
                    String? url = await _firestoreService.uploadImage(
                        image!.path, widget.user?.uid);

                    if (url != null) {
                      setState(() {
                        imageUrl = url;
                      });
                    }
                  }
                });
              },
              icon: const Icon(Icons.add_a_photo),
            ),
            Text(
              'Welcome ${widget.user?.uid ?? "Unknown"}',
              style: const TextStyle(fontSize: 20.0),
            ),
            const SizedBox(height: 20.0),
            if (imageUrl != null)
              Image.network(
                imageUrl!,
                width: 200.0,
                height: 200.0,
                fit: BoxFit.cover,
              ),
          ],
        ),
      ),
    );
  }
}


// IconButton(
//   onPressed: () async {
//     image = await _picker.pickImage(source: ImageSource.gallery);
//     setState(() async {
//       if (image != null) {
//         String? url = await _firestoreService.uploadImage(
//             image!.path, widget.user!.uid);
//
//         if (url != null) {
//           setState(() {
//             imageUrl = url;
//           });
//         }
//       }
//     });
//   },
//   icon: const Icon(Icons.add_a_photo),
// ),