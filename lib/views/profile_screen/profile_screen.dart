import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/consts/lists.dart';
import 'package:emart_app/controllers/auth_controller.dart';
import 'package:emart_app/views/auth_screen/login_screen.dart';
import 'package:emart_app/views/profile_screen/components/details_card.dart';
import 'package:get/get.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return bgWidget(
      child: Scaffold(
        body:SafeArea(child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: const Align(
                    alignment: Alignment.topRight,
                    child: Icon(Icons.edit,color: whiteColor)).onTap(() {}),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    Image.asset(imgProfile2,width: 80,fit: BoxFit.cover).box.roundedFull.clip(Clip.antiAlias).make(),
                    10.heightBox,
                    Expanded(child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        "Dummy User".text.fontFamily(semibold).white.make(),
                        "admin@admin.com".text.white.make(),
                      ],
                    )),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(
                          color: whiteColor,
                        )
                      ),
                      onPressed: () async{
                        await Get.put(AuthController()).signoutMethod(context);
                        Get.offAll(()=>const LoginScreen());
                      },
                      child: "Logout".text.fontFamily(semibold).white.make(),
                    )
                  ],
                ),
              ),
              20.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  detailsCard(count: "00", title: "in your cart", width: context.screenWidth/3.4),
                  detailsCard(count: "32", title: "in your wishlist", width: context.screenWidth/3.4),
                  detailsCard(count: "675", title: "your orders", width: context.screenWidth/3.4),
                ],
              ),

              
              ListView.separated(
                  shrinkWrap: true,
                  separatorBuilder: (context, index){
                    return const Divider(
                      color:  lightGrey,
                    );
                  },
                  itemCount: profileButtonList.length,
                  itemBuilder:(BuildContext  context, int index){
                    return ListTile(
                      leading: Image.asset(profileButtonIcon[index],width: 22,),
                     title: profileButtonList[index].text.fontFamily(semibold).color(darkFontGrey).make(),
                    );

                  },
                  ).box.white.rounded.margin(const EdgeInsets.all(12)).padding(const EdgeInsets.symmetric(horizontal: 16)).shadowSm.make().box.color(redColor).make()


            ],
          ),
        ),
          
        ),
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
    home: ProfileScreen(),
  ));
}