import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:badges/badges.dart';
import 'package:makeat_mobile/screens/homeScreen.dart';
import 'screens/byName.dart';
import 'screens/byIngredient.dart';
import 'screens/homeScreen.dart';


void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MakEat',
      home: HomeScreen(),
      // Start the app with the "/" named route. In this case, the app starts
      // on the FirstScreen widget.
      /*
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => const FirstScreen(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/second': (context) => const SecondScreen(),
        '/third': (context) => const FirstScreen(),
      },*/
    ),
  );
}



class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search by Ingredient'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: FlatButton(
                          child: Container(
                            color: Colors.blueAccent,
                            child: Image.asset("images/elif2.jpg"),
                          ),
                          padding: const EdgeInsets.all(8.0),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomeScreen()),
                            );
                          }),
                    ),
                    Expanded(
                      child: FlatButton(
                          child: Container(
                            color: Colors.blueAccent,
                            child: Image.asset("images/esra2.jpg"),
                          ),
                          padding: const EdgeInsets.all(8.0),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomeScreen()),
                            );
                          }),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: FlatButton(
                          child: Container(
                            color: Colors.blueAccent,
                            child: Image.asset("images/ebru2.jpg"),
                          ),
                          padding: const EdgeInsets.all(8.0),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomeScreen()),
                            );
                          }),
                    ),
                    Expanded(
                      child: FlatButton(
                          child: Container(
                            color: Colors.blueAccent,
                            child: Image.asset("images/hatce2.jpg"),
                          ),
                          padding: const EdgeInsets.all(8.0),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomeScreen()),
                            );
                          }),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: FlatButton(
                          child: Container(
                            color: Colors.blueAccent,
                            child: Image.asset("images/merve2.jpg"),
                          ),
                          padding: const EdgeInsets.all(8.0),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomeScreen()),
                            );
                          }),
                    ),
                    Expanded(
                      child: FlatButton(
                          child: Container(
                            color: Colors.blueAccent,
                            child: Image.asset("images/asli2.jpg"),
                          ),
                          padding: const EdgeInsets.all(8.0),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomeScreen()),
                            );
                          }),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: FlatButton(
                          child: Container(
                            color: Colors.blueAccent,
                            child: Image.asset("images/suleyman2.jpg"),
                          ),
                          padding: const EdgeInsets.all(8.0),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomeScreen()),
                            );
                          }),
                    ),
                    Expanded(
                      child: FlatButton(
                          child: Container(
                            color: Colors.blueAccent,
                            child: Image.asset("images/love.jpg"),
                          ),
                          padding: const EdgeInsets.all(8.0),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomeScreen()),
                            );
                          }),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Hakkimda extends StatelessWidget {
  const Hakkimda({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Suğra Fatma Ecevit'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset('images/sugrapasta.jpg'),
            ),

            Expanded(
              flex: 1,
              child:Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Text("Suğra Ecevit 2 Şubat 1998 tarihinde İzmir'de dünyaya gelmiş olup, tam bir 'İzmir Kızı' güzelliğine sahiptir. "
                      "Bir insan İzmir'i en fazla ne kadar sevebilir ki? sorusunun yanıtını kendisiyle sadece 2 dakika muhabbet ettikten sonra alabilirsiniz. "
                      "İYTE'de Matematik Lisans eğitimi almaktadır, matematiğe olan aşkı daha küçük yaşlarda ortaya çıkmıştır. "
                      "3 aylık öğretmenlik tecrübesi ile öğrencelerine kendisini çok sevdirmiştir. İlerde çok iyi bir matematikçi olacaktır(Aha buraya yazıyorum). "
                      "Dostlarına yardım etmeyi adeta görev edinmiştir, hatta kavgaya adam çağıracaksanız ilk olarak kendisine ulaşabilirsiniz. "
                      "Suğra'nın olduğu bir ortamda topluluğun enerjisi Suğra'ya bağlıdır; o mutluysa herkes mutlu, o üzgünse herkes üzgündür. "
                      "Çok acayip bir enerjisi vardır, insanlarla kısa sürede samimi olup kendisini sevdirir. "
                      "Kriz anlarında bazen aşırı panik olsa da çoğunlukla soğuk kanlılığını korur ve çözümü bulur. "
                      "Trafikte usta bir şoför ve müthiş bir magandadır, onun önünde hatalı sollama yapmanız sonunuz olabilir. "
                      "Üşenmediği zamanlarda harika bir aşçıdır, şanslıysanız yılda birkaç defa yemek yapışına şahit olabilirsiniz. Şaka bir yana aç olan kimseye kıyamaz, "
                      "evde ne var ne yok önüne koyup karnını doyurtur. Bir anda gelen ıslak kek ve kısır perileri sayesinde size şahane bir altın günü menüsü sunabilir. "
                      "En sevdiği mevsim yazdır, çünkü deniz-kum-güneş-beach party. 24 saate kadar denizin içinde kalabilme potansiyeli vardır, "
                      "bu da onun bir deniz kızı olduğunu ispat etmektedir. Yüzüşü birçok kişiye ilham vermiş ve yüzme bilmeyenlere deva olmuştur. "
                      "Onun hakkında daha söylenecek çok şey vardır ama hepsini yazmaya gerek yoktur, onu tanıyanlar zaten çok iyi biliyordur."
                      "An itibari ile 24. yaşını doldurmuş olup iyi ki doğmuştur, iyi ki vardır, çok seviliyordur...",
                    style: TextStyle(
                      fontSize: 16.0, color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

