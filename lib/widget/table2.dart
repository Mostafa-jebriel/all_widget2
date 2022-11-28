import 'dart:math';
import 'package:flutter/material.dart';


class Table2 extends StatefulWidget {
  @override
  State<Table2> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Table2> {
  final DataTableSource _data = MyData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Table2"),
      ),
      body: Column(
        children: [
          PaginatedDataTable(
            source: _data,
            columns: const [
              DataColumn(label: Text('ID')),
              DataColumn(label: Text('Name')),
              DataColumn(label: Text('Price'))
            ],
            header: const Center(child: Text('My Products')),
            columnSpacing: 100,
            horizontalMargin: 60,
            rowsPerPage: 8,
          )
        ],
      ),

    );
  }
}

class MyData extends  DataTableSource{

  final List<Map<String, dynamic>> _data = List.generate(
      200,
          (index) => {
        "id": index,
        "title": "Item $index",
        "price": Random().nextInt(10000)
      });

  @override
  DataRow? getRow(int index) {
    return DataRow(cells: [
      DataCell(Text(_data[index]['id'].toString())),
      DataCell(Text(_data[index]["title"])),
      DataCell(Text(_data[index]["price"].toString())),
    ]);
  }

  @override
  // TODO: implement isRowCountApproximate
  bool get isRowCountApproximate => false;

  @override
  // TODO: implement rowCount
  int get rowCount => _data.length;

  @override
  // TODO: implement selectedRowCount
  int get selectedRowCount => 0;

}
