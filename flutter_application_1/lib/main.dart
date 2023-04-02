//import 'dart:html';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';

void main() async {
WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp(
options: DefaultFirebaseOptions.currentPlatform,
);
runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        //ъchildren:[
        //  new FloatingActionButton(onPressed: () ),
       // ]
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
   
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page  ILYA AGISHEV'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  
 // get email => null;
  
 // get password => null;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

  
            const Padding(padding:EdgeInsets.symmetric(horizontal:8, vertical: 16), 
            child: TextField( 
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Введите Почту',
              ),
            ),
            
            ),
             const Padding(padding:EdgeInsets.symmetric(horizontal:8, vertical: 16), 
            child: TextField( maxLength: 10, 
              decoration: InputDecoration( 
                border:OutlineInputBorder(),
                hintText: 'Введите Пароль',
              ),
            ),
            
            ),

             TextButton(
  style: ButtonStyle(
    foregroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 255, 0, 191)),
  ),
  onPressed: () async {final auth = FirebaseAuth.instance;
try {
UserCredential userCredential = await auth.createUserWithEmailAndPassword(
email: "email@example.com",
password: "password",
);
} on FirebaseAuthException catch (e) {
if (e.code == 'weak-password') {
print('Пароль слишком слаб. ');
} else if (e.code == 'email-already-in-use') {
print('Данная почта уже занята. ');
}
} catch (e){
print(e);
} 
FirebaseAuth.instance
.createUserWithEmailAndPassword(
email: "Ilya.Agishev.2113@gmail.com",
password: "Kas1518900") .then(
(value) {
print(value.user?.email);
print(value.user?.uid);
},
); },
  child: Text('Зарегистрироваться'),
),
 TextButton(
  style: ButtonStyle(
    foregroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 45, 0, 244)),
  ),
  onPressed:  () async { FirebaseAuth.instance
.signInWithEmailAndPassword(
email: "Ilya.Agishev.2113@gmail.com",
password: "Kas1518900") .then(
(value) {
print(value.user?.email);
print(value.user?.uid);
print("Авторизация успешно пройдена!");
},
);},
  child: Text('Авторизоваться'),
),
            //const Text(
            //  'You have pushed the button this many times:',
           // ),
           // Text(
           //   '$_counter',
          //    style: Theme.of(context).textTheme.headline4,
         //   ),
          ],
        ),
      ),

      
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
       // child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
