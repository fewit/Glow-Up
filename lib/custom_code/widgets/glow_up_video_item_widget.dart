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

import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
// Set your widget name, define your parameter, and then add the
// boilerplate code using the green button on the right!

class GlowUpVideoItemWidget extends StatefulWidget {
  // 传入视频Url
  const GlowUpVideoItemWidget({
    Key? key,
    this.width,
    this.height,
    required this.glowUpVideoUrl,
    required this.glowUpLoadingColor,
    required this.glowUpPauseBgColor,
    required this.glowUpPauseVideo,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String glowUpVideoUrl;
  final Color glowUpLoadingColor;
  final Color glowUpPauseBgColor;
  final bool glowUpPauseVideo;

  @override
  State<GlowUpVideoItemWidget> createState() => _GlowUpVideoItemWidgetState();
}

class _GlowUpVideoItemWidgetState extends State<GlowUpVideoItemWidget> {
  late VideoPlayerController glowUpVideoPlayerController;
  ChewieController? glowUpVideoChewie;
  late ValueNotifier<bool> glowUpPauseVideoNotifier;

  double progress = 0.0; // 视频播放进度
  bool glowUpVideoCache = false;
  bool glowUpVideoBuffer = false;
  bool previousValue = false;

  @override
  void initState() {
    super.initState();
    glowUpPauseVideoNotifier = ValueNotifier<bool>(widget.glowUpPauseVideo);
    // 初始化获取视频状态
    glowUpInitializeVideo();
  }

  void isPlaying() {
    if (glowUpVideoPlayerController.value.isPlaying) {
      setState(() {
        glowUpVideoPlayerController.pause();
      });
    } else {
      setState(() {
        glowUpVideoPlayerController.play();
      });
    }
  }

  // 判断缓存中是否存在该视频
  Future<bool> glowUpGetFile(String glowUpVideoPath) async {
    final cacheManager = DefaultCacheManager();
    final glowUpSetCache = await cacheManager.getFileFromCache(glowUpVideoPath);
    return glowUpSetCache != null;
  }

  // 将视频添加缓存中
  Future glowUpCacheVideo(String glowUpVideoPath) async {
    final glowUpVideo = DefaultCacheManager();
    final glowUpFile = await glowUpVideo.getSingleFile(glowUpVideoPath);
    return glowUpFile;
  }

  void glowUpInitializeVideo() async {
    // 判断视频缓存
    glowUpVideoCache = await glowUpGetFile(widget.glowUpVideoUrl);
    if (glowUpVideoCache) {
      final file = await glowUpCacheVideo(widget.glowUpVideoUrl);
      glowUpVideoPlayerController = VideoPlayerController.file(file);
    } else {
      glowUpVideoPlayerController =
          VideoPlayerController.network(widget.glowUpVideoUrl);
      glowUpCacheVideo(widget.glowUpVideoUrl);
    }

    // 初始化播放插件
    await glowUpVideoPlayerController.initialize();

    glowUpVideoPlayerController.addListener(() {
      if (glowUpVideoPlayerController.value.isBuffering) {
        glowUpVideoBuffer = true;
      } else {
        glowUpVideoBuffer = false;
      }
      if (mounted) {
        setState(() {
          progress = glowUpVideoPlayerController.value.position.inMilliseconds /
              glowUpVideoPlayerController
                  .value.duration.inMilliseconds; // 计算视频播放进度
        });
      }
    });

    // 封装视频播放功能
    glowUpVideoChewie = ChewieController(
      videoPlayerController: glowUpVideoPlayerController,
      autoPlay: true,
      looping: true,
      showControls: false,
      showControlsOnInitialize: false,
      allowFullScreen: false,
    );

    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return glowUpVideoChewie == null
        // 视频未加载完，显示loading效果
        ? Container(
            color: Colors.black,
            child: Center(
              child: CircularProgressIndicator(
                color: widget.glowUpLoadingColor,
              ),
            ),
          )
        // 视频加载完成显示视频播放器
        : ValueListenableBuilder<bool>(
            valueListenable: glowUpPauseVideoNotifier,
            builder: (context, value, child) {
              glowUpPauseVideoNotifier =
                  ValueNotifier<bool>(widget.glowUpPauseVideo);
              if (value != previousValue) {
                if (value) {
                  glowUpVideoPlayerController.pause();
                } else {
                  glowUpVideoPlayerController.play();
                }
                previousValue = value;
              }

              return GestureDetector(
                onTap: () {
                  isPlaying(); // 处理视频播放/暂停事件
                },
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.black,
                        border: Border.all(color: Colors.transparent),
                      ),
                      width: widget.width,
                      height: widget.height,
                      child: LayoutBuilder(
                        builder:
                            (BuildContext context, BoxConstraints constraints) {
                          return AspectRatio(
                            aspectRatio:
                                constraints.maxWidth / constraints.maxHeight,
                            child: Align(
                              alignment: Alignment.center,
                              child: Transform.scale(
                                scale: glowUpVideoPlayerController
                                        .value.aspectRatio /
                                    MediaQuery.of(context).size.aspectRatio,
                                child: Chewie(controller: glowUpVideoChewie!),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    if (!glowUpVideoPlayerController
                        .value.isPlaying) // 根据需要修改isPaused的值
                      Container(
                        color: widget.glowUpPauseBgColor,
                        width: double.infinity,
                        height: double.infinity,
                        child: Center(
                          child: Icon(
                            Icons.play_arrow,
                            size: 48,
                            color: Colors.white.withOpacity(0.6),
                          ),
                        ),
                      ),
                    Container(
                      color: Colors.transparent,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                    Positioned(
                      bottom: 70.0,
                      left: 20.0,
                      right: 20.0,
                      child: SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 0.0),
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 0.0),
                          trackHeight: 3.0,
                          trackShape: RectangularSliderTrackShape(), // 使用矩形轨道形状
                        ),
                        child: Slider(
                          value: progress,
                          min: 0.0,
                          max: 1.0,
                          onChanged: (newValue) {
                            setState(() {
                              progress = newValue;
                              // 计算视频播放位置
                              double newPosition = newValue *
                                  glowUpVideoPlayerController
                                      .value.duration.inMilliseconds
                                      .toDouble();
                              Duration newDuration =
                                  Duration(milliseconds: newPosition.toInt());
                              glowUpVideoPlayerController.seekTo(newDuration);
                            });
                          },
                          activeColor: Colors.white,
                          inactiveColor: Colors.white.withOpacity(0.4),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
  }

  // 视频释放
  @override
  void dispose() {
    glowUpVideoPlayerController.removeListener(() {});
    glowUpVideoPlayerController.dispose();
    glowUpVideoChewie?.dispose();
    super.dispose();
  }
}
