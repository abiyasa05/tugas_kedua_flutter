import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //variabel berubah
  double _inputUser = 0;
  double _kelvin = 0;
  double _reamur = 0;

  // Membuat controller untuk TextFormField
  TextEditingController _inputController = TextEditingController();

  void _hitungKonversi() {
    // Ambil input dari controller
    double celcius = double.tryParse(_inputController.text) ?? 0;

    // Hitung konversi ke Kelvin
    double kelvin = celcius + 273.15;

    // Hitung konversi ke Reamur
    double reamur = celcius * 0.8;

    // Update state dengan hasil konversi
    setState(() {
      _kelvin = kelvin;
      _reamur = reamur;
    });
  }

  @override
  void dispose() {
    // Cleanup controller ketika widget di dispose
    _inputController.dispose();
    super.dispose();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Konverter Suhu"),
        ),
        body: Container(
          margin: EdgeInsets.all(8),
          child: Column(
            children: [
              TextFormField(
                controller:
                    _inputController, // Menghubungkan controller ke TextFormField
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                ],
                decoration: InputDecoration(
                  hintText: 'Masukkan Suhu Dalam Celcius',
                ),
              ),
              SizedBox(
                height: 16,
              ), // Spasi vertikal antara TextFormField dan Row
              Spacer(), // Spacer untuk mengatur "Suhu dalam Kelvin" dan "Suhu dalam Reamur" di tengah
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Center(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.blue,
                        ),
                        padding: EdgeInsets.all(8),
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            style: TextStyle(
                              color: Colors.white,
                              fontSize:
                                  18, // Sesuaikan dengan ukuran yang Anda inginkan
                            ),
                            children: [
                              TextSpan(
                                text: 'Suhu dalam Kelvin:\n',
                              ),
                              TextSpan(
                                text: '${_kelvin.toStringAsFixed(2)}',
                                style: TextStyle(
                                  fontSize:
                                      24, // Sesuaikan dengan ukuran yang Anda inginkan
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: Center(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.blue,
                        ),
                        padding: EdgeInsets.all(8),
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            style: TextStyle(
                              color: Colors.white,
                              fontSize:
                                  18, // Sesuaikan dengan ukuran yang Anda inginkan
                            ),
                            children: [
                              TextSpan(
                                text: 'Suhu dalam Reamur:\n',
                              ),
                              TextSpan(
                                text: '${_reamur.toStringAsFixed(2)}',
                                style: TextStyle(
                                  fontSize:
                                      24, // Sesuaikan dengan ukuran yang Anda inginkan
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Spacer(), // Spacer untuk mengatur tampilan tombol di bagian bawah
              ElevatedButton(
                onPressed:
                    _hitungKonversi, // Panggil fungsi saat tombol ditekan
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  onPrimary: Colors.white,
                  minimumSize: Size(double.infinity, 50),
                ),
                child: Text('Konversi Suhu'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
