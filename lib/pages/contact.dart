import 'package:flutter/material.dart';

import '../widgets/widgets.dart';
import 'page_builder.dart';

class Contact extends StatefulWidget {
  const Contact({Key key}) : super(key: key);

  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  @override
  Widget build(BuildContext context) {
    return PageBuilder(
      child: _body(context),
      decoration: BoxDecoration(color: Colors.white),
      activePage: ActivePage.CONTACT,
    );
  }

  Widget _body(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    bool isHDRady = width <= 1600;

    return Column(
      children: [
        Column(
          children: [
            Container(
              margin: EdgeInsets.only(
                top: height < 600 || width < 600 ? 120 : 80,
                bottom: 20,
              ),
              child: Text(
                'Have a question?',
                style: TextStyle(
                  fontSize: !isHDRady
                      ? 72
                      : width < 600
                          ? 42
                          : 56,
                  color: Colors.black87,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
        Wrap(
          alignment: WrapAlignment.center,
          clipBehavior: Clip.none,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(top: 40, bottom: 40),
              width: 400,
              padding: EdgeInsets.only(
                left: 40,
                right: 40,
                top: 40,
                bottom: 60,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _personalData(
                    header: 'Address',
                    icon: Icons.home,
                    firstPart: 'Wroclaw, ',
                    secondPart: 'Poland',
                  ),
                  _personalData(
                    header: 'Lets talk',
                    icon: Icons.phone,
                    secondPart: '+48 726823405',
                  ),
                  _personalData(
                    header: 'Email',
                    icon: Icons.mail,
                    firstPart: 'wgkubiak@gmail.com',
                  ),
                ],
              ),
            ),
            Container(
              width: isHDRady ? 600 : 800,
              margin: EdgeInsets.only(top: 40, bottom: 40),
              padding: EdgeInsets.symmetric(horizontal: 64, vertical: 24),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    decoration: BoxDecoration(
                      color: Color(0xFF388E3C),
                      borderRadius: BorderRadius.all(Radius.circular(40)),
                    ),
                    child: Text(
                      'Get in touch',
                      style: TextStyle(
                        fontSize: 42,
                        color: Colors.white,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  _textField(
                    hint: 'Email',
                    keyboardType: TextInputType.text,
                  ),
                  _textField(
                    hint: 'Subject',
                    keyboardType: TextInputType.text,
                  ),
                  _textField(
                    hint: 'Message',
                    maxLines: 8,
                    keyboardType: TextInputType.multiline,
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.send,
                      color: Colors.black87,
                      size: 32,
                    ),
                    onPressed: () {},
                  )
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _textField({
    String hint,
    int maxLines = 1,
    TextInputType keyboardType,
  }) {
    return Container(
      padding: EdgeInsets.only(bottom: 24, top: 40),
      child: TextField(
        cursorColor: Color(0xFF388E3C),
        maxLines: maxLines,
        keyboardType: keyboardType,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 20,
          color: Colors.black87,
          fontFamily: 'Raleway',
          fontWeight: FontWeight.w400,
        ),
        decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black26, width: 2),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF388E3C), width: 3),
          ),
          border: UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF262626), width: 2),
          ),
          hintText: hint,
        ),
      ),
    );
  }

  Widget _personalData({
    String header,
    IconData icon,
    String firstPart,
    String secondPart,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 32, color: Color(0xFF262626)),
              Text(
                header,
                style: TextStyle(
                  fontSize: 32,
                  color: Colors.black87,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 12),
            child: RichText(
              text: TextSpan(
                text: firstPart,
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.black87,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.w400,
                ),
                children: [
                  TextSpan(
                    text: secondPart,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
