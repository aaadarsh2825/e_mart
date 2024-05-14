import 'package:emart_app/consts/consts.dart';

Widget bgWidget({Widget? child}){
  return Container(
    decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(
                imgBackground
            )
        )
    ),
    child: child,
  );
}