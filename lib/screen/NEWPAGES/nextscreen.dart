import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqlorder24/components/commoncolor.dart';
import 'package:sqlorder24/controller/controller.dart';
import 'package:sqlorder24/screen/ORDER/1_companyRegistrationScreen.dart';

class NextPage extends StatefulWidget {
  const NextPage({super.key});

  @override
  State<NextPage> createState() => _NextPageState();
}

class _NextPageState extends State<NextPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.cyan,
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
                child: Center(
                    child: Column(
                  children: [
                    Text(
                      "Welcome to VPOS",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Click NEXT to Register",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 40, left: 17.0, right: 17),
                      child: SizedBox(
                        height: size.height * 0.06,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(20), // <-- Radius
                            ),
                          ),
                          onPressed: () async {
                            await Provider.of<Controller>(context,
                                    listen: false)
                                .initPrimaryDb(context);
                          
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: const <Widget>[
                              Text(
                                'NEXT',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                              Icon(
                                Icons.arrow_forward,
                                size: 20,
                                color: Colors.black,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ))),
          ],
        )),
      ),
    );
  }
}
