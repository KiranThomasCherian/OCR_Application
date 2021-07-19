import 'package:flutter/material.dart';
import 'package:flutter_mobile_vision/flutter_mobile_vision.dart';

class ScanPage extends StatefulWidget {
  const ScanPage({Key? key}) : super(key: key);

  @override
  _ScanPageState createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  @override
  void initState() {
    super.initState();
    FlutterMobileVision.start().then((x) => setState(() {}));
  }

  static int OCR_CAM = FlutterMobileVision.CAMERA_BACK;
  static String word = "TEXT";
  Future<Null> _read() async {
    List<OcrText> words = [];
    try {
      words = await FlutterMobileVision.read(
        camera: OCR_CAM,
        waitTap: true,
      );

      setState(() {
        word = words[0].value;
      });
    } on Exception {
      words.add(OcrText('Unable to recognize the word'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey.shade700,
      child: InkWell(
        onTap: () {
          _read();
          // Navigator.pushNamed(context, MyRoutes.scanpage);
          // setState(() {});
        },
        // hoverColor: Colors.orange,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.white),
          ),
          height: 40,
          width: 400,
          child: Center(
            child: Text(
              "Scan Using Camera",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
