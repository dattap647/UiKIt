import 'dart:math';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:rxdart/rxdart.dart';

import '../utils/MAAppColors.dart';
import '../utils/MAAppCommon.dart';
import '../utils/MAImages.dart';

class MAAudioPlayScreen extends StatefulWidget {
  final String? url;
  final String? audioName;
  final String? bgImage;

  MAAudioPlayScreen(
      {Key? key,
      this.url = MAMeditation_audio,
      this.bgImage = MAFocus_gif,
      this.audioName})
      : super(key: key);

  @override
  _MAAudioPlayScreenState createState() => _MAAudioPlayScreenState(url);
}

class _MAAudioPlayScreenState extends State<MAAudioPlayScreen>
    with WidgetsBindingObserver {
  String? url;
  bool favTapped = false;
  late AudioPlayer _audioPlayer;

  _MAAudioPlayScreenState(this.url);

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    _initAudioPlayer();
    WidgetsBinding.instance.addObserver(this);
  }

  _initAudioPlayer() async {
    await _audioPlayer.setAsset(url!);
    _audioPlayer.play();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topLeft,
        children: [
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(widget.bgImage!), fit: BoxFit.cover)),
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(widget.audioName!,
                    style: boldTextStyle(size: 20, color: Colors.white)),
                16.height,
                StreamBuilder<PlayerState>(
                  stream: _audioPlayer.playerStateStream,
                  builder: (context, snapshot) {
                    final playerState = snapshot.data;
                    final processingState = playerState?.processingState;
                    final playing = playerState?.playing;
                    if (processingState == ProcessingState.loading ||
                        processingState == ProcessingState.buffering) {
                      return Container(
                        child: CircularProgressIndicator(),
                      );
                    } else if (playing != true) {
                      return Container(
                        width: 50.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              begin: Alignment(6.123234262925839e-17, 1),
                              end: Alignment(-1, 6.123234262925839e-17),
                              colors: [
                                Color.fromRGBO(185, 205, 254, 1),
                                Color.fromRGBO(182, 178, 255, 1)
                              ],
                            )),
                        child: Center(
                          child: IconButton(
                            key: Key('play_button'),
                            onPressed: _audioPlayer.play,
                            iconSize: 32.0,
                            icon: Icon(Icons.play_arrow),
                            color: primaryColor,
                          ),
                        ),
                      );
                    } else if (processingState != ProcessingState.completed) {
                      return Container(
                        width: 50.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              begin: Alignment(6.123234262925839e-17, 1),
                              end: Alignment(-1, 6.123234262925839e-17),
                              colors: [
                                Color.fromRGBO(185, 205, 254, 1),
                                Color.fromRGBO(182, 178, 255, 1)
                              ],
                            )),
                        child: IconButton(
                          key: Key('pause_button'),
                          onPressed: _audioPlayer.pause,
                          iconSize: 32.0,
                          icon: Icon(Icons.pause),
                          color: primaryColor,
                        ),
                      );
                    } else {
                      return Container(
                        width: 60.0,
                        height: 60.0,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              begin: Alignment(6.123234262925839e-17, 1),
                              end: Alignment(-1, 6.123234262925839e-17),
                              colors: [
                                Color.fromRGBO(185, 205, 254, 1),
                                Color.fromRGBO(182, 178, 255, 1)
                              ],
                            )),
                        child: IconButton(
                          onPressed: () => _audioPlayer.seek(Duration.zero),
                          iconSize: 42.0,
                          icon: Icon(Icons.replay),
                          color: primaryColor,
                        ),
                      );
                    }
                  },
                ),
                16.height,
                StreamBuilder<Duration?>(
                  stream: _audioPlayer.durationStream,
                  builder: (context, snapshot) {
                    final duration = snapshot.data ?? Duration.zero;
                    return StreamBuilder<PositionData>(
                      stream:
                          Rx.combineLatest2<Duration, Duration, PositionData>(
                              _audioPlayer.positionStream,
                              _audioPlayer.bufferedPositionStream,
                              (position, bufferedPosition) =>
                                  PositionData(position, bufferedPosition)),
                      builder: (context, snapshot) {
                        final positionData = snapshot.data ??
                            PositionData(Duration.zero, Duration.zero);
                        var position = positionData.position;
                        if (position > duration) {
                          position = duration;
                        }
                        var bufferedPosition = positionData.bufferedPosition;
                        if (bufferedPosition > duration) {
                          bufferedPosition = duration;
                        }
                        return SeekBar(
                          duration: duration,
                          position: position,
                          bufferedPosition: bufferedPosition,
                          onChangeEnd: (newPosition) {
                            _audioPlayer.seek(newPosition);
                          },
                        );
                      },
                    );
                  },
                )
              ],
            ),
          ),
          SizedBox(
            height: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                backButton(context, enableBg: true),
                Row(
                  children: [
                    favIcon(isTapped: favTapped, enableBg: true),
                    8.width,
                    downloadIcon(enableBg: true)
                  ],
                )
              ],
            ),
          ).paddingOnly(top: context.statusBarHeight - 8, left: 16, right: 16),
        ],
      ),
    );
  }
}

class PositionData {
  final Duration position;
  final Duration bufferedPosition;

  PositionData(this.position, this.bufferedPosition);
}

class SeekBar extends StatefulWidget {
  final Duration duration;
  final Duration position;
  final Duration bufferedPosition;
  final ValueChanged<Duration>? onChanged;
  final ValueChanged<Duration>? onChangeEnd;

  SeekBar({
    required this.duration,
    required this.position,
    required this.bufferedPosition,
    this.onChanged,
    this.onChangeEnd,
  });

  @override
  _SeekBarState createState() => _SeekBarState();
}

class _SeekBarState extends State<SeekBar> {
  double? _dragValue;
  late SliderThemeData _sliderThemeData;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _sliderThemeData = SliderTheme.of(context).copyWith(
      trackHeight: 2.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          margin: EdgeInsets.only(right: 20),
          child: Text(
              '${widget.position.toString().split('.').first} / ${widget.duration.toString().split('.').first}',
              style: secondaryTextStyle()),
        ),
        SliderTheme(
          data: _sliderThemeData.copyWith(
              activeTrackColor: Colors.grey.shade500,
              inactiveTrackColor: Colors.grey[300]),
          child: Slider(
            min: 0.0,
            max: widget.duration.inMilliseconds.toDouble(),
            value: min(_dragValue ?? widget.position.inMilliseconds.toDouble(),
                widget.duration.inMilliseconds.toDouble()),
            onChanged: (value) {
              setState(() {
                _dragValue = value;
              });
              if (widget.onChanged != null) {
                widget.onChanged!(Duration(milliseconds: value.round()));
              }
            },
            onChangeEnd: (value) {
              if (widget.onChangeEnd != null) {
                widget.onChangeEnd!(Duration(milliseconds: value.round()));
              }
              _dragValue = null;
            },
          ),
        ),
      ],
    );
  }
}
