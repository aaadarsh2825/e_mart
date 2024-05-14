import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/consts/firebase_consts.dart';
import 'package:emart_app/views/home_screen/home.dart';
import 'package:emart_app/widget_common/applogo_widget.dart';
import 'package:emart_app/widget_common/bg_widgets.dart';
import 'package:emart_app/widget_common/our_button.dart';
import 'package:get/get.dart';
import 'package:emart_app/controllers/auth_controller.dart';
import 'package:emart_app/widget_common/custom_textfield.dart';


class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
    bool? isCheck = false;
    var controller = Get.put(AuthController());

    var nameController = TextEditingController();
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var passwordRetypeController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return bgWidget(
        child:  Scaffold(
            resizeToAvoidBottomInset: false,
            body: Center(
              child: Column(
                children: [
                  (context.screenHeight * 0.1).heightBox,
                  applogoWidget(),
                  10.heightBox,
                  "Join the  $appname".text.fontFamily(bold).white.size(22).make(),
                  15.heightBox,

                  Column(
                    children: [
                      customTextField(hint: nameHint, title: name, controller: nameController, isPass: false),
                      customTextField(hint: emailHint, title: email, controller: emailController, isPass: false),
                      customTextField(hint: passwordHint, title: password, controller: passwordController,isPass: true),
                      customTextField(hint: passwordHint, title: reTypePassword, controller: passwordRetypeController,isPass: true),

                      10.heightBox,
                      Row(
                        children: [
                          Checkbox(
                              value: isCheck,
                              checkColor: redColor,
                              onChanged: (newValue){
                                setState(() {
                                  isCheck = newValue;
                                });

                              }
                          ),
                          5.widthBox,
                          Expanded(
                            child: RichText(text: const TextSpan(
                              children: [
                                TextSpan(text: "I agree to the ",style: TextStyle(
                                  fontFamily: regular,
                                  color: fontGrey,
                                )),
                                TextSpan(
                                    text: termAndCond,
                                    style: TextStyle(
                                        fontFamily: regular,
                                        color: redColor
                                    )
                                ),
                                TextSpan(
                                    text: " & ",
                                    style: TextStyle(
                                        fontFamily: regular,
                                        color: fontGrey
                                    )
                                ),
                                TextSpan(
                                    text: privacyPolicy,
                                    style: TextStyle(
                                        fontFamily: regular,
                                        color: redColor
                                    )
                                )
                              ]
                            )),
                          ),

                        ],
                      ),
                      5.heightBox,
                      ourButton(
                          color: isCheck == true? redColor : lightGrey,
                          title: signup,
                          textColor: whiteColor,
                          onPress: () async{
                            if(isCheck != false){
                              try{
                                await controller.signupMethod(context: context, email: emailController.text, password: passwordController.text).then((value){
                                  return controller.storeUserData(
                                    email:emailController.text,
                                    password:  passwordController.text,
                                    name: nameController.text,);
                                }).then((value) {
                                  Get.offAll(()=>const Home());
                                  VxToast.show(context, msg: loggedin);
                                });
                              } catch(e){
                                auth.signOut();
                                VxToast.show(context, msg: e.toString());
                              }
                            }
                          })
                          .box
                          .width(context.screenWidth - 50)
                          .make(),
                      10.heightBox,
                      RichText(text: const TextSpan(
                        children: [
                          TextSpan(
                            text: alreadyHaveAccount,
                            style: TextStyle(fontFamily: bold, color: fontGrey),
                          ),
                          TextSpan(
                            text: login,
                            style: TextStyle(fontFamily: bold, color: redColor),
                          )
                        ]
                      )
                      ).onTap(() {
                        Get.back();
                      })


                    ],
                  ).box.white.rounded.padding(const EdgeInsets.all(16)).width(context.screenWidth - 70).shadowSm.make(),
                ],
              ),
            )
        ));
  }
}
