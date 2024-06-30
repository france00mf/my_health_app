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