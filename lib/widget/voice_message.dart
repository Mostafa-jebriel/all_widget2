import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'dart:math';
import 'package:voice_message_package/voice_message_package.dart';

// ignore: must_be_immutable voice_message
class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) =>
      Scaffold(body: _messagesWithUserInfo(context));

  Widget _messagesWithUserInfo(BuildContext context) => SafeArea(
        child: Column(
          children: [
            _userInformation(context),
            const SizedBox(height: 8),
            _buildContainer(context),
          ],
        ),
      );

  Widget _userInformation(BuildContext context) => Padding(
        padding: EdgeInsets.symmetric(vertical: 3, horizontal: 8),
        child: Row(
          children: [
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.4),
                color: Colors.black.withOpacity(.07),
              ),
              padding: EdgeInsets.symmetric(horizontal: 3.8, vertical: 3.1),
              child: Icon(Icons.arrow_back_ios_outlined, size: 3.7),
            ),
            SizedBox(width: 5.5),
            //* avatar.
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: CircleAvatar(
                radius: 5,
                child: Image.network(
                  'https://media-exp1.licdn.com/dms/image/C4E03AQEL_Gzug73LaQ/profile-displayphoto-shrink_400_400/0/1645345884553?e=1651104000&v=beta&t=zTI_ZpRBstjAOoCtETIFCANGGjLIm7ueMW7MyDIBLlM',
                ),
              ),
            ),
            SizedBox(width: 3.7),
            //* name & activity.
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: .3),
                const Text('Mehran Shoghi', style: TextStyle(fontSize: 13.5)),
                SizedBox(height: 1.1),
                Row(
                  children: [
                    Widgets.circle(context, 1.7, Colors.greenAccent),
                    SizedBox(width: 1.75),
                    Text(
                      'Active Now',
                      style: TextStyle(
                          fontSize: 12.2, color: Colors.grey.shade600),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      );

  Widget _buildContainer(BuildContext context) => Expanded(
        child: Container(
          padding: const EdgeInsets.only(top: 18),
          decoration: BoxDecoration(
            boxShadow: S.innerBoxShadow(),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(S.radius38(context)),
              topRight: Radius.circular(S.radius38(context)),
            ),
          ),
          child: _messagesList(context),
        ),
      );

  Widget _messagesList(BuildContext context) => ListView.builder(
        itemCount: 7,
        itemBuilder: (BuildContext context, int index) => Bubble(
          index == 1 || index == 4 || index == 6, // for two chat side.
          index,
          voice: index == 4 || index == 5,
        ),
      );
}

/// document will be added
// ignore: must_be_immutable
class Bubble extends StatelessWidget {
  Bubble(this.me, this.index, {Key? key, this.voice = false}) : super(key: key);
  bool me, voice;
  int index;

  @override
  Widget build(BuildContext context) => Container(
        margin: EdgeInsets.symmetric(horizontal: 5.2, vertical: 2),
        child: Wrap(
          crossAxisAlignment: WrapCrossAlignment.end,
          textDirection: me ? TextDirection.rtl : TextDirection.ltr,
          children: [
            _bubble(context),
            SizedBox(width: 2),
            _seenWithTime(context),
          ],
        ),
      );

  Widget _bubble(BuildContext context) => voice
      ? VoiceMessage(
          audioSrc: 'https://sounds-mp3.com/mp3/0012660.mp3',
          me: index == 5 ? false : true,
        )
      : Container(
          constraints: BoxConstraints(maxWidth: 100 * .7),
          padding: EdgeInsets.symmetric(
            horizontal: 4,
            vertical: voice ? 2.8 : 2.5,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(6),
              bottomLeft: me ? Radius.circular(6) : Radius.circular(2),
              bottomRight: !me ? Radius.circular(6) : Radius.circular(1.2),
              topRight: Radius.circular(6),
            ),
            color: me ? AppColors.pink : Colors.white,
            boxShadow: me
                ? S.pinkShadow(shadow: AppColors.pink100)
                : [S.boxShadow(context, opacity: .05)],
          ),
          child: Text(
            me
                ? 'Hello, How are u?'
                : Random().nextBool()
                    ? 'It\'s Rainy!'
                    : Random().nextBool()
                        ? 'Ok! got it.'
                        : 'How was going bro ?',
            style: TextStyle(
                fontSize: 13.2, color: me ? Colors.white : Colors.black),
          ),
        );

  Widget _seenWithTime(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          if (me)
            Icon(
              Icons.done_all_outlined,
              color: AppColors.pink,
              size: 3.4,
            ),
          Text(
            '1:' '${index + 30}' ' PM',
            style: const TextStyle(fontSize: 11.8),
          ),
          SizedBox(height: .2)
        ],
      );
}

class Widgets {
  static circle(
    BuildContext context,
    double width,
    Color color, {
    Widget child = const SizedBox(),
  }) =>
      Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2000), color: color),
        child: child,
        width: width,
        height: width,
      );
}

class AppColors {
  //* Pink.
  static const Color pink = Color(0xFFFF4550);
  static Color pink100 = pink.withOpacity(.1);
  static Color pink300 = pink.withOpacity(.3);
  static Color pink400 = pink.withOpacity(.4);
}

class S {
  static innerBoxShadow() => [
        BoxShadow(color: Colors.black.withOpacity(.13)),
        BoxShadow(
          color: Colors.grey.shade200.withOpacity(1),
          spreadRadius: -16.0,
          offset: const Offset(0, 30),
          blurRadius: 40.0,
        ),
        BoxShadow(
          color: Colors.grey.shade200,
          spreadRadius: -16.0,
          offset: const Offset(-40, 0),
          blurRadius: 40.0,
        ),
        BoxShadow(
          color: Colors.grey.shade200,
          spreadRadius: -16.0,
          offset: const Offset(40, 0),
          blurRadius: 40.0,
        ),
      ];

  static radius38(BuildContext context) =>
      S.min(38, MediaQuery.of(context).size.width * .08);

  static boxShadow(
    BuildContext context, {
    double opacity = .2,
    Color color = Colors.black87,
  }) =>
      BoxShadow(
        color: color.withOpacity(opacity),
        offset: const Offset(0, 18),
        blurRadius: 31,
        spreadRadius: 4.7,
      );

  static pinkShadow({Color? shadow}) => [
        BoxShadow(
          color: shadow ?? AppColors.pink300,
          blurRadius: 56,
          spreadRadius: .4,
          offset: const Offset(0, 13),
        )
      ];

  static double min(double a, double b) => a > b ? b : a;

  static double w(Size? s) => s!.width;

  static double h(Size? s) => s!.height;
}
