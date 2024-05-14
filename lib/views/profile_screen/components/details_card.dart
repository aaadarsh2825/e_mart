import 'package:emart_app/consts/consts.dart';

Widget detailsCard({width, String? count , String? title}){
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      count!.text.color(darkFontGrey).size(16).fontFamily(bold).make(),
      5.heightBox,
      title!.text.color(darkFontGrey).make(),
    ],
  ).box.white.rounded.height(80).width(width).padding(const EdgeInsets.all(4)).make();
}