import 'package:flutter/material.dart';
import 'package:flutter_reorderable_grid_view/entities/order_update_entity.dart';
import 'package:flutter_reorderable_grid_view/widgets/widgets.dart';

enum ReorderableType {
  gridView,
  gridViewCount,
  gridViewExtent,
  gridViewBuilder,
}

class gridViewpage extends StatefulWidget {
  @override
  State<gridViewpage> createState() => _MyAppState();
}

class _MyAppState extends State<gridViewpage> {
  static const _startCounter = 100;
  final lockedIndices = <int>[];

  int keyCounter = _startCounter;
  List<int> children = List.generate(_startCounter, (index) => index);
  ReorderableType reorderableType = ReorderableType.gridView;

  var _scrollController = ScrollController();
  var _gridViewKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: Column(
            children: [
              ChangeChildrenBar(
                onTapAddChild: () {
                  setState(() {
                    // children = children..add(keyCounter++);
                    children.insert(0, keyCounter++);
                  });
                },
                onTapRemoveChild: () {
                  if (children.isNotEmpty) {
                    setState(() {
                      // children = children..removeLast();
                      children.removeAt(0);
                    });
                  }
                },
                onTapClear: () {
                  if (children.isNotEmpty) {
                    setState(() {
                      children = <int>[];
                    });
                  }
                },
                onTapUpdateChild: () {
                  if (children.isNotEmpty) {
                    children[0] = 999;
                    setState(() {
                      children = children;
                    });
                  }
                },
                onTapSwap: () {
                  _handleReorder([
                    const OrderUpdateEntity(oldIndex: 0, newIndex: 1),
                  ]);
                },
              ),
              DropdownButton<ReorderableType>(
                value: reorderableType,
                icon: const Icon(Icons.arrow_downward),
                iconSize: 24,
                elevation: 16,
                itemHeight: 60,
                underline: Container(
                  height: 2,
                  color: Colors.white,
                ),
                onChanged: (ReorderableType? reorderableType) {
                  setState(() {
                    _scrollController = ScrollController();
                    _gridViewKey = GlobalKey();
                    this.reorderableType = reorderableType!;
                  });
                },
                items: ReorderableType.values.map((e) {
                  return DropdownMenuItem<ReorderableType>(
                    value: e,
                    child: Text(e.toString()),
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),
              Expanded(child: _getReorderableWidget()),
            ],
          ),
        ),
      ),
    );
  }

  void _handleReorder(List<OrderUpdateEntity> onReorderList) {
    for (final reorder in onReorderList) {
      final child = children.removeAt(reorder.oldIndex);
      children.insert(reorder.newIndex, child);
    }
    setState(() {});
  }

  Widget _getReorderableWidget() {
    final generatedChildren = List<Widget>.generate(
      children.length,
      (index) => Container(
        key: Key(children[index].toString()),
        decoration: BoxDecoration(
          color: lockedIndices.contains(index) ? Colors.black : Colors.white,
        ),
        height: 100.0,
        width: 100.0,
        child: Center(
          child: Text(
            'test ${children[index]}',
            style: const TextStyle(),
          ),
        ),
      ),
    );

    switch (reorderableType) {
      case ReorderableType.gridView:
        return ReorderableBuilder(
          key: Key(_gridViewKey.toString()),
          children: generatedChildren,
          onReorder: _handleReorder,
          lockedIndices: lockedIndices,
          onDragStarted: _handleDragStarted,
          onDragEnd: _handleDragEnd,
          scrollController: _scrollController,
          builder: (children) {
            return GridView(
              key: _gridViewKey,
              controller: _scrollController,
              children: children,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                mainAxisSpacing: 4,
                crossAxisSpacing: 8,
              ),
            );
          },
        );

      case ReorderableType.gridViewCount:
        return ReorderableBuilder(
          key: Key(_gridViewKey.toString()),
          children: generatedChildren,
          onReorder: _handleReorder,
          lockedIndices: lockedIndices,
          scrollController: _scrollController,
          builder: (children) {
            return GridView.count(
              key: _gridViewKey,
              controller: _scrollController,
              children: children,
              crossAxisCount: 3,
            );
          },
        );
      case ReorderableType.gridViewExtent:
        return ReorderableBuilder(
          key: Key(_gridViewKey.toString()),
          children: generatedChildren,
          onReorder: _handleReorder,
          lockedIndices: lockedIndices,
          scrollController: _scrollController,
          builder: (children) {
            return GridView.extent(
              key: _gridViewKey,
              controller: _scrollController,
              children: children,
              maxCrossAxisExtent: 200,
              padding: EdgeInsets.zero,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
            );
          },
        );

      case ReorderableType.gridViewBuilder:
        return ReorderableBuilder(
          children: generatedChildren,
          onReorder: _handleReorder,
          lockedIndices: lockedIndices,
          onDragStarted: () {
            const snackBar = SnackBar(
              content: Text('Dragging has started!'),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          },
          scrollController: _scrollController,
          builder: (children) {
            return GridView.builder(
              key: _gridViewKey,
              controller: _scrollController,
              itemCount: children.length,
              itemBuilder: (context, index) {
                return children[index];
              },
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                mainAxisSpacing: 4,
                crossAxisSpacing: 8,
              ),
            );
          },
        );
    }
  }

  void _handleDragStarted() {
    ScaffoldMessenger.of(context).clearSnackBars();
    const snackBar = SnackBar(
      content: Text('Dragging has started!'),
      duration: Duration(milliseconds: 1000),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void _handleDragEnd() {
    ScaffoldMessenger.of(context).clearSnackBars();
    const snackBar = SnackBar(
      content: Text('Dragging was finished!'),
      duration: Duration(milliseconds: 1000),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}

class ChangeChildrenBar extends StatelessWidget {
  final VoidCallback onTapUpdateChild;
  final VoidCallback onTapAddChild;
  final VoidCallback onTapRemoveChild;
  final VoidCallback onTapClear;
  final VoidCallback onTapSwap;

  const ChangeChildrenBar({
    required this.onTapUpdateChild,
    required this.onTapAddChild,
    required this.onTapRemoveChild,
    required this.onTapClear,
    required this.onTapSwap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Wrap(
          spacing: 20,
          runSpacing: 20,
          children: [
            ContainerButton(
              onTap: onTapUpdateChild,
              icon: Icons.find_replace,
            ),
            ContainerButton(
              onTap: onTapAddChild,
              icon: Icons.add,
            ),
            ContainerButton(
              onTap: onTapRemoveChild,
              icon: Icons.remove,
            ),
            ContainerButton(
              onTap: onTapClear,
              icon: Icons.delete,
            ),
            ContainerButton(
              onTap: onTapSwap,
              icon: Icons.swap_horiz,
            ),
          ],
        ),
      ),
    );
  }
}

class ContainerButton extends StatelessWidget {
  final GestureTapCallback onTap;
  final IconData icon;

  const ContainerButton({
    required this.onTap,
    required this.icon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.lightBlue,
        height: 50,
        width: 50,
        child: Center(
          child: Icon(
            icon,
            size: 20,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
