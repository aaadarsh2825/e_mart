import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/consts/lists.dart';
import 'package:emart_app/views/home_screen/components/featured_button.dart';
import 'package:emart_app/widget_common/home_buttons.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(12),
          color: lightGrey,
          width: context.screenWidth,
          height: context.screenHeight,
          child: SafeArea(
            child: Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 60,
                  color: lightGrey,
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      suffixIcon: Icon(Icons.search),
                      filled: true,
                      fillColor: whiteColor,
                      hintText: searchanything,
                      helperStyle: TextStyle(color: textfieldGrey),
                    ),
                  ),
                ),
                10.heightBox,

            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    VxSwiper.builder(
                        aspectRatio: 16/9,
                        autoPlay: true,
                        height: 100,
                        enlargeCenterPage: true,
                        itemCount: slidersList.length,
                        itemBuilder: (context, index) {
                          return Image.asset(slidersList[index],
                            fit: BoxFit.fitWidth ,
                          ).box.rounded.clip(Clip.antiAlias).margin(const EdgeInsets.symmetric(horizontal: 8)).make();

                        }),

                    15.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(2, (index) => homeButtons(
                        height: context.screenHeight * 0.12,
                        width: context.screenWidth / 2.5,
                        icon: index == 0? icTodaysDeal : icFlashDeal,
                        title:  index == 0 ? todayDeal : flashsale,
                      )),
                    ),
                    10.heightBox,
                    VxSwiper.builder(
                        aspectRatio: 25/20,
                        autoPlay: true,
                        height: 100,
                        enlargeCenterPage: true,
                        itemCount: secondSlidersList.length,
                        itemBuilder: (context, index) {
                          return Image.asset(secondSlidersList[index],
                            fit: BoxFit.fitWidth ,
                          ).box.rounded.clip(Clip.antiAlias).margin(const EdgeInsets.symmetric(horizontal: 8)).make();

                        }),

                    10.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(3, (index) => homeButtons(
                        height: context.screenHeight * 0.12,
                        width: context.screenWidth / 3.5,
                        icon: index== 0 ? icTopCategories : index == 1 ? icBrands : icTopSeller,
                        title: index == 0 ? topCategories : index == 1 ? brand : topSellers,
                      )),

                    ),

                    20.heightBox,
                    Align(
                        alignment: Alignment.centerLeft,
                        child: featuredCategories.text.color(darkFontGrey).size(18).fontFamily(semibold).make()),
                    20.heightBox,
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(3, (index) =>  Column(
                          children: [
                            featuredButton(icon: featuredImages1[index], title: featuredTitles1[index]),
                            10.heightBox,
                            featuredButton(icon: featuredImages2[index], title: featuredTitles2[index
                            ]),
                          ],
                        )).toList(),
                      ),
                    ),

                    20.heightBox,

                    Container(
                      padding: EdgeInsets.all(12),
                      width: double.infinity,
                      decoration: BoxDecoration(color: redColor),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          featuredProduct.text.white.fontFamily(bold).size(18).make(),
                          10.heightBox,
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: List.generate(6, (index) => Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    imgP1,
                                    width: 130,
                                    fit: BoxFit.cover,
                                  ),
                                  10.heightBox,
                                  "Laptop 4GB/64GB".text.fontFamily(semibold).make(),
                                  10.heightBox,
                                  "\$600".text.color(redColor).fontFamily(bold).size(16).make(),

                                ],
                              ).box
                                  .white
                                  .margin(const EdgeInsets.symmetric(horizontal: 4))
                                  .roundedSM
                                  .padding(const EdgeInsets.all(8))
                                  .make()),
                            ),
                          ),
                        ],
                      ),
                    ),
                    20.heightBox,
                    VxSwiper.builder(
                        aspectRatio: 16/9,
                        autoPlay: true,
                        height: 150,
                        enlargeCenterPage: true,
                        itemCount: secondSlidersList.length,
                        itemBuilder: (context, index) {
                          return Image.asset(secondSlidersList[index],
                            fit: BoxFit.fitWidth ,
                          ).box.rounded.clip(Clip.antiAlias).margin(const EdgeInsets.symmetric(horizontal: 8)).make();

                        }),
                    
                    20.heightBox,
                    GridView.builder(
                      physics: const NeverScrollableScrollPhysics() ,
                        shrinkWrap: true,
                        itemCount: 6,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisSpacing: 8, crossAxisSpacing: 8, mainAxisExtent: 300),
                        itemBuilder: (context,index){
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            imgP5,
                            height: 200,
                            width: 200,
                            fit: BoxFit.cover,
                          ),
                          const Spacer(),
                          "Laptop 4GB/64GB".text.fontFamily(semibold).make(),
                          10.heightBox,
                          "\$600".text.color(redColor).fontFamily(bold).size(16).make(),
                          10.heightBox,

                        ],
                      ).box
                          .white
                          .margin(const EdgeInsets.symmetric(horizontal: 4))
                          .roundedSM.padding(const EdgeInsets.all(12))
                          .make();

                    }),





                  ],
                ),
              ),
            )

           ],
          ),
          ),
        );
  }
}