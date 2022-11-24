

import 'package:flutter/material.dart';

class TablePage extends StatefulWidget {


  @override
  State<TablePage> createState() => _TableState();
}

class _TableState extends State<TablePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Table"),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Table(
            border: TableBorder.all(color: Colors.black),
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            children: [
              TableRow(
                decoration: BoxDecoration(color: Colors.redAccent),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Text("Title 1")),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Text("Title 2")),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Text("Title 3")),
                  ),
                ]
              ),
              ...List.generate(20, (index) => TableRow(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Text("item 1")),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Text("item 2")),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Text("item 3")),
                  ),
                ]
              )
              ).toList(),
            ],
          ),
        ),
      ),
    );
  }
}
