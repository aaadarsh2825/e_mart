import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/consts/lists.dart';
import 'package:emart_app/views/category_screen/category_details.dart';
import 'package:emart_app/widget_common/bg_widgets.dart';
import 'package:get/get.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return bgWidget(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: categories.text.fontFamily(bold).white.make(),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(12),
            child: GridView.builder(
                shrinkWrap: true,
                itemCount: 9,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,mainAxisSpacing: 8,crossAxisSpacing: 8, mainAxisExtent: 200),
                itemBuilder: (context,index){
                  return Column(
                children: [
                  Image.asset(
                    categoryImages[index],
                    height: 120,
                    width: 200,
                    fit: BoxFit.cover,
                  ),
                  10.heightBox,
                  categoriesList[index].text.color(darkFontGrey).align(TextAlign.center).make()
                ],
              ).box.white.rounded.clip(Clip.antiAlias).outerShadowSm.make().onTap(() {
                Get.to(()=>CategoryDetails(title: categoriesList[index]));
              });
            }),
          ),
        ),
      )
    );
  }
}

Widget bgWidget({Widget? child}){
  const String imgBackground = "assets/icons/bg.png"; // Replace with your image asset

  return Container(
    decoration: const BoxDecoration(
      image: DecorationImage(
        image: AssetImage(imgBackground),
        fit: BoxFit.cover,
      ),
    ),
    child: child,
  );
}

void main() {
  runApp(const MaterialApp(
    home: CategoryScreen(),
  ));
}