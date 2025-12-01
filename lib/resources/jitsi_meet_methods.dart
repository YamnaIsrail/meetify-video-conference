import 'package:jitsi_meet_flutter_sdk/jitsi_meet_flutter_sdk.dart';

import 'auth_methods.dart';
import 'firestore_methods.dart';


class JitsiMeetMethods {
  final AuthMethods _authMethods = AuthMethods();
  final FirestoreMethods _firestoreMethods = FirestoreMethods();

  final jitsiMeet = JitsiMeet();

  Future<void> createMeeting({
    required String roomName,
    required bool isAudioMuted,
    required bool isVideoMuted,
    String username = '',
  }) async {
    try {
      String name = username.isEmpty
          ? _authMethods.user.displayName!
          : username;

      // Create a JitsiMeetUserInfo object
      var userInfo = JitsiMeetUserInfo(
        displayName: name,
        email: _authMethods.user.email,
        avatar: _authMethods.user.photoURL,
      );

      // Construct conference options
      var options = JitsiMeetConferenceOptions(
        room: roomName,
        serverURL: "https://meet.jit.si", // optional
        configOverrides: {
          "startWithAudioMuted": isAudioMuted,
          "startWithVideoMuted": isVideoMuted,
        },
        userInfo: userInfo,
      );

      // Save meeting history
      _firestoreMethods.addToMeetingHistory(roomName);

      // Join meeting
      await jitsiMeet.join(options);

    } catch (e) {
      print("Jitsi error: $e");
    }
  }
}
