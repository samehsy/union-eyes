import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:secondapp/screens/login.dart';
import './home_page_screen.dart';

class IntroductionScren extends StatelessWidget {
  static const routeName = '/';
/*functon to build image and config in page view mpdel*/
  Widget buildImage(String path) {
    return Card(
      elevation: 7,
      margin: EdgeInsets.only(left: 3, right: 3),
      child: ClipRRect(
        child: Image.asset(
          path,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

/* function that config the basic (sizeimage,text,title,description)*/
  PageDecoration getPageDecoration() {
    return PageDecoration(
      imageFlex: 2,
      pageColor: Color.fromARGB(255, 238, 238, 238),
      titleTextStyle: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w700,
        fontFamily: 'Cairo',
      ),
      bodyTextStyle: TextStyle(
        fontSize: 19,
        fontWeight: FontWeight.w700,
        fontFamily: 'Cairo',
      ),
      bodyPadding: EdgeInsets.only(top: 20),
      titlePadding: EdgeInsets.all(0),
    );
  }

/*function to config Decorator*/
  DotsDecorator getDotDecoration() {
    return DotsDecorator(
        color: Colors.black26,
        size: Size(10, 10),
        activeSize: Size(22, 10),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(75),
        ),
        spacing: EdgeInsets.all(5));
  }

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      showDoneButton: false,
      next: Icon(
        Icons.arrow_forward,
        size: 30,
      ),
      showSkipButton: true,
      skip: const Text(
        'تخطي',
        style: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.bold,
          fontFamily: 'Cario',
        ),
      ),
      globalBackgroundColor: Colors.white,
      dotsDecorator: getDotDecoration(),
      curve: Curves.linear,
      pages: [
        PageViewModel(
          title: 'العالمية لرعاية البصر',
          body: 'أفضل الخدمات في مجال رعايةالبصريات ',
          image: buildImage('assets/images/IntroPage.jpg'),
          decoration: getPageDecoration(),
        ),
        PageViewModel(
          title: 'اطلب جميع منتجاتك من مكان واحد',
          body: '(نظارات,عدسات,أجهزة)',
          image: buildImage('assets/images/ProductPage.png'),
          decoration: getPageDecoration(),
        ),
        PageViewModel(
          title: 'حافظ على استمراية عمل مركزك ',
          body: 'اطلب فريق صيانة متخصص في صيانة أجهزة البصريات',
          image: buildImage('assets/images/MaintenancePage.png'),
          decoration: getPageDecoration(),
        ),
        PageViewModel(
            title: 'منتجاتنا ستصلك إلى مركزك',
            body: 'ابعث عنوان مركزك وانتظر عامل التوصيل',
            image: buildImage('assets/images/DeliveryPage.png'),
            decoration: getPageDecoration(),
            footer: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(50),
                      backgroundColor:
                          Theme.of(context).colorScheme.primaryContainer,
                      // maximumSize: Size.fromWidth(100),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () {
                      context.go('/login');
                    },
                    child: const Text("تسجيل الدخول"),
                  ),
                  
                  TextButton(
                      onPressed: () {
                         context.go('/home');
                      },
                      child: Text("تسجيل الدخول لاحقاً")),
                        TextButton(
                      onPressed: () {
                         context.go('/warehouse');
                      },
                      child: Text("الدخول كمدير مستودع"))
                ],
              ),
            )),
      ],
    );
  }
}
