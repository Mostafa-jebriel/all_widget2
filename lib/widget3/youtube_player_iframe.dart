import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

const List<String> _videoIds = [
  'tcodrIK2P_I',
  'H5v3kku4y6Q',
  'nPt8bK2gbaU',
  'K18cpp_-gP8',
  'iLnmTe5Q2Qw',
  '_WoCV4c6XOE',
  'KmzdUe0RSJo',
  '6jZDSSZZxjQ',
  'p2lYr3vM_1w',
  '7QUtEmBT_-w',
  '34_PXCzGw1M'
];

///
class YoutubeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Youtube Player IFrame Demo',
      theme: ThemeData.from(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: YoutubeAppDemo(),
    );
  }
}

///
class YoutubeAppDemo extends StatefulWidget {
  @override
  _YoutubeAppDemoState createState() => _YoutubeAppDemoState();
}

class _YoutubeAppDemoState extends State<YoutubeAppDemo> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      params: const YoutubePlayerParams(
        showControls: true,
        mute: false,
        showFullscreenButton: true,
        loop: false,
      ),
    );

    _controller.setFullScreenListener(
      (isFullScreen) {
        log('${isFullScreen ? 'Entered' : 'Exited'} Fullscreen.');
      },
    );

    _controller.loadPlaylist(
      list: _videoIds,
      listType: ListType.playlist,
      startSeconds: 136,
    );
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerScaffold(
      controller: _controller,
      builder: (context, player) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Youtube Player IFrame Demo'),
            actions: const [VideoPlaylistIconButton()],
          ),
          body: LayoutBuilder(
            builder: (context, constraints) {
              if (kIsWeb && constraints.maxWidth > 750) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Column(
                        children: [
                          player,
                          const VideoPositionIndicator(),
                        ],
                      ),
                    ),
                    const Expanded(
                      flex: 2,
                      child: SingleChildScrollView(
                        child: Controls(),
                      ),
                    ),
                  ],
                );
              }

              return ListView(
                children: [
                  player,
                  const VideoPositionIndicator(),
                  const Controls(),
                ],
              );
            },
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }
}

///
class Controls extends StatelessWidget {
  ///
  const Controls();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MetaDataSection(),
          _space,
          SourceInputSection(),
          _space,
          PlayPauseButtonBar(),
          _space,
          const VideoPositionSeeker(),
          _space,
          PlayerStateSection(),
        ],
      ),
    );
  }

  Widget get _space => const SizedBox(height: 10);
}

///
class VideoPlaylistIconButton extends StatelessWidget {
  ///
  const VideoPlaylistIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.ytController;

    return IconButton(
      onPressed: () async {
        controller.pauseVideo();
        await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const VideoListPage(),
          ),
        );
        controller.playVideo();
      },
      icon: const Icon(Icons.playlist_play_sharp),
    );
  }
}

///
class VideoPositionIndicator extends StatelessWidget {
  ///
  const VideoPositionIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.ytController;

    return StreamBuilder<YoutubeVideoState>(
      stream: controller.videoStateStream,
      initialData: const YoutubeVideoState(),
      builder: (context, snapshot) {
        final position = snapshot.data?.position.inMilliseconds ?? 0;
        final duration = controller.metadata.duration.inMilliseconds;

        return LinearProgressIndicator(
          value: duration == 0 ? 0 : position / duration,
          minHeight: 1,
        );
      },
    );
  }
}

///
class VideoPositionSeeker extends StatelessWidget {
  ///
  const VideoPositionSeeker({super.key});

  @override
  Widget build(BuildContext context) {
    var value = 0.0;

    return Row(
      children: [
        const Text(
          'Seek',
          style: TextStyle(fontWeight: FontWeight.w300),
        ),
        const SizedBox(width: 14),
        Expanded(
          child: StreamBuilder<YoutubeVideoState>(
            stream: context.ytController.videoStateStream,
            initialData: const YoutubeVideoState(),
            builder: (context, snapshot) {
              final position = snapshot.data?.position.inSeconds ?? 0;
              final duration = context.ytController.metadata.duration.inSeconds;

              value = position == 0 || duration == 0 ? 0 : position / duration;

              return StatefulBuilder(
                builder: (context, setState) {
                  return Slider(
                    value: value,
                    onChanged: (positionFraction) {
                      value = positionFraction;
                      setState(() {});

                      context.ytController.seekTo(
                        seconds: (value * duration).toDouble(),
                        allowSeekAhead: true,
                      );
                    },
                    min: 0,
                    max: 1,
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}

///
class MetaDataSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return YoutubeValueBuilder(
      buildWhen: (o, n) {
        return o.metaData != n.metaData ||
            o.playbackQuality != n.playbackQuality;
      },
      builder: (context, value) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _Text('Title', value.metaData.title),
            const SizedBox(height: 10),
            _Text('Channel', value.metaData.author),
            const SizedBox(height: 10),
            _Text(
              'Playback Quality',
              value.playbackQuality ?? '',
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                _Text('Video Id', value.metaData.videoId),
                const Spacer(),
                const _Text(
                  'Speed',
                  '',
                ),
                YoutubeValueBuilder(
                  builder: (context, value) {
                    return DropdownButton(
                      value: value.playbackRate,
                      isDense: true,
                      underline: const SizedBox(),
                      items: PlaybackRate.all
                          .map(
                            (rate) => DropdownMenuItem(
                              child: Text(
                                '${rate}x',
                                style: const TextStyle(
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              value: rate,
                            ),
                          )
                          .toList(),
                      onChanged: (double? newValue) {
                        if (newValue != null) {
                          context.ytController.setPlaybackRate(newValue);
                        }
                      },
                    );
                  },
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}

class _Text extends StatelessWidget {
  final String title;
  final String value;

  const _Text(this.title, this.value);

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: '$title : ',
        style: Theme.of(context).textTheme.labelLarge,
        children: [
          TextSpan(
            text: value,
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .copyWith(fontWeight: FontWeight.w300),
          ),
        ],
      ),
    );
  }
}

const List<String> _videoIds2 = [
  'dHuYBB05bYU',
  'RpoFTgWRfJ4',
  '82u-4xcsyJU',
];

///
class VideoListPage extends StatefulWidget {
  ///
  const VideoListPage({super.key});

  @override
  State<VideoListPage> createState() => _VideoListPageState();
}

class _VideoListPageState extends State<VideoListPage> {
  late final List<YoutubePlayerController> _controllers;

  @override
  void initState() {
    super.initState();

    _controllers = List.generate(
      _videoIds2.length,
      (index) => YoutubePlayerController.fromVideoId(
        videoId: _videoIds2[index],
        autoPlay: false,
        params: const YoutubePlayerParams(showFullscreenButton: true),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Video List Demo'),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(8),
        itemCount: _controllers.length,
        itemBuilder: (context, index) {
          final controller = _controllers[index];

          return Card(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: YoutubePlayer(
                key: ObjectKey(controller),
                aspectRatio: 16 / 9,
                enableFullScreenOnVerticalDrag: false,
                controller: controller
                  ..setFullScreenListener(
                    (_) async {
                      final videoData = await controller.videoData;
                      final startSeconds = await controller.currentTime;

                      final currentTime = await FullscreenYoutubePlayer.launch(
                        context,
                        videoId: videoData.videoId,
                        startSeconds: startSeconds,
                      );

                      if (currentTime != null) {
                        controller.seekTo(seconds: currentTime);
                      }
                    },
                  ),
              ),
            ),
          );
        },
        separatorBuilder: (context, _) => const SizedBox(height: 16),
      ),
    );
  }

  @override
  void dispose() {
    for (final controller in _controllers) {
      controller.close();
    }

    super.dispose();
  }
}

class PlayPauseButtonBar extends StatelessWidget {
  final ValueNotifier<bool> _isMuted = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
          icon: const Icon(Icons.skip_previous),
          onPressed: context.ytController.previousVideo,
        ),
        YoutubeValueBuilder(
          builder: (context, value) {
            return IconButton(
              icon: Icon(
                value.playerState == PlayerState.playing
                    ? Icons.pause
                    : Icons.play_arrow,
              ),
              onPressed: () {
                value.playerState == PlayerState.playing
                    ? context.ytController.pauseVideo()
                    : context.ytController.playVideo();
              },
            );
          },
        ),
        ValueListenableBuilder<bool>(
          valueListenable: _isMuted,
          builder: (context, isMuted, _) {
            return IconButton(
              icon: Icon(isMuted ? Icons.volume_off : Icons.volume_up),
              onPressed: () {
                _isMuted.value = !isMuted;
                isMuted
                    ? context.ytController.unMute()
                    : context.ytController.mute();
              },
            );
          },
        ),
        IconButton(
          icon: const Icon(Icons.skip_next),
          onPressed: context.ytController.nextVideo,
        ),
      ],
    );
  }
}

class PlayerStateSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return YoutubeValueBuilder(
      builder: (context, value) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 800),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: _getStateColor(value.playerState),
          ),
          width: double.infinity,
          padding: const EdgeInsets.all(8.0),
          child: Text(
            value.playerState.toString(),
            style: const TextStyle(
              fontWeight: FontWeight.w300,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        );
      },
    );
  }

  Color _getStateColor(PlayerState state) {
    switch (state) {
      case PlayerState.unknown:
        return Colors.grey[700]!;
      case PlayerState.unStarted:
        return Colors.pink;
      case PlayerState.ended:
        return Colors.red;
      case PlayerState.playing:
        return Colors.blueAccent;
      case PlayerState.paused:
        return Colors.orange;
      case PlayerState.buffering:
        return Colors.yellow;
      case PlayerState.cued:
        return Colors.blue[900]!;
      default:
        return Colors.blue;
    }
  }
}

class SourceInputSection extends StatefulWidget {
  @override
  _SourceInputSectionState createState() => _SourceInputSectionState();
}

class _SourceInputSectionState extends State<SourceInputSection> {
  late TextEditingController _textController;
  ListType? _playlistType;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _PlaylistTypeDropDown(
          onChanged: (type) {
            _playlistType = type;
            setState(() {});
          },
        ),
        const SizedBox(height: 10),
        AnimatedSize(
          duration: const Duration(milliseconds: 300),
          child: TextField(
            controller: _textController,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: _hint,
              helperText: _helperText,
              fillColor: Theme.of(context).colorScheme.surfaceVariant,
              filled: true,
              hintStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                    fontWeight: FontWeight.w300,
                  ),
              suffixIcon: IconButton(
                icon: const Icon(Icons.clear),
                onPressed: () => _textController.clear(),
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          childAspectRatio: 4,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          children: [
            _Button(
              action: 'Load',
              onTap: () {
                context.ytController.loadVideoById(
                  videoId: _cleanId(_textController.text) ?? '',
                );
              },
            ),
            _Button(
              action: 'Cue',
              onTap: () {
                context.ytController.cueVideoById(
                  videoId: _cleanId(_textController.text) ?? '',
                );
              },
            ),
            _Button(
              action: 'Load Playlist',
              onTap: _playlistType == null
                  ? null
                  : () {
                      context.ytController.loadPlaylist(
                        list: [_textController.text],
                        listType: _playlistType!,
                      );
                    },
            ),
            _Button(
              action: 'Cue Playlist',
              onTap: _playlistType == null
                  ? null
                  : () {
                      context.ytController.cuePlaylist(
                        list: [_textController.text],
                        listType: _playlistType!,
                      );
                    },
            ),
          ],
        ),
      ],
    );
  }

  String? get _helperText {
    switch (_playlistType) {
      case ListType.playlist:
        return '"PLj0L3ZL0ijTdhFSueRKK-mLFAtDuvzdje", ...';
      case ListType.userUploads:
        return '"pewdiepie", "tseries"';
      default:
        return null;
    }
  }

  String get _hint {
    switch (_playlistType) {
      case ListType.playlist:
        return 'Enter playlist id';
      case ListType.userUploads:
        return 'Enter channel name';
      default:
        return r'Enter youtube <video id> or <link>';
    }
  }

  String? _cleanId(String source) {
    if (source.startsWith('http://') || source.startsWith('https://')) {
      return YoutubePlayerController.convertUrlToId(source);
    } else if (source.length != 11) {
      _showSnackBar('Invalid Source');
    }
    return source;
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          textAlign: TextAlign.center,
          style: const TextStyle(fontWeight: FontWeight.w300, fontSize: 16),
        ),
        behavior: SnackBarBehavior.floating,
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }
}

class _PlaylistTypeDropDown extends StatefulWidget {
  const _PlaylistTypeDropDown({
    Key? key,
    required this.onChanged,
  }) : super(key: key);

  final ValueChanged<ListType?> onChanged;

  @override
  _PlaylistTypeDropDownState createState() => _PlaylistTypeDropDownState();
}

class _PlaylistTypeDropDownState extends State<_PlaylistTypeDropDown> {
  ListType? _playlistType;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<ListType>(
      decoration: InputDecoration(
        border: InputBorder.none,
        fillColor: Theme.of(context).colorScheme.surfaceVariant,
        filled: true,
      ),
      isExpanded: true,
      value: _playlistType,
      items: [
        DropdownMenuItem(
          child: Text(
            'Select playlist type',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                  fontWeight: FontWeight.w300,
                ),
          ),
        ),
        ...ListType.values.map(
          (type) => DropdownMenuItem(child: Text(type.value), value: type),
        ),
      ],
      onChanged: (value) {
        _playlistType = value;
        setState(() {});
        widget.onChanged(value);
      },
    );
  }
}

class _Button extends StatelessWidget {
  final VoidCallback? onTap;
  final String action;

  const _Button({
    Key? key,
    required this.onTap,
    required this.action,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap == null
          ? null
          : () {
              onTap?.call();
              FocusScope.of(context).unfocus();
            },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Text(action),
      ),
    );
  }
}
