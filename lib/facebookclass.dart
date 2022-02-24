import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class FacebookHomepage extends StatefulWidget {
  @override
  FacebookHomepageState createState() => FacebookHomepageState();
}

class FacebookHomepageState extends State<FacebookHomepage> {

  bool isLoggedIn = false;
  Map _userObj = {};
  FacebookAuth _facebookAuth;

  @override
  Widget build(BuildContext context) {
    // // TODO: implement build
    // throw UnimplementedError();
    return Scaffold(
      appBar: AppBar(
        title: Text("VP "),
      ),
      body: Container(
        child: isLoggedIn
            ? Column(
                children: [
                  Image.network(_userObj["picture"]["data"]["url"]),
                  Text(_userObj["name"]),
                  Text(_userObj["email"]),
                  TextButton(
                      onPressed: () {
                        FacebookAuth.instance.logOut().then((value) {
                          setState(() {
                            isLoggedIn = false;
                            _userObj = {};
                          });
                        });
                      },
                      child: Text("Logout")),
                ],
              )
            : Center(
                child: ElevatedButton(
                  child: Text("Login with facebook"),
                  onPressed: () async {
                    final LoginResult result = await FacebookAuth.instance.login(); // by default we request the email and the public profile

                    print("MyData" + result.message.toString());
                    if (result.status == LoginStatus.success) {
                      // you are logged
                      final AccessToken accessToken = result.accessToken;

                      print("MyData" + accessToken.toString());
                    } else {
                      print("MyData" + result.status.toString());
                      print(result.status);
                      print(result.message);
                    }

                    // FacebookAuth.instance
                    //     .login(permissions: ["public_profile", "email"]).then(
                    //         (userData) {
                    //           print("UserData" + "Ed");
                    //           setState(() {
                    //     isLoggedIn = true;
                    //     print("UserData" +  userData.accessToken.toString());
                    //     // _userObj = userData as Map;
                    //
                    //   });
                    // });

                  },
                ),
              ),
      ),
    );
  }

}
