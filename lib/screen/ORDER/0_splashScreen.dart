import 'package:flutter/material.dart';
import 'package:sqlorder24/components/commoncolor.dart';
import 'package:sqlorder24/controller/controller.dart';
import 'package:sqlorder24/db_helper.dart';
import 'package:sqlorder24/screen/ADMIN_/adminController.dart';
import 'package:sqlorder24/screen/NEWPAGES/nextscreen.dart';
import 'package:sqlorder24/screen/ORDER/0_dashnew.dart';
import 'package:sqlorder24/screen/ORDER/1_companyRegistrationScreen.dart';
import 'package:sqlorder24/screen/ORDER/2_companyDetailsscreen.dart';
import 'package:sqlorder24/screen/ORDER/3_staffLoginScreen.dart';
import 'package:sqlorder24/screen/ORDER/externalDir.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  String? cid;
  String? fp;
  bool? isautodownload;
  String? userType;
  String? firstMenu;
  String? versof;
  bool? continueClicked;
  bool? staffLog;
  String? dataFile;
  String? os;
  String? tempFp1;
  ExternalDir externalDir = ExternalDir();

  navigate() async {
    Map<String, dynamic>? temp = await externalDir.fileRead();
    await Future.delayed(Duration(seconds: 3), () async {
      print("stored db details${temp}");
      Navigator.push(
          context,
          PageRouteBuilder(
              opaque: false, // set to false
              pageBuilder: (_, __, ___) {
                print(
                    "data from file------------$temp----");
                // if (temp !=null) 
                // {
                //   return StaffLogin();
                // } 

                // else 
                // {
                  print("not valid user");
                  return NextPage();
                // }
              }));
    });
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
    Provider.of<Controller>(context, listen: false).getfilefromStorage();
    navigate();
  }

  @override
  void dispose() {
    // _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: P_Settings.wavecolor,
      body: InkWell(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Center(
            child: Column(
          children: [
            SizedBox(
              height: size.height * 0.4,
            ),
            Container(
                height: 200,
                width: 200,
                child: Image.asset(
                  "asset/logo_black_bg.png",
                )),
          ],
        )),
      ),
    );
  }
}
