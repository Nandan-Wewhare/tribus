import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tribus/constants.dart';

class JoinPageMobile extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var padding = MediaQuery.of(context).padding;
    return Container(
      padding: EdgeInsets.only(
          top: padding.top, left: padding.left + 10, right: padding.right + 10),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('images/joinus.jpg'),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Text(
                kJoinHeading,
                style: TextStyle(
                  color: kBlueColor,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Text(
                kJoinSubHeading,
                style: TextStyle(
                  color: kBlueColor,
                  fontSize: 18,
                ),
              ),
            ),
            MaterialButton(
              shape: StadiumBorder(),
              color: kBlueColor,
              onPressed: () {
                showGeneralDialog(
                    barrierDismissible: true,
                    barrierLabel: 'Dismissed',
                    context: context,
                    pageBuilder: (ctx, anim1, anim2) {
                      return JoinFormMobile(formKey: _formKey);
                    });
              },
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
                child: Text(
                  'Join Us',
                  style: TextStyle(
                      color: kWhiteColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
            )
          ]),
    );
  }
}

class JoinFormMobile extends StatefulWidget {
  const JoinFormMobile({
    Key key,
    @required GlobalKey<FormState> formKey,
  }) : super(key: key);

  @override
  _JoinFormMobileState createState() => _JoinFormMobileState();
}

class _JoinFormMobileState extends State<JoinFormMobile> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _githubController = TextEditingController();
  final _linkedinController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _githubController.dispose();
    _linkedinController.dispose();
    _emailController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 8.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Container(
        padding: const EdgeInsets.all(14.0),
        height: MediaQuery.of(context).size.height / 1.5,
        child: Form(
          key: _formKey,
          child: ListView(
              children: [
                TextFormField(
                  controller: _nameController,
                  autofocus: true,
                  validator: (value) {
                    if (value.isEmpty)
                      return '*Please Enter Your Full Name';
                    else
                      return null;
                  },
                  style: TextStyle(fontSize: 16, color: kBlueColor),
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(12.0),
                    labelText: 'Full Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    prefixIcon: Icon(Icons.person_outline),
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _emailController,
                  validator: (value) {
                    bool emailValid = RegExp(
                            r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
                        .hasMatch(value);
                    if (value.isEmpty)
                      return '*Please Enter Your Working Email';
                    else if (!emailValid)
                      return '*Enter a Valid Email';
                    else
                      return null;
                  },
                  style: TextStyle(fontSize: 16, color: kBlueColor),
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(12.0),
                    labelText: 'Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    prefixIcon: Icon(Icons.email_outlined),
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _githubController,
                  validator: (value) {
                    bool githubValid =
                        RegExp(r"^https:\/\/github\.com\/[a-zA-Z]-?[a-zA-Z]")
                            .hasMatch(value);
                    if (value.isEmpty)
                      return '*Please Enter Your GitHub Profile URL';
                    else if (!githubValid) return '*Enter a Valid GitHub URL';
                    return null;
                  },
                  style: TextStyle(fontSize: 16, color: kBlueColor),
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(12.0),
                    labelText: 'GitHub URL',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(11.0),
                      child: FaIcon(FontAwesomeIcons.github),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  validator: (value) {
                    bool linkedinValid = RegExp(
                            r"((http(s?)://)*([a-zA-Z0-9\-])*\.|[linkedin])[linkedin/~\-]+\.[a-zA-Z0-9/~\-_,&=\?\.;]+[^\.,\s<]")
                        .hasMatch(value);
                    if (value.isNotEmpty) {
                      if (!linkedinValid) {
                        return '*Enter a Valid LinkedIn profile URL';
                      }
                    }
                    return null;
                  },
                  controller: _linkedinController,
                  style: TextStyle(fontSize: 16, color: kBlueColor),
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(12.0),
                    labelText: 'LinkedIn URL (optional)',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(11.0),
                      child: FaIcon(FontAwesomeIcons.linkedin),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                MaterialButton(
                    height: 48,
                    color: kBlueColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 12.0),
                      child: Text(
                        'Submit',
                        style: TextStyle(
                            color: kWhiteColor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        FirebaseFirestore.instance
                            .collection('Profiles')
                            .doc()
                            .set({
                          'Email': _emailController.text,
                          'Full Name': _nameController.text,
                          'GitHub': _githubController.text,
                          'LinkedIn': _linkedinController.text
                        });
                        showDialog(
                            context: context,
                            builder: (context) {
                              return Dialog(
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height / 5,
                                  width: MediaQuery.of(context).size.width / 5,
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                            'Your application has been submitted.\nWe will get back to you shortly.'),
                                        MaterialButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                            Navigator.pop(context);
                                          },
                                          child: Text(
                                            'OKAY',
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                          color: kBlueColor,
                                        )
                                      ]),
                                ),
                              );
                            });
                      }
                    }),
              ]),
        ),
      ),
    );
  }
}
