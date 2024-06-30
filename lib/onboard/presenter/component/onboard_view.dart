import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_health_app/core/presenters/components/custom_widget_animated.dart';
import 'package:my_health_app/presenter/view/auth/register/register_view.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../data/model/item_mode.dart';
import 'primary_button.dart';

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
              itemCount: listOfItems.length,
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
                      child: CustomWidgetAnimated(
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




