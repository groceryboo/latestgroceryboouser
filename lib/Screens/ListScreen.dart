import 'package:flutter/material.dart';
import 'package:groceryboouser/OtherProfileView.dart';
import 'package:groceryboouser/Screens/Authentication/SignIn/view/signinview.dart';
import 'package:groceryboouser/Screens/Authentication/SignUp/view/SignupBasicInfoView.dart';
import 'package:groceryboouser/Screens/Authentication/SignUp/view/SignupDetails.dart';
import 'package:groceryboouser/Screens/Authentication/SignUp/view/emailverificationview.dart';
import 'package:groceryboouser/Screens/Authentication/SignUp/view/phoneverificationview.dart';
import 'package:groceryboouser/Screens/Categoryscreen/view/AllProducts.dart';

import 'package:groceryboouser/Screens/OrderDetails/view/OrderDetail.dart';
import 'package:groceryboouser/Screens/OrderHistory/view/OrderHistoryTab.dart';

import 'package:groceryboouser/Screens/Location/view/saveAddressView.dart';
import 'package:groceryboouser/Screens/PaymentFlow/Wallet/view/WalletDashboard.dart';

import 'package:groceryboouser/Screens/ProfileInfo/view/ChangePasswordView.dart';

import 'package:groceryboouser/Screens/Dashboard/view/BottomNavigation.dart';
import 'package:groceryboouser/Screens/Explore/view/Explore.dart';
import 'package:groceryboouser/Screens/Location/view/saveAddressView.dart';
import 'package:groceryboouser/Screens/MyBasketScreen/view/MyBasket.dart';
import 'package:groceryboouser/Screens/MyPages.dart';
import 'package:groceryboouser/Screens/OrderHistory/view/OrderHistoryTab.dart';
// import 'package:groceryboouser/Screens/UsernamePswdProfile/view/AddProfilePhotoView.dart';
// import 'package:groceryboouser/Screens/UsernamePswdProfile/view/PasswordView.dart';
// import 'package:2tgroceryboouser/Screens/UsernamePswdProfile/view/PermissionView.dart';
// import 'package:groceryboouser/Screens/UsernamePswdProfile/view/UserNameView.dart';
import 'package:groceryboouser/Screens/Pinned/view/SetPinnedBasket.dart';
// import 'package:groceryboouser/Screens/PinnedDetails.dart';
import 'package:groceryboouser/Screens/ProductDetailPage.dart';
import 'package:groceryboouser/Screens/ProfileInfo/view/ChangePasswordView.dart';
import 'package:groceryboouser/Screens/ProfileInfo/view/EditProfileView.dart';
import 'package:groceryboouser/Screens/ProfileInfo/view/MyProfileView.dart';
import 'package:groceryboouser/Screens/RepinnedBy/view/RepinnedBy.dart';
import 'package:groceryboouser/Screens/Search/view/search.dart';
import 'package:groceryboouser/Screens/TotalPinPurchased/view/totalPinPurchased.dart';
// import 'package:groceryboouser/Screens/UsernamePswdProfile/view/AddProfilePhotoView.dart';
// import 'package:groceryboouser/Screens/UsernamePswdProfile/view/PasswordView.dart';
// import 'package:2tgroceryboouser/Screens/UsernamePswdProfile/view/PermissionView.dart';
// import 'package:groceryboouser/Screens/UsernamePswdProfile/view/UserNameView.dart';

import 'package:groceryboouser/Screens/TrxnDetailTopupDone.dart';
import 'package:groceryboouser/Screens/TrxnDetailTopupFailed.dart';
import 'package:groceryboouser/Screens/TrxnPinCommisionDetail.dart';
// import 'package:groceryboouser/Screens/Wallet/WalletDashboard.dart';
import 'package:groceryboouser/TestScreen.dart';
import 'package:groceryboouser/Utilities/Constant.dart';
import 'package:groceryboouser/Welcome.dart';

import 'Authentication/UsernamePswdProfile/view/AddProfilePhotoView.dart';
import 'Authentication/UsernamePswdProfile/view/PasswordView.dart';
import 'Authentication/UsernamePswdProfile/view/PermissionView.dart';
import 'Authentication/UsernamePswdProfile/view/UserNameView.dart';
import 'Chatting/View/Chatting.dart';
import 'Chatting/View/Message.dart';
import 'Notifications.dart';
import 'Pinned/view/PinnedDetails.dart';
import 'ProfileInfo/view/FollowerlistTabBarView.dart';
import 'ProfileInfo/view/SettingsView.dart';

class ListScreen extends StatefulWidget {

  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(

          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) => SignupBasicInfoView(),
                    ));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text("SignUp Screen",style: TextStyle(color: Colors.black87,fontFamily: sf_pro_display_semibold,fontSize: 16),),
                  ),
                ),

                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) => Welcome(),
                    ));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text("SplashScreen Screen",style: TextStyle(color: Colors.black87,fontFamily: sf_pro_display_semibold,fontSize: 16),),
                  ),
                ),

                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) => ConfirmationCode(),
                    ));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text("ConfirmationCode Screen",style: TextStyle(color: Colors.black87,fontFamily: sf_pro_display_semibold,fontSize: 16),),
                  ),
                ),

                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) => OtpVerification(),
                    ));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text("OtpVerification Screen",style: TextStyle(color: Colors.black87,fontFamily: sf_pro_display_semibold,fontSize: 16),),
                  ),
                ),


                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) => UserName(),
                    ));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text("UserName Screen",style: TextStyle(color: Colors.black87,fontFamily: sf_pro_display_semibold,fontSize: 16),),
                  ),
                ),

                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) => Password(),
                    ));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text("Password Screen",style: TextStyle(color: Colors.black87,fontFamily: sf_pro_display_semibold,fontSize: 16),),
                  ),
                ),

                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) => Permission(),
                    ));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text("Permission Screen",style: TextStyle(color: Colors.black87,fontFamily: sf_pro_display_semibold,fontSize: 16),),
                  ),

                ),


                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) => AddProfilePhoto(),
                    ));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text("FoureStep Screen",style: TextStyle(color: Colors.black87,fontFamily: sf_pro_display_semibold,fontSize: 16),),
                  ),
                ),

                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) => SignIn(),
                    ));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text("SignIn Screen",style: TextStyle(color: Colors.black87,fontFamily: sf_pro_display_semibold,fontSize: 16),),
                  ),
                ),

                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) => MyPages(),
                    ));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text("MyPages Screen",style: TextStyle(color: Colors.black87,fontFamily: sf_pro_display_semibold,fontSize: 16),),
                  ),
                ),

                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) => BottomNavigation(),
                    ));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text("BottomNavigation Screen",style: TextStyle(color: Colors.black87,fontFamily: sf_pro_display_semibold,fontSize: 16),),
                  ),
                ),

                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) => AllProducts(),
                    ));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text("Category Screen",style: TextStyle(color: Colors.black87,fontFamily: sf_pro_display_semibold,fontSize: 16),),
                  ),
                ),

                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) => ProductDetailPage(),
                    ));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text("ProductDetailPage Screen",style: TextStyle(color: Colors.black87,fontFamily: sf_pro_display_semibold,fontSize: 16),),
                  ),
                ),

                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) => PinnedDetails(),
                    ));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text("PinnedDetails Screen",style: TextStyle(color: Colors.black87,fontFamily: sf_pro_display_semibold,fontSize: 16),),
                  ),
                ),

                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) => MyBasket(),
                    ));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text("MyBasket Screen",style: TextStyle(color: Colors.black87,fontFamily: sf_pro_display_semibold,fontSize: 16),),
                  ),
                ),

                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) => SetPinnedBasket(),
                    ));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text("Set Pinned Screen",style: TextStyle(color: Colors.black87,fontFamily: sf_pro_display_semibold,fontSize: 16),),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) => SignupBasicInfoView(),
                    ));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text("SignupNew Screen",style: TextStyle(color: Colors.black87,fontFamily: sf_pro_display_semibold,fontSize: 16),),
                  ),
                ),

                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) => SignUpDetails(),
                    ));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text("SignupDetails Screen",style: TextStyle(color: Colors.black87,fontFamily: sf_pro_display_semibold,fontSize: 16),),
                  ),
                ),


                // GestureDetector(
                //   onTap: (){
                //     Navigator.push(context, MaterialPageRoute(
                //       builder: (context) => ProductDetailSingle(),
                //     ));
                //   },
                //   child: Padding(
                //     padding: const EdgeInsets.all(12.0),
                //     child: Text("ProductDetailSingle Screen",style: TextStyle(color: Colors.black87,fontFamily: sf_pro_display_semibold,fontSize: 16),),
                //   ),
                // ),

                // GestureDetector(
                //   onTap: (){
                //     Navigator.push(context, MaterialPageRoute(
                //       builder: (context) => ProductDetailMultiple(),
                //     ));
                //   },
                //   child: Padding(
                //     padding: const EdgeInsets.all(12.0),
                //     child: Text("ProductDetailMultiple Screen",style: TextStyle(color: Colors.black87,fontFamily: sf_pro_display_semibold,fontSize: 16),),
                //   ),
                // ),

                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) => TestScreen(),
                    ));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text("TestScreen Screen",style: TextStyle(color: Colors.black87,fontFamily: sf_pro_display_semibold,fontSize: 16),),
                  ),
                ),

                // GestureDetector(
                //   onTap: (){
                //     Navigator.push(context, MaterialPageRoute(
                //       builder: (context) => OrderHistoryTab(),
                //     ));
                //   },
                //   child: Padding(
                //     padding: const EdgeInsets.all(12.0),
                //     child: Text("OrderHistory Screen",style: TextStyle(color: Colors.black87,fontFamily: sf_pro_display_semibold,fontSize: 16),),
                //   ),
                // ),

                // GestureDetector(
                //   onTap: (){
                //     Navigator.push(context, MaterialPageRoute(
                //       builder: (context) => MyAppFirst(),
                //     ));
                //   },
                //   child: Padding(
                //     padding: const EdgeInsets.all(12.0),
                //     child: Text("MyAppFirst Screen",style: TextStyle(color: Colors.black87,fontFamily: sf_pro_display_semibold,fontSize: 16),),
                //   ),
                // ),

                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) => MyProfile(),
                    ));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text("My Profile",style: TextStyle(color: Colors.black87,fontFamily: sf_pro_display_semibold,fontSize: 16),),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) => OtherprofileView(),
                    ));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text("Other Profile",style: TextStyle(color: Colors.black87,fontFamily: sf_pro_display_semibold,fontSize: 16),),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) => FollowTabBar(),
                    ));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text("Followers List Tab Bar",style: TextStyle(color: Colors.black87,fontFamily: sf_pro_display_semibold,fontSize: 16),),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) => EditProfile(),
                    ));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text("Edit Profile",style: TextStyle(color: Colors.black87,fontFamily: sf_pro_display_semibold,fontSize: 16),),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) => Settings(),
                    ));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text("Settings",style: TextStyle(color: Colors.black87,fontFamily: sf_pro_display_semibold,fontSize: 16),),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) => ChangePassword(),
                    ));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text("Change Password",style: TextStyle(color: Colors.black87,fontFamily: sf_pro_display_semibold,fontSize: 16),),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) => TotalPinPurchased(),
                    ));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text("Total Pin Purchased",style: TextStyle(color: Colors.black87,fontFamily: sf_pro_display_semibold,fontSize: 16),),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) => RePinnedBy(),
                    ));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text("Repinned By Screen",style: TextStyle(color: Colors.black87,fontFamily: sf_pro_display_semibold,fontSize: 16),),
                  ),
                ),

                // GestureDetector(
                //   onTap: (){
                //     Navigator.push(context, MaterialPageRoute(
                //       builder: (context) => OrderDetail(),
                //     ));
                //   },
                //   child: Padding(
                //     padding: const EdgeInsets.all(12.0),
                //     child: Text("OrderDetail Screen",style: TextStyle(color: Colors.black87,fontFamily: sf_pro_display_semibold,fontSize: 16),),
                //   ),
                // ),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) => OrderHistoryTab(),
                    ));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text("OrderHistory Screen",style: TextStyle(color: Colors.black87,fontFamily: sf_pro_display_semibold,fontSize: 16),),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) => TrxnDetailTopupDone(),
                    ));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text("TrxnDetailTopupDone Screen",style: TextStyle(color: Colors.black87,fontFamily: sf_pro_display_semibold,fontSize: 16),),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) => TrxnDetailTopupFailed(),
                    ));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text("TrxnDetailTopupFailed Screen",style: TextStyle(color: Colors.black87,fontFamily: sf_pro_display_semibold,fontSize: 16),),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) => TrxnPinCommisionDetail(),
                    ));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text("TrxnPinCommisionDetail Screen",style: TextStyle(color: Colors.black87,fontFamily: sf_pro_display_semibold,fontSize: 16),),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) => Notifications(),
                    ));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text("Notifications Screen",style: TextStyle(color: Colors.black87,fontFamily: sf_pro_display_semibold,fontSize: 16),),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) => Message(),
                    ));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text("Message Screen",style: TextStyle(color: Colors.black87,fontFamily: sf_pro_display_semibold,fontSize: 16),),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) => Chatting(),
                    ));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text("Chatting Screen",style: TextStyle(color: Colors.black87,fontFamily: sf_pro_display_semibold,fontSize: 16),),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) => Explore(),

                    ));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),

                    child: Text("Explore",style: TextStyle(color: Colors.black87,fontFamily: sf_pro_display_semibold,fontSize: 16),),
                  ),
                ),
                // GestureDetector(
                //   onTap: (){
                //     Navigator.push(context, MaterialPageRoute(
                //       builder: (context) => WalletDashboard(),
                //     ));
                //   },
                //   child: Padding(
                //     padding: const EdgeInsets.all(12.0),
                //
                //     child: Text("Wallet",style: TextStyle(color: Colors.black87,fontFamily: sf_pro_display_semibold,fontSize: 16),),
                //   ),
                // ),

                /* test*/
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) => Search(),
                    ));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),

                    child: Text("Search",style: TextStyle(color: Colors.black87,fontFamily: sf_pro_display_semibold,fontSize: 16),),
                  ),
                ),

                // GestureDetector(
                //   onTap: (){
                //     Navigator.push(context, MaterialPageRoute(
                //       builder: (context) => NotificationList(),
                //     ));
                //   },
                //   child: Padding(
                //     padding: const EdgeInsets.all(12.0),
                //
                //     child: Text("NotificationList",style: TextStyle(color: Colors.black87,fontFamily: sf_pro_display_semibold,fontSize: 16),),
                //   ),
                //
                // ),

                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) => SaveAddress(),
                    ));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),

                    child: Text("SaveAddress",style: TextStyle(color: Colors.black87,fontFamily: sf_pro_display_semibold,fontSize: 16),),
                  ),

                )
              ],
            ),
          ),
    )
    );
  }
}
