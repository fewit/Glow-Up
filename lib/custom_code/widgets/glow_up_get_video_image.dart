// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:io';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';

class GlowUpGetVideoImage extends StatefulWidget {
  const GlowUpGetVideoImage({
    Key? key,
    this.width,
    this.height,
    required this.glowUpVideo,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String glowUpVideo;

  @override
  State<GlowUpGetVideoImage> createState() => _GlowUpGetVideoImageState();
}

class _GlowUpGetVideoImageState extends State<GlowUpGetVideoImage> {
  String? videoThumbnailPath;

  @override
  void initState() {
    super.initState();
    generateVideoThumbnail();
  }

  Future<void> generateVideoThumbnail() async {
    final cacheManager = DefaultCacheManager();
    final file = await cacheManager.getSingleFile(widget.glowUpVideo);
    final thumbnailFile = await FlutterImageCompress.compressAndGetFile(
      file.path,
      file.path + ".thumbnail",
      quality: 50,
    );

    setState(() {
      videoThumbnailPath = thumbnailFile?.path;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: videoThumbnailPath != null
          ? Image.file(
              File(videoThumbnailPath!),
              fit: BoxFit.cover,
            )
          : null,
    );
  }
}
