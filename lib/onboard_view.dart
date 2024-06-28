import 'package:flutter/material.dart';

class OnboardView extends StatefulWidget {
  const OnboardView({super.key});

  @override
  State<OnboardView> createState() => _OnboardViewState();
}

class _OnboardViewState extends State<OnboardView> {
  @override
  Widget build(BuildContext context) {
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
                          style: 
                        )
                      ),
                      )
                  ]
                );
              })
            )
          )
        ]
      ),
    );
  }
}