import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: const RowColumnPage(),
    );
  }
}

class RowColumnPage extends StatefulWidget {
  const RowColumnPage({Key? key}) : super(key: key);

  @override
  State<RowColumnPage> createState() => _RowColumnPageState();
}

class _RowColumnPageState extends State<RowColumnPage> {
  String _teksKotakPink = 'What image is that?';
  int _counter = 0;

  void _cekJawaban(String jawaban) {
    setState(() {
      if (jawaban == 'Scenery') {
        _teksKotakPink = 'Yapp Benar! Ini adalah pemandangan alam.';
        _counter++;
      } else {
        _teksKotakPink = 'Teeettt! Salah, coba lihat gambarnya lagi.';
      }
    });
  }

  void _tambahManual() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double screenWidth = mediaQueryData.size.width;

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text(
          'My First App',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            letterSpacing: 2.0,
          ),
        ),
        backgroundColor: Colors.teal[500],
        centerTitle: true,
        elevation: 4.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: AspectRatio(
                aspectRatio: 1.0,
                child: Container(
                  width: screenWidth,
                  margin: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
                  padding: const EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                    color: Colors.indigo[50],
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: Image.network(
                      'https://picsum.photos/200',
                      fit: BoxFit.cover,
                      width: 500,
                    ),
                  ),
                ),
              ),
            ),

            //KOTAK PERTANYAAN
            Container(
              width: screenWidth,
              margin: const EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 10.0),
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Colors.teal[100],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                _teksKotakPink,
                style: const TextStyle(
                  fontSize: 18,
                  fontStyle: FontStyle.italic,
                  color: Colors.teal,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
            ),

            //KOTAK TOMBOL JAWABAN
            Container(
              width: screenWidth,
              padding: const EdgeInsets.all(20.0),
              margin: const EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
              decoration: BoxDecoration(
                color: Colors.orange[100],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  GestureDetector(
                    onTap: () => _cekJawaban('Food'),
                    child: Column(children: const [
                      Icon(Icons.food_bank, size: 32, color: Colors.deepOrange),
                      SizedBox(height: 8),
                      Text("Food", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.deepOrange))
                    ]),
                  ),
                  GestureDetector(
                    onTap: () => _cekJawaban('Scenery'),
                    child: Column(children: const [
                      Icon(Icons.landscape, size: 32, color: Colors.deepOrange),
                      SizedBox(height: 8),
                      Text("Scenery", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.deepOrange))
                    ]),
                  ),
                  GestureDetector(
                    onTap: () => _cekJawaban('People'),
                    child: Column(children: const [
                      Icon(Icons.people, size: 32, color: Colors.deepOrange),
                      SizedBox(height: 8),
                      Text("People", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.deepOrange))
                    ]),
                  ),
                ],
              ),
            ),

            // --- KOTAK COUNTER ---
            CounterCard(
              angkaCounter: _counter,
              fungsiTambah: _tambahManual,
            ),
          ],
        ),
      ),
    );
  }
}

// WIDGET COUNTER

class CounterCard extends StatelessWidget {
  final int angkaCounter;
  final VoidCallback fungsiTambah;

  const CounterCard({
    super.key,
    required this.angkaCounter,
    required this.fungsiTambah,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 20.0),
      padding: const EdgeInsets.all(20.0),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.indigo[100],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Counter here: $angkaCounter",
            style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.indigo
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.indigo[300],
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.all(2.0),
            child: IconButton(
              onPressed: fungsiTambah,
              icon: const Icon(Icons.add, color: Colors.white, size: 20),
            ),
          ),
        ],
      ),
    );
  }
}