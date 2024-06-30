import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_health_app/presenter/view/auth/register/register_view.dart';

import 'component/primary_button.dart';

class OnboardView extends StatefulWidget {
  const OnboardView({super.key});

  @override
  State<OnboardView> createState() => _OnboardViewState();
}

class _OnboardViewState extends State<OnboardView> {
  PageController pageController = PageController(initialPage: 0);
  int currentIndex=0;

  @override
  void dispose(){
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: PageView.builder(
              controller: pageController,
              itemCout: listOfItems.length,
              onPageChanged: (newIndex){
                setState(
                  (){
                    currentIndex = newIndex;
                  }
                );
              },
              physics: const BouncingScrollPhysics(),
              itemBuilder: ((context, index){
                return Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(15, 40, 15, 10),
                      width: 500,
                      height: 325,
                      child: CustomWidgetAnimated(
                        index: index,
                        delay: 100,
                        child: Image.asset(listOfItems[index].img),
                      )
                    ),
                    const SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: CustomWidgetAnimated(
                        index: index,
                        delay: 300,
                        child: Text(
                          listOfItems[index].title,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                            color: Colors.black, fontSize: 26
                          )
                        )
                      ),
                      ),
                      const SizedBox(height: 20,),
                      Padding(padding: const EdgeInsets.symmetric(horizontal: 40), 
                      child: CustomAnimatedWidget(
                      index: index,
                      delay: 500,
                      child: Text(
                        listOfItems[index].subTitle,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                            fontSize: 17, fontWeight: FontWeight.w300),
                      ),
                    ),
                      )
                  ]
                );
              })
            )
          ),
          Expanded(
            flex: 1,
            child: Column(
            children: [
              SmoothPageIndicator(
                controller: pageController,
                count: listOfItems.length,
                effect: const ExpandingDotsEffect(
                  spacing: 6.0,
                  radius: 10.0,
                  dotWidth: 10.0,
                  dotHeight: 10.0,
                  expansionFactor: 3.8,
                  dotColor: Colors.grey,
                  activeDotColor: Colors.deepPurple,
                ),
                onDotClicked: (newIndex) {
                  setState(() {
                    currentIndex = newIndex;
                    pageController.animateToPage(newIndex,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.ease);
                  });
                },
              ),
              SizedBox(height: 90,),

              currentIndex == 2 ?
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24
                ),
                child: PrimaryButton(
                  onTap: (){
                     Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegisterView()),
                          );
                  },
                  text: 'Começar'
                )
              ) : 
                Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: PrimaryButton(
                        onTap: () {
                          setState(() {
                            pageController.animateToPage(2,
                                duration: const Duration(milliseconds: 1000),
                                curve: Curves.fastOutSlowIn);
                          });
                        },
                        text: 'Pular',
                      ),
                    ),

                    SizedBox(height: 20,)
            ],
          ))
        ]
      ),
    );
  }
}



class CustomAnimatedWidget extends StatelessWidget {
  final int index;
  final int delay;
  final Widget child;
  const CustomAnimatedWidget(
      {super.key,
      required this.index,
      required this.delay,
      required this.child});

  @override
  Widget build(BuildContext context) {
    if (index == 1) {
      return FadeInDown(
        delay: Duration(milliseconds: delay),
        child: child,
      );
    }
    return FadeInUp(
      delay: Duration(milliseconds: delay),
      child: child,
    );
  }
}

class Items {
  final String img;
  final String title;
  final String subTitle;

  ///
  Items({
    required this.img,
    required this.title,
    required this.subTitle,
  });
}

List<Items> listOfItems = [
  Items(
    img: "assets/1.png",
    title: "Bemvindo!",
    subTitle: "Revolucione a maneira como você gerencia sua saúde, começando agora",
  ),
  Items(
    img: "assets/2.png",
    title: "Explore soluções avançadas de saúde",
    subTitle:
        "Acesse todas as ferramentas essenciais de saúde em um local conveniente - sem necessidade de alternar entre os aplicativos!",
  ),
  Items(
    img: "assets/3.png",
    title: "Análise Instantânea de Doenças",
    subTitle:
        "Digitalize imagens para identificação precisa de doenças e prescrições personalizadas.",
  ),
];
