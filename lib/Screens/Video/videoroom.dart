import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:async';
import 'package:agora_rtc_engine/agora_rtc_engine.dart';
// import 'package:agora_rtc_engine/rtc_local_view.dart' as RtcLocalView;
// import 'package:agora_rtc_engine/rtc_remote_view.dart' as RtcRemoteView;

const appID = "5cd69aa46a47476b857c4a0daa8dd983";
const token =
    "007eJxTYDhtYcFjEXvqr32IxpadRtt/B2R8/iC9O+ZO46SsqYmmdUoKDKbJKWaWiYkmZokm5ibmZkkWpubJJokGKYmJFikplhbGLIUvkhsCGRlO9WQyMjJAIIjPzFCWXMzAAAAzKh9U";

class VideoRoom extends StatefulWidget {
  const VideoRoom({super.key});

  @override
  State<VideoRoom> createState() => _VideoRoomState();
}

class _VideoRoomState extends State<VideoRoom> {
  // final _users = <int>[];
  // final _infoStrings = <String>[];
  // bool muted = false;
  // bool viewPanel = false;
  // late RtcEngine _engine;

  // @override
  // void initState() {
  //   super.initState();
  //   initForAgora();
  // }

  // @override
  // void dispose() {
  //   _users.clear();
  //   _engine.leaveChannel();
  //   super.dispose();
  // }

  // Future<void> initForAgora() async {
  //   await [Permission.microphone, Permission.camera].request();

  //   if (appID.isEmpty) {
  //     setState(() {
  //       _infoStrings.add(
  //         'APP ID is missing, please Provide user APP ID',
  //       );
  //       _infoStrings.add(
  //         'Agora Engine is not Stated',
  //       );
  //     });
  //     return;
  //   }
  //   _engine = createAgoraRtcEngine();
  //   await _engine.initialize(const RtcEngineContext(
  //     appId: appID,
  //     channelProfile: ChannelProfileType.channelProfileLiveBroadcasting,
  //   ));
  //   await _engine.enableVideo();
  //   await _engine.startPreview();

  //   await _engine.setClientRole(role: ClientRoleType.clientRoleBroadcaster);
  //   _addAgoraEventHandler();
  //   VideoEncoderConfiguration configuration = const VideoEncoderConfiguration(
  //       dimensions: VideoDimensions(width: 1920, height: 1080));
  //   await _engine.setVideoEncoderConfiguration(configuration);
  //   await _engine.joinChannel(
  //     token: token,
  //     channelId: 'vcs',
  //     uid: 0,
  //     options: const ChannelMediaOptions(),
  //   );
  // }

  // _addAgoraEventHandler() {
  //   _engine.registerEventHandler(
  //     RtcEngineEventHandler(
  //       onJoinChannelSuccess: (RtcConnection connection, int elapsed) {
  //         debugPrint("local user ${connection.localUid} joined");
  //         setState(() {
  //           _infoStrings.add("local user ${connection.localUid} joined");
  //         });
  //       },
  //       onUserJoined: (RtcConnection connection, int remoteUid, int elapsed) {
  //         debugPrint("remote user $remoteUid joined");
  //         setState(() {
  //           _infoStrings.add("remote user $remoteUid joined");
  //           _users.add(remoteUid);
  //         });
  //       },
  //       onUserOffline: (RtcConnection connection, int remoteUid,
  //           UserOfflineReasonType reason) {
  //         debugPrint("remote user $remoteUid left channel");
  //         setState(() {
  //           _users.remove(remoteUid);
  //           _infoStrings.add("remote user $remoteUid left channel");
  //         });
  //       },
  //       onTokenPrivilegeWillExpire: (RtcConnection connection, String token) {
  //         debugPrint(
  //             '[onTokenPrivilegeWillExpire] connection: ${connection.toJson()}, token: $token');
  //         setState(() {
  //           _infoStrings.add(
  //               '[onTokenPrivilegeWillExpire] connection: ${connection.toJson()}, token: $token');
  //         });
  //       },
  //     ),
  //   );
  // }

  // Widget _viewRows() {
  //   final List<StatefulWidget> list = [];
  //   list.add(AgoraVideoView(
  //       controller: VideoViewController(
  //           rtcEngine: _engine, canvas: const VideoCanvas(uid: 0))));
  //   for (var uid in _users) {
  //     list.add(AgoraVideoView(
  //       controller: VideoViewController.remote(
  //         rtcEngine: _engine,
  //         canvas: VideoCanvas(uid: uid),
  //         connection: const RtcConnection(channelId: 'vcs'),
  //       ),
  //     ));
  //   }
  //   final views = list;
  //   return Column(
  //     children:
  //         List.generate(views.length, (index) => Expanded(child: views[index])),
  //   );
  // }

  // Widget _toolbar() {
  //   return Container(
  //     alignment: Alignment.bottomCenter,
  //     padding: const EdgeInsets.symmetric(vertical: 48),
  //     child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
  //       RawMaterialButton(
  //         onPressed: () {
  //           setState(() {
  //             muted = !muted;
  //           });
  //           _engine.muteLocalAudioStream(muted);
  //         },
  //         child: Icon(
  //           muted ? Icons.mic_off : Icons.mic,
  //           size: 20.0,
  //         ),
  //         shape: const CircleBorder(),
  //         elevation: 2.0,
  //         fillColor: muted ? Colors.blueAccent : Colors.white,
  //         padding: const EdgeInsets.all(12.0),
  //       ),
  //       RawMaterialButton(
  //         onPressed: () => Navigator.pop(context),
  //         child: Icon(
  //           Icons.call_end,
  //           size: 35,
  //           color: Colors.white,
  //         ),
  //         shape: const CircleBorder(),
  //         elevation: 2.0,
  //         fillColor: Colors.redAccent,
  //         padding: const EdgeInsets.all(15.0),
  //       ),
  //       RawMaterialButton(
  //         onPressed: () {
  //           _engine.switchCamera();
  //         },
  //         child: Icon(
  //           Icons.switch_camera,
  //           size: 20.0,
  //           color: Colors.blueAccent,
  //         ),
  //         shape: const CircleBorder(),
  //         elevation: 2.0,
  //         fillColor: Colors.white,
  //         padding: const EdgeInsets.all(12.0),
  //       ),
  //     ]),
  //   );
  // }

  // Widget _panel() {
  //   return Visibility(
  //     child: Container(
  //       padding: const EdgeInsets.symmetric(vertical: 48),
  //       alignment: Alignment.bottomCenter,
  //       child: FractionallySizedBox(
  //         heightFactor: 0.5,
  //         child: Container(
  //           padding: const EdgeInsets.symmetric(vertical: 48),
  //           child: ListView.builder(
  //             itemBuilder: (BuildContext context, int index) {
  //               if (_infoStrings.isEmpty) {
  //                 return const Text("No information");
  //               } else {
  //                 return Padding(
  //                   padding:
  //                       const EdgeInsets.symmetric(vertical: 3, horizontal: 10),
  //                   child: Row(mainAxisSize: MainAxisSize.min, children: [
  //                     Flexible(
  //                         child: Container(
  //                       padding: const EdgeInsets.symmetric(
  //                           vertical: 2, horizontal: 5),
  //                       decoration: BoxDecoration(
  //                           color: Colors.white,
  //                           borderRadius: BorderRadius.circular(5)),
  //                       child: Text(
  //                         _infoStrings[index],
  //                         style: const TextStyle(color: Colors.blueGrey),
  //                       ),
  //                     ))
  //                   ]),
  //                 );
  //               }
  //             },
  //             itemCount: _infoStrings.length,
  //           ),
  //         ),
  //       ),
  //     ),
  //     visible: viewPanel,
  //   );
  // }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: const Text('VCS Video Room'),
  //       centerTitle: true,
  //       actions: [
  //         IconButton(
  //           onPressed: () {
  //             setState(() {
  //               viewPanel = !viewPanel;
  //             });
  //           },
  //           icon: const Icon(Icons.info_outline),
  //         )
  //       ],
  //     ),
  //     backgroundColor: Colors.black,
  //     body: Center(
  //       child: Stack(
  //         children: [_viewRows(), _panel(), _toolbar()],
  //       ),
  //     ),
  //   );
  // }

  // Local Preview
  // Widget _renderLocalPreview() {
  //   return RtcLocalView.SurfaceView();
  // }

  // Remote Preview
  // Widget _renderRemoteVideo() {
  //   if (_remoteUid != null) {
  //     return RtcRemoteView.SurfaceView(uid: _remoteUid!);
  //   } else {
  //     return const Text(
  //       'Please Wait remote user to join',
  //       textAlign: TextAlign.center,
  //     );
  //   }
  // }

  int? _remoteUid;
  bool _localUserJoined = false;
  late RtcEngine _engine;

  @override
  void initState() {
    super.initState();
    initAgora();
  }

  Future<void> initAgora() async {
    // retrieve permissions
    await [Permission.microphone, Permission.camera].request();

    //create the engine
    _engine = createAgoraRtcEngine();
    await _engine.initialize(const RtcEngineContext(
      appId: appID,
      channelProfile: ChannelProfileType.channelProfileLiveBroadcasting,
    ));

    _engine.registerEventHandler(
      RtcEngineEventHandler(
        onJoinChannelSuccess: (RtcConnection connection, int elapsed) {
          debugPrint("local user ${connection.localUid} joined");
          setState(() {
            _localUserJoined = true;
          });
        },
        onUserJoined: (RtcConnection connection, int remoteUid, int elapsed) {
          debugPrint("remote user $remoteUid joined");
          setState(() {
            _remoteUid = remoteUid;
          });
        },
        onUserOffline: (RtcConnection connection, int remoteUid,
            UserOfflineReasonType reason) {
          debugPrint("remote user $remoteUid left channel");
          setState(() {
            _remoteUid = null;
          });
        },
        onTokenPrivilegeWillExpire: (RtcConnection connection, String token) {
          debugPrint(
              '[onTokenPrivilegeWillExpire] connection: ${connection.toJson()}, token: $token');
        },
      ),
    );

    await _engine.setClientRole(role: ClientRoleType.clientRoleBroadcaster);
    await _engine.enableVideo();
    await _engine.startPreview();

    await _engine.joinChannel(
      token: token,
      channelId: 'vcs',
      uid: 0,
      options: const ChannelMediaOptions(),
    );
  }

  // Create UI with local view and remote view
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('VCS Virtual Clinic Room'),
      ),
      body: Stack(
        children: [
          Center(
            child: _remoteVideo(),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: SizedBox(
              width: 100,
              height: 150,
              child: Center(
                child: _localUserJoined
                    ? AgoraVideoView(
                        controller: VideoViewController(
                          rtcEngine: _engine,
                          canvas: const VideoCanvas(uid: 0),
                        ),
                      )
                    : const CircularProgressIndicator(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Display remote user's video
  Widget _remoteVideo() {
    if (_remoteUid != null) {
      return AgoraVideoView(
        controller: VideoViewController.remote(
          rtcEngine: _engine,
          canvas: VideoCanvas(uid: _remoteUid),
          connection: const RtcConnection(channelId: 'vcs'),
        ),
      );
    } else {
      return const Text(
        'Please wait for remote user to join',
        textAlign: TextAlign.center,
      );
    }
  }
}
