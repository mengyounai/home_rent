import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

const List<String> defautImages = [
  'http://image-jishanle2.test.upcdn.net//blog/www.acg.gy_13dLE4.jpg',
  'http://image-jishanle2.test.upcdn.net//blog/www.acg.gy_03Vzh4.jpg',
  'http://image-jishanle2.test.upcdn.net/acg.gy_01_2Zac4.jpg',
];

// 设置图片宽高
var imageWidth = 750.0;
var imageHeight = 424.0;
var imageWidgetHeightRatio = imageWidth / imageHeight; //宽高比

class CommonImagePicker extends StatefulWidget {
  final ValueChanged<List<File>> onChange;

  const CommonImagePicker({Key? key, required this.onChange}) : super(key: key);

  @override
  _CommonImagePickerState createState() => _CommonImagePickerState();
}

class _CommonImagePickerState extends State<CommonImagePicker> {
  List<File> files = [];
  final ImagePicker _picker = ImagePicker();
  _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (null == image) return;
    setState(() {
      final File file = File(image.path);
      files = files..add(file);
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = (MediaQuery.of(context).size.width - 10.0 * 4) / 3;
    var height = width / imageWidgetHeightRatio;
    Widget addButton = GestureDetector(
      onTap: () {
        _pickImage();
      },
      behavior: HitTestBehavior.translucent,
      child: Container(
        width: width,
        height: height,
        color: Colors.grey,
        child: Center(
          child: Text(
            '+',
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );

    Widget wrapper(File file) {
      // return Container();
      return Stack(
        children: [
          Image.file(
            file,
            width: width,
            height: height,
            fit: BoxFit.cover,
          ),
          Positioned(
              right: -20,
              top: -20,
              child: IconButton(
                icon: Icon(
                  Icons.delete_forever,
                  color: Colors.red,
                ),
                onPressed: () {
                  setState(() {
                    files = files..remove(file);
                  });
                  if (null != widget.onChange) {
                    widget.onChange(files);
                  }
                },
              )),
        ],
      );
      // return Semantics(
      //   child: ListView.builder(
      //     key: UniqueKey(),
      //     itemBuilder: (context, imageUri) {
      //       return Semantics(
      //         child: Image.file(File(files[imageUri].path)),
      //       );
      //     },
      //     itemCount: files.length,
      //   ),
      // );
      // return Image.file(
      //   imageUri as File,
      //   height: height,
      //   width: width,
      //   fit: BoxFit.cover,
      // );
    }

    // List<Widget> list = files.map((item) => wrapper(item)).toList()
    //   ..add(addButton);
    List<Widget> list = files.map((item) => wrapper(item)).toList()
      ..add(addButton);

    return Container(
      padding: EdgeInsets.all(10),
      child: Wrap(
        spacing: 10,
        runSpacing: 10,
        children: list,
      ),
    );
  }
}
