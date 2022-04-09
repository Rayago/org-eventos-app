class ContOnboard {
  String imagem;
  String titulo;
  String descricao;

  ContOnboard({required this.imagem, required this.titulo, required this.descricao});
}

List<ContOnboard> conteudos = [
  ContOnboard(
    titulo: "Bem Vindo!",
    imagem: "lib/assets/images/mapa.png",
    descricao: "Descubra lugares incríveis em Brasília "
  ),
  ContOnboard(
    titulo: "Selecione seus interesses",
    imagem: "lib/assets/images/mapa.png",
    descricao: ""/*"Duis elementum neque in malesuada maximus. In sit amet consectetur urna. "
                  "Vivamus vulputate elit lacus, sed bibendum mauris sodales sit amet. Sed nisi diam, "
                  "scelerisque non mauris vitae, pretium luctus neque. Aenean volutpat justo ligula, "
                  "eget ultrices lorem luctus vel. Mauris faucibus ut dui et mollis. Curabitur vestibulum "
                  "pellentesque sem, ut lobortis ante feugiat eget. Suspendisse potenti. Donec eu feugiat enim."*/
  ),
  ContOnboard(
    titulo: "Veja locais recomendados pra você",
    imagem: "lib/assets/images/mapa.png",
    descricao: ""
  ),
  ContOnboard(
    titulo: "Busque por restaurantes, pontos turísticos, etc.",
    imagem: "lib/assets/images/mapa.png",
    descricao: ""
  ),
];