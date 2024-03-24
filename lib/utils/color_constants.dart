import 'dart:ui';

class ColorsConstant{
  late Color backgroundColor;
  late Color white;
  late Color lightBlue;
  late Color tealAccent;
  late Color gray;
  late Color black;
  late Color yellow;
  late Color paleYellow;
  late Color darkGray;
  late Color darkBlue;
}

class Light implements ColorsConstant{
   @override
  Color backgroundColor = const Color(0xff193058);
   @override
  Color white = const Color(0xffFFFFFF);
   @override
  Color lightBlue = const Color(0xff3263B0);
   @override
  Color tealAccent = const Color(0xff3CFEDE);
   @override
  Color gray = const Color(0xffA0ACBD);
   @override
  Color black = const Color(0xff000000);
   @override
  Color yellow = const Color(0xffFFBF00);
   @override
  Color paleYellow = const Color(0xffF6A826);
   @override
  Color darkGray = const Color(0xff424242);
   @override
  Color darkBlue = const Color(0xff0D2444);
}

class Dark implements ColorsConstant{
  @override
  Color backgroundColor = const Color(0xff2c3236);
  @override
  Color white = const Color(0xffFFFFFF);
  @override
  Color lightBlue = const Color(0xff3263B0);
  @override
  Color tealAccent = const Color(0xff3CFEDE);
  @override
  Color gray = const Color(0xffA0ACBD);
  @override
  Color black = const Color(0xff000000);
  @override
  Color yellow = const Color(0xffFFBF00);
  @override
  Color paleYellow = const Color(0xffF6A826);
  @override
  Color darkGray = const Color(0xff424242);
  @override
  Color darkBlue = const Color(0xff0D2444);
}