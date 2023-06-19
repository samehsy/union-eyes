import 'package:flutter/material.dart';

class LensesOrderScreen extends StatefulWidget {
  static const routeName = '/menu/lenses-order';

  @override
  _LensesOrderScreenState createState() => _LensesOrderScreenState();
}

class _LensesOrderScreenState extends State<LensesOrderScreen> {
  String? classLenses = '';
  String? typeLenses = '';

  String? spherical;
  String? cylinder;
  String? amount;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Directionality(
      textDirection: TextDirection.rtl,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              height: 470,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      height: 200,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'spherical',
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w400),
                                ),
                                Card(
                                  child: TextField(
                                    keyboardType: TextInputType.number,
                                    decoration: const InputDecoration(
                                      filled: true,
                                      fillColor: Colors.white,
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 3, color: Colors.black54),
                                      ),
                                    ),
                                    onChanged: (val) {
                                      spherical = val;
                                    },
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'cylinder',
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w400),
                                ),
                                Card(
                                  child: TextField(
                                    keyboardType: TextInputType.number,
                                    decoration: const InputDecoration(
                                      filled: true,
                                      fillColor: Colors.white,
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 3, color: Colors.black54),
                                      ),
                                    ),
                                    onChanged: (val) {
                                      cylinder = val;
                                    },
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'الكمية',
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w400),
                                ),
                                Card(
                                  child: TextField(
                                    keyboardType: TextInputType.number,
                                    decoration: const InputDecoration(
                                      filled: true,
                                      fillColor: Colors.white,
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 3, color: Colors.black54),
                                      ),
                                    ),
                                    onChanged: (val) {
                                      amount = val;
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Divider(
                      color: Color.fromARGB(255, 40, 55, 71),
                      thickness: 3,
                    ),
                    Container(
                      padding: const EdgeInsets.only(right: 5),
                      child: const Text(
                        ' صنف العدسة ',
                        style: TextStyle(
                          fontSize: 25,
                          fontFamily: 'Cairo',
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 243, 156, 18),
                        ),
                        textAlign: TextAlign.end,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          height: 50,
                          width: 200,
                          child: Directionality(
                            textDirection: TextDirection.rtl,
                            child: RadioListTile(
                              title: const Text(
                                'زجاج',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontSize: 22,
                                  fontFamily: 'Cairo',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              value: 'glasses',
                              groupValue: classLenses,
                              onChanged: (value) {
                                setState(() {
                                  classLenses = value;
                                  print(classLenses);
                                });
                              },
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          height: 50,
                          width: 200,
                          child: Directionality(
                            textDirection: TextDirection.rtl,
                            child: RadioListTile(
                              title: const Text(
                                'بلاستيك',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontSize: 22,
                                  fontFamily: 'Cairo',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              value: 'plastic',
                              groupValue: classLenses,
                              onChanged: (value) {
                                setState(
                                  () {
                                    classLenses = value;
                                    print(classLenses);
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Divider(
                      color: Color.fromARGB(255, 40, 55, 71),
                      thickness: 3,
                    ),
                    Container(
                      padding: const EdgeInsets.only(right: 5),
                      child: const Text(
                        '  نوع العدسة ',
                        style: TextStyle(
                          fontSize: 25,
                          fontFamily: 'Cairo',
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 243, 156, 18),
                        ),
                        textAlign: TextAlign.end,
                      ),
                    ),
                    Container(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              height: 50,
                              width: 200,
                              child: Directionality(
                                textDirection: TextDirection.rtl,
                                child: RadioListTile(
                                  title: const Text(
                                    'Com',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontFamily: 'Cairo',
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  value: 'comfort',
                                  groupValue: typeLenses,
                                  onChanged: (value) {
                                    setState(() {
                                      typeLenses = value;
                                      print(typeLenses);
                                    });
                                  },
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              height: 50,
                              width: 200,
                              child: Directionality(
                                textDirection: TextDirection.rtl,
                                child: RadioListTile(
                                  title: const Text(
                                    'Anti',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontFamily: 'Cairo',
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  value: 'Anti',
                                  groupValue: typeLenses,
                                  onChanged: (value) {
                                    setState(() {
                                      typeLenses = value;
                                      print(typeLenses);
                                    });
                                  },
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              height: 50,
                              width: 200,
                              child: Directionality(
                                textDirection: TextDirection.rtl,
                                child: RadioListTile(
                                  title: const Text(
                                    'BlueCut',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontFamily: 'Cairo',
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  value: 'bluecut',
                                  groupValue: typeLenses,
                                  onChanged: (value) {
                                    setState(() {
                                      typeLenses = value;
                                      print(typeLenses);
                                    });
                                  },
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              height: 50,
                              width: 200,
                              child: Directionality(
                                textDirection: TextDirection.rtl,
                                child: RadioListTile(
                                  title: const Text(
                                    'زجاج عادي',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontFamily: 'Cairo',
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  value: 'glassnormal',
                                  groupValue: typeLenses,
                                  onChanged: (value) {
                                    setState(() {
                                      typeLenses = value;
                                      print(typeLenses);
                                    });
                                  },
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              height: 50,
                              width: 200,
                              child: Directionality(
                                textDirection: TextDirection.rtl,
                                child: RadioListTile(
                                  title: const Text(
                                    'بلاستيك عادي',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontFamily: 'Cairo',
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  value: 'plasticnormal',
                                  groupValue: typeLenses,
                                  onChanged: (value) {
                                    setState(() {
                                      typeLenses = value;
                                      print(typeLenses);
                                    });
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            ElevatedButton(
              child: const Text(
                'أضف إلى السلة',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 25,
                    fontFamily: 'Cairo',
                    fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                /* Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) {
                    return Right();
                  }),
                );*/
              },
            )
          ],
        ),
      ),
    ));
  }
}
