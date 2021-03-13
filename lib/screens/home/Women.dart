import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class Women extends StatefulWidget {
  @override
  _WomenState createState() => _WomenState();
}

class _WomenState extends State<Women> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff9ad7e9),
        appBar: AppBar(
          backgroundColor: Color(0xff9ad7e9),
          title: Text('Women'),
        ),
        body: ListView(children: [
          Column(
            children: [
              Image(
                image: AssetImage('images/lt.png'),
                height: 300,
                width: 300,
              ),
              // GFAvatar(
              //     size: GFSize.LARGE,
              //     radius: 90,
              //     foregroundColor: Colors.black,
              //     backgroundImage: AssetImage("images/hobby.jpg"),
              //     shape: GFAvatarShape.circle),
              GFAccordion(
                collapsedTitleBackgroundColor: Colors.blue[100],
                expandedTitleBackgroundColor: Colors.transparent,
                contentBackgroundColor: Colors.transparent,
                collapsedIcon: Text(''),
                expandedIcon: Text(''),
                titlePadding: EdgeInsets.only(
                  right: 10,
                  left: 10,
                ),

                // title: ' Role of Women',
                // content:
                //     'Women are the epitome of strength, love, sacrifice and courage. The role of women in today’s world has changed significantly and for better. Women are now self-sufficient, well aware and financially independent. They have attained immense success '
                titleChild: ListTile(
                  leading: ImageIcon(
                    AssetImage("images/l.png"),
                    size: 32,
                  ),
                  title: Text(
                    'Women',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                  ),
                ),
                contentPadding: EdgeInsets.only(left: 80),
                contentChild: Padding(
                  padding: const EdgeInsets.only(right: 14),
                  child: Text(
                    'Women are the epitome of strength, love, sacrifice and courage. The role of women in today’s world has changed significantly and for better. Women are now self-sufficient, well aware and financially independent. They have attained immense success ',
                    style: TextStyle(fontSize: 14),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ),
              GFAccordion(
                collapsedTitleBackgroundColor: Colors.blue[100],
                expandedTitleBackgroundColor: Colors.transparent,
                contentBackgroundColor: Colors.transparent,
                collapsedIcon: Text(''),
                expandedIcon: Text(''),
                titlePadding: EdgeInsets.only(
                  right: 10,
                  left: 10,
                ),

                // title: 'Challenges they face',
                // content:
                //     'Women have been trying to break away from norms and standards set by society. They have been marching for  the adage glass ceiling is still quite prevalent'
                titleChild: ListTile(
                  leading: ImageIcon(
                    AssetImage('images/cha.png'),
                    size: 32,
                  ),
                  title: Text(
                    'Challenges they face',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                  ),
                ),
                contentPadding: EdgeInsets.only(left: 80),
                contentChild: Padding(
                  padding: const EdgeInsets.only(right: 14),
                  child: Text(
                    'Women have been trying to break away from norms and standards set by society. They have been marching for  the adage glass ceiling is still quite prevalent',
                    style: TextStyle(fontSize: 14),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ),
              GFAccordion(
                collapsedTitleBackgroundColor: Colors.blue[100],
                expandedTitleBackgroundColor: Colors.transparent,
                contentBackgroundColor: Colors.transparent,
                collapsedIcon: Text(''),
                expandedIcon: Text(''),
                titlePadding: EdgeInsets.only(
                  right: 10,
                  left: 10,
                ),

                // title: ' NGO',
                // content:
                //     'MAKAAM is a national informal platform working to secure women farmers identity and rights in India. They address the status of women farmers in farm suicide families and various issues that women farmers are content with. MAKAAM provides support and empowerment to farm suicide affected families for the women to continue with their lives,'
                titleChild: ListTile(
                  leading: ImageIcon(
                    AssetImage('images/helpme.png'),
                    size: 32,
                  ),
                  title: Text(
                    'NGO',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                  ),
                ),
                contentPadding: EdgeInsets.only(left: 80),
                contentChild: Padding(
                  padding: const EdgeInsets.only(right: 14),
                  child: Text(
                    'MAKAAM is a national informal platform working to secure women farmers identity and rights in India. They address the status of women farmers in farm suicide families and various issues that women farmers are content with. MAKAAM provides support and empowerment to farm suicide affected families for the women to continue with their lives,',
                    style: TextStyle(fontSize: 14),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ),
              GFAccordion(
                collapsedTitleBackgroundColor: Colors.blue[100],
                expandedTitleBackgroundColor: Colors.transparent,
                contentBackgroundColor: Colors.transparent,
                collapsedIcon: Text(''),
                expandedIcon: Text(''),
                titlePadding: EdgeInsets.only(
                  right: 10,
                  left: 10,
                ),

                // title: 'Steps to Empower them',
                // content:
                //     'Create a safe space: Women in South Asia often have nowhere to gather with other women and talk about issues like gender equity, women’s right women to gather and learn.',
                //
                titleChild: ListTile(
                  leading: ImageIcon(
                    AssetImage('images/blood.png'),
                    size: 32,
                  ),
                  title: Text(
                    'Steps to Empower them',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                  ),
                ),
                contentPadding: EdgeInsets.only(left: 80),
                contentChild: Padding(
                  padding: const EdgeInsets.only(right: 14),
                  child: Text(
                    'Create a safe space: Women in South Asia often have nowhere to gather with other women and talk about issues like gender equity, women’s right women to gather and learn.',
                    style: TextStyle(fontSize: 14),
                    textAlign: TextAlign.justify,
                  ),
                ),
              )
            ],
          ),
        ]));
  }
}
