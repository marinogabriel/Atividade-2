import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/firebase_storage.dart';

class SwipeImageGallery extends StatefulWidget {
  const SwipeImageGallery({Key? key}) : super(key: key);

  @override
  _SwipeImageGalleryState createState() => _SwipeImageGalleryState();
}

class _SwipeImageGalleryState extends State<SwipeImageGallery> {
  List<String> imagePathList = [];
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _fetchAvatarImages();
  }

  Future<void> _fetchAvatarImages() async {
    try {
      // Call the fetchAvatarImages function and await the result
      List<String>? result = await StorageServer.helper.fetchAvatarImages();

      // Update the imagePathList if the result is not null
      if (result != null) {
        setState(() {
          imagePathList = result;
        });
      }
      print(result);
    } catch (e) {
      // Handle any errors
      print("Error fetching avatar images: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onPanUpdate: (details) {
          // Swiping in right direction.
          if (details.delta.dx < 0) {
            setState(() {
              if (currentIndex + 1 < imagePathList.length) currentIndex++;
            });
          }

          // Swiping in left direction.
          if (details.delta.dx > 0) {
            setState(() {
              if (currentIndex > 0) currentIndex--;
            });
          }
        },
        child: ConstrainedBox(
          constraints: const BoxConstraints.expand(),
          child: Card(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  alignment: Alignment.bottomCenter,
                  image: NetworkImage(imagePathList.isNotEmpty
                      ? imagePathList[currentIndex]
                      : 'https://t3.ftcdn.net/jpg/05/16/27/58/360_F_516275801_f3Fsp17x6HQK0xQgDQEELoTuERO4SsWV.jpg'), // use NetworkImage if it's a network image
                  fit: BoxFit.scaleDown,
                ),
              ),
              child: Container(
                padding: const EdgeInsets.all(5),
                child: Column(
                  children: [
                    // Add your additional widgets here
                    Text("ID: $currentIndex"),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
