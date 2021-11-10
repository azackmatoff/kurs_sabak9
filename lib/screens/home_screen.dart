import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:kurs_sabak9/screens/login_screen.dart';
import 'package:kurs_sabak9/screens/register_screen.dart';
import 'package:kurs_sabak9/widgets/custom_elevated_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  static const String id = 'home_screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation animation;

  @override
  void initState() {
    super.initState();

    animationController =
        AnimationController(duration: Duration(seconds: 2), vsync: this);

    animation = ColorTween(begin: Colors.blueGrey, end: Colors.white)
        .animate(animationController);

    animationController.forward();
    animationController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      appBar: AppBar(
        backgroundColor: animation.value,
        title: Text('Chat'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedTextKit(
              repeatForever: true,
              animatedTexts: [
                FlickerAnimatedText(
                  'FLASH',
                  textStyle: TextStyle(
                    fontSize: 32.0,
                  ),
                ),
                FlickerAnimatedText(
                  'CHAT',
                  textStyle: TextStyle(
                    fontSize: 32.0,
                  ),
                ),
              ],
              onTap: () {
                print("Tap Event");
              },
            ),
            const SizedBox(height: 25.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('assets/images/logo.png'),
                    height: 70.0,
                  ),
                ),
                AnimatedTextKit(
                  animatedTexts: [
                    WavyAnimatedText(
                      'Flash Chat',
                      textStyle: TextStyle(
                        fontSize: 32.0,
                      ),
                    ),
                  ],
                  isRepeatingAnimation: true,
                  onTap: () {
                    print("Tap Event");
                  },
                ),
              ],
            ),
            const SizedBox(height: 25.0),
            CustomElevatedButton(
              backgroundColor: Color(0xff41C3FF),
              buttonText: 'Login',
              screenRouteId: LoginScreen.id,
              horizontal: 130.0,
            ),
            const SizedBox(height: 25.0),
            CustomElevatedButton(
              backgroundColor: Color(0xff4489FF),
              buttonText: 'Register',
              screenRouteId: RegisterScreen.id,
            ),
          ],
        ),
      ),
    );
  }
}
