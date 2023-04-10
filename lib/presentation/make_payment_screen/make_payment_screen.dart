import 'package:digitalcardsgaammabytes/core/app_export.dart';
import 'package:digitalcardsgaammabytes/core/utils/validation_functions.dart';
import 'package:digitalcardsgaammabytes/widgets/app_bar/appbar_image.dart';
import 'package:digitalcardsgaammabytes/widgets/app_bar/custom_app_bar.dart';
import 'package:digitalcardsgaammabytes/widgets/custom_button.dart';
import 'package:digitalcardsgaammabytes/widgets/custom_text_form_field.dart';
import 'dart:typed_data';

import 'package:crop_your_image/crop_your_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:image_gallery_saver/image_gallery_saver.dart';

class MakePaymentScreen extends StatefulWidget {
  @override
  _CropSampleState createState() => _CropSampleState();
}

class _CropSampleState extends State<MakePaymentScreen> {
  static const _images = const [
    'assets/images/img_diwalithumbnail.png',
    'assets/images/img_businesscard1.png',
    'assets/images/img_businesscard1.png',
    'assets/images/img_businessvisiti.png',
  ];

  final _cropController = CropController();
  final _imageDataList = <Uint8List>[];

  var _loadingImage = false;
  var _currentImage = 0;
  set currentImage(int value) {
    setState(() {
      _currentImage = value;
    });
    _cropController.image = _imageDataList[_currentImage];
  }

  var _isSumbnail = false;
  var _isCropping = false;
  var _isCircleUi = false;
  Uint8List? _croppedData;
  var _statusText = '';

  @override
  void initState() {
    _loadAllImages();
    super.initState();
  }

  Future<void> _loadAllImages() async {
    setState(() {
      _loadingImage = true;
    });
    for (final assetName in _images) {
      _imageDataList.add(await _load(assetName));
    }
    setState(() {
      _loadingImage = false;
    });
  }

  Future<Uint8List> _load(String assetName) async {
    final assetData = await rootBundle.load(assetName);
    return assetData.buffer.asUint8List();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Center(
        child: Visibility(
          visible: !_loadingImage && !_isCropping,
          child: Column(
            children: [
              if (_imageDataList.length >= 4)
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      _buildSumbnail(_imageDataList[0]),
                      const SizedBox(width: 16),
                      _buildSumbnail(_imageDataList[1]),
                      const SizedBox(width: 16),
                      _buildSumbnail(_imageDataList[2]),
                      const SizedBox(width: 16),
                      _buildSumbnail(_imageDataList[3]),
                    ],
                  ),
                ),
              Expanded(
                child: Visibility(
                  visible: _croppedData == null,
                  child: Stack(
                    children: [
                      if (_imageDataList.isNotEmpty) ...[
                        Crop(
                          controller: _cropController,
                          image: _imageDataList[_currentImage],
                          onCropped: (croppedData) {
                            setState(() {
                              _croppedData = croppedData;
                              _isCropping = false;
                              saveimage();
                            });
                          },
                          withCircleUi: _isCircleUi,
                          onStatusChanged: (status) => setState(() {
                            _statusText = <CropStatus, String>{
                                  CropStatus.nothing: 'Crop has no image data',
                                  CropStatus.loading:
                                      'Crop is now loading given image',
                                  CropStatus.ready: 'Crop is now ready!',
                                  CropStatus.cropping:
                                      'Crop is now cropping image',
                                }[status] ??
                                '';
                          }),
                          initialSize: 0.5,
                          maskColor: _isSumbnail ? Colors.white : null,
                          cornerDotBuilder: (size, edgeAlignment) =>
                              const SizedBox.shrink(),
                          interactive: true,
                          fixArea: true,
                          radius: 20,
                          initialAreaBuilder: (rect) {
                            return Rect.fromLTRB(
                              rect.left + 24,
                              rect.top + 24,
                              rect.right - 24,
                              rect.bottom - 24,
                            );
                          },
                        ),
                        IgnorePointer(
                          child: Padding(
                            padding: const EdgeInsets.all(24),
                            child: Container(
                              decoration: BoxDecoration(
                                border:
                                    Border.all(width: 4, color: Colors.white),
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                        ),
                      ],
                      Positioned(
                        right: 16,
                        bottom: 16,
                        child: GestureDetector(
                          onTapDown: (_) => setState(() => _isSumbnail = true),
                          onTapUp: (_) => setState(() => _isSumbnail = false),
                          child: CircleAvatar(
                            backgroundColor:
                                _isSumbnail ? Colors.blue.shade50 : Colors.blue,
                            child: Center(
                              child: Icon(Icons.crop_free_rounded),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  replacement: Center(
                    child: _croppedData == null
                        ? SizedBox.shrink()
                        : Image.memory(_croppedData!),
                  ),
                ),
              ),
              if (_croppedData == null)
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                              child: Icon(
                                Icons.crop_7_5,
                                size: 20,
                                color: Colors.white,
                              ),
                              onTap: () {
                                _isCircleUi = false;
                                _cropController.aspectRatio = 16 / 4;
                              }),
                          GestureDetector(
                              child: Icon(
                                Icons.crop_16_9,
                                size: 20,
                                color: Colors.white,
                              ),
                              onTap: () {
                                _isCircleUi = false;
                                _cropController.aspectRatio = 16 / 9;
                              }),
                          GestureDetector(
                              child: Icon(
                                Icons.crop_5_4,
                                size: 20,
                                color: Colors.white,
                              ),
                              onTap: () {
                                _isCircleUi = false;
                                _cropController.aspectRatio = 4 / 3;
                              }),
                          GestureDetector(
                              child: Icon(
                                Icons.crop_square,
                                size: 20,
                                color: Colors.white,
                              ),
                              onTap: () {
                                _isCircleUi = false;
                                _cropController
                                  ..withCircleUi = false
                                  ..aspectRatio = 1;
                              }),
                          GestureDetector(
                              child: Icon(
                                Icons.circle,
                                size: 20,
                                color: Colors.white,
                              ),
                              onTap: () {
                                _isCircleUi = true;
                                _cropController.withCircleUi = true;
                              }),
                          // IconButton(
                          //   icon: Icon(Icons.crop_7_5),
                          //   onPressed: () {
                          //     _isCircleUi = false;
                          //     _cropController.aspectRatio = 16 / 4;
                          //   },
                          // ),
                          // IconButton(
                          //   icon: Icon(Icons.crop_16_9),
                          //   onPressed: () {
                          //     _isCircleUi = false;
                          //     _cropController.aspectRatio = 16 / 9;
                          //   },
                          // ),
                          // IconButton(
                          //   icon: Icon(Icons.crop_5_4),
                          //   onPressed: () {
                          //     _isCircleUi = false;
                          //     _cropController.aspectRatio = 4 / 3;
                          //   },
                          // ),
                          // IconButton(
                          //   icon: Icon(Icons.crop_square),
                          //   onPressed: () {
                          //     _isCircleUi = false;
                          //     _cropController
                          //       ..withCircleUi = false
                          //       ..aspectRatio = 1;
                          //   },
                          // ),
                          // IconButton(
                          //     icon: Icon(Icons.circle),
                          //     onPressed: () {
                          //       _isCircleUi = true;
                          //       _cropController.withCircleUi = true;
                          //     }),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Container(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _isCropping = true;
                            });
                            _isCircleUi
                                ? _cropController.cropCircle()
                                : _cropController.crop();
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            child: Text('CROP IT!'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
          replacement: const CircularProgressIndicator(),
        ),
      ),
    );
  }
void saveimage() async{
  final result = await ImageGallerySaver.saveImage(_croppedData ?? new Uint8List(0),
        quality: 100, name: "greeting2.jpg");
     if (result['isSuccess'] == true) {
        Get.snackbar(
            "Success", "Image downloaded successfully. Please check your gallery",
            backgroundColor: Color.fromARGB(255, 208, 245, 216),
            colorText: Colors.green[900],
            icon: Icon(
              Icons.done,
              color: Colors.green[900],
            ));

      }
}
  Expanded _buildSumbnail(Uint8List data) {
    final index = _imageDataList.indexOf(data);
    return Expanded(
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          border: index == _currentImage
              ? Border.all(
                  width: 8,
                  color: Colors.blue,
                )
              : null,
        ),
        child: Image.memory(
          data,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
