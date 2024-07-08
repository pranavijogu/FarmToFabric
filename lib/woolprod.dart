import 'package:flutter/material.dart';
import 'package:flutter_application_1/api.dart';
import 'package:flutter_application_1/marketplace_raw.dart';

class MyProdDisplay1 extends StatefulWidget {
  const MyProdDisplay1({Key? key}) : super(key: key);

  @override
  State<MyProdDisplay1> createState() => _MyProdDisplay1State();
}

class _MyProdDisplay1State extends State<MyProdDisplay1> {
  late Future<List<ProductRaw>> wool;

  @override
  void initState() {
    super.initState();
    wool = Api.getwool();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 34, 183, 61),
        title: Row(
          children: [
            const FlutterLogo(),
            const SizedBox(width: 12.0),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.white,
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    hintText: 'Search...',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(8.0),
                  ),
                ),
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: FutureBuilder<List<ProductRaw>>(
        future: wool,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            List<ProductRaw> woolData = snapshot.data!;
            return ListView.builder(
              itemCount: woolData.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.all(8.0),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Default Wool Type',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Container(
                          height: 150,
                          width: double.infinity,
                          color: Colors.grey,
                        ),
                        const SizedBox(height: 30.0),
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.yellow[800],
                            ),
                            const SizedBox(width: 5),
                            const Text("4"),
                          ],
                        ),
                        const SizedBox(height: 10.0),
                        Text(
                          'Price: ${woolData[index].price1 ?? 'null'}',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 5.0),
                        Text(
                          'Description: ${woolData[index].prodisc ?? 'No Description'}',
                          style: const TextStyle(fontSize: 16.0),
                        ),
                        const SizedBox(height: 5.0),
                        Text(
                          'Sheep Breed: ${woolData[index].sheepbreed1 ?? 'Unknown'}',
                          style: const TextStyle(fontSize: 18),
                        ),
                        Text(
                          'Colour: ${woolData[index].colour1 ?? 'Unknown'}',
                          style: const TextStyle(fontSize: 18),
                        ),
                        Text(
                          'Weight: ${woolData[index].weight1 ?? 'Unknown'}',
                          style: const TextStyle(fontSize: 18),
                        ),
                        const Text(
                          'Services done: shearing',
                          style: TextStyle(fontSize: 18),
                        ),
                        const Text(
                          'Fibre Characteristics: strong',
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(
                          'Disease: ${woolData[index].disease ?? 'No Description'}',
                          style: const TextStyle(fontSize: 16.0),
                        ),
                        const SizedBox(height: 5.0),
                        Text(
                          'output: ${woolData[index].output ?? 'No Description'}',
                          style: const TextStyle(fontSize: 16.0),
                        ),
                        const SizedBox(height: 5.0),
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center(child: Text('No data available.'));
          }
        },
      ),
    );
  }
}
