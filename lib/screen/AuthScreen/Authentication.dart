import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:poorvaholiday/helpers/Seo/renderers/text_renderer/text_renderer_style.dart';
import 'package:poorvaholiday/routes/routes.dart';
import 'package:poorvaholiday/screen/auth_screen/login.dart';
import 'package:poorvaholiday/screen/auth_screen/register.dart';
import 'package:poorvaholiday/screen/widgets/custom_text.dart';

class Authentication extends StatelessWidget {
  final String type;
  const Authentication({
    Key? key,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> imageName = [
      'https://images.unsplash.com/photo-1617469165786-8007eda3caa7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
      'https://images.unsplash.com/photo-1611605645802-c21be743c321?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTV8fG5lcGFsfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
      'https://media.istockphoto.com/photos/holy-town-varanasi-and-the-river-ganges-picture-id827065008?b=1&k=20&m=827065008&s=170667a&w=0&h=YjToqYIXDJUZvgVFjW8K_WSPAODbZhwRPNcO8SjGo14=',
      'https://images.unsplash.com/photo-1571536802807-30451e3955d8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8dXR0YXIlMjBwcmFkZXNofGVufDB8MHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
      'https://images.unsplash.com/photo-1613445607898-f46e51645acf?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8dXR0YXIlMjBwcmFkZXNofGVufDB8MHwwfHw%3D&auto=format&fit=crop&w=500&q=60'
    ];
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 3,
              child: Stack(children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: double.infinity,
                  child: Swiper(
                      autoplay: true,
                      loop: true,
                      itemCount: imageName.length,
                      layout: SwiperLayout.DEFAULT,
                      autoplayDelay: 5000,
                      itemBuilder: (context, index) {
                        return Image.network(imageName[index],
                            fit: BoxFit.fill);
                      }),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
                  height: MediaQuery.of(context).size.height,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withOpacity(0.8),
                        Colors.black.withOpacity(0.7),
                        Colors.black.withOpacity(0.6),
                        Colors.black.withOpacity(0.4),
                        Colors.black.withOpacity(0.1),
                        Colors.black.withOpacity(0.05),
                        Colors.black.withOpacity(0.025),
                      ],
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 1,
                        child: TextView(
                          style: TextView.headerStyle(
                            size: 40,
                            weight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          textRenderStyle: TextRendererStyle.header1,
                          isSeoText: true,
                          value: 'Poorva Holidays \nA Holiday Planning App ',
                          align: TextAlign.left,
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: TextView(
                          style: TextView.headerStyle(
                            size: 20,
                            weight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          textRenderStyle: TextRendererStyle.paragraph,
                          isSeoText: true,
                          value: 'Enjoy your holidays with us',
                          align: TextAlign.left,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Beamer.of(context).popToNamed(
                            Routes.home,
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              TextView(
                                value: 'Explore',
                                customColor: Colors.white,
                              ),
                              SizedBox(width: 10),
                              Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ]),
            ),
            Expanded(
                flex: 2,
                child: Container(
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.2),
                    child: getByType(type))),
          ],
        ),
      ),
    );
  }

  Widget getByType(String type) {
    switch (type.toLowerCase()) {
      case 'login':
        return Login();
      case 'register':
        return RegisterScreen();
      default:
        return RegisterScreen();
    }
  }
}
