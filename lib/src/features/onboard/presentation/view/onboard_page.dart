import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'cont_onboard.dart';

class OnboardPage extends StatefulWidget {
  const OnboardPage({Key? key}) : super(key: key);

  @override
  State<OnboardPage> createState() => _OnboardPageState();
}

class _OnboardPageState extends State<OnboardPage> {
  int indexAtual = 0;
  late PageController _controller;

  @override
  void initState(){
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose(){
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 0, 162),//0000a2
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _controller,
              itemCount: conteudos.length,
              onPageChanged: (int index) {
                setState(() {
                  indexAtual = index;
                });
              },
              itemBuilder: (_,i){
                return Padding(
                  padding: const EdgeInsets.all(40),
                  child: Column(
                    children: [
                      Image.asset(
                        conteudos[i].imagem,
                        height: 200,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        conteudos[i].titulo,
                        style: const TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 50),
                      Text(
                        conteudos[i].descricao,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 23,
                          color: Colors.white,
                        )
                      ),
                    ],
                  )
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              conteudos.length,
              (index) => buildDot(index, context)
              ),
          ),
          Container(
            height: 55,
            margin: const EdgeInsets.all(40),
            width: double.infinity,
            color: Theme.of(context).primaryColor,
            child: FlatButton(
              child: Text(indexAtual == conteudos.length - 1 ? "Continuar" :   "Próximo"),
              onPressed: (){
                if(indexAtual == conteudos.length - 1){
                  /* Navigator.push(
                    context, 
                    MaterialPageRoute(
                      builder: (_) => const LoginPage(),
                    ),
                  ); */
                  //Modular.to.pushNamed('/auth');
                  Modular.to.navigate('/auth');
                }
                _controller.nextPage(
                    duration: const Duration(milliseconds: 100), 
                    curve: Curves.bounceIn
                  );
              },
              color: Theme.of(context).primaryColor,
              textColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
                height: 10,
                width: indexAtual == index ? 25 : 10,
                margin: const EdgeInsets.only(right: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Theme.of(context).primaryColor,
                )
              );
  }
}