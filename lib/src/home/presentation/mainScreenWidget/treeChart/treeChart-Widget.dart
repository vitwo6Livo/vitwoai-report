import 'package:flutter/material.dart';
import 'package:graphview/GraphView.dart';
import 'package:vitwoai_report/golobal-Widget/customPage-Route.dart';
import 'package:vitwoai_report/src/home/presentation/mainScreenWidget/pieChart/pieChartDetails.dart';
import 'package:vitwoai_report/src/settings/texts.dart';

class TreeChartWidget extends StatefulWidget {
  const TreeChartWidget({super.key});

  @override
  State<TreeChartWidget> createState() => _TreeChartWidgetState();
}

class _TreeChartWidgetState extends State<TreeChartWidget> {
  // Initialize a Tree structure
  final Graph graph = Graph()..isTree = true;
  final BuchheimWalkerConfiguration builder = BuchheimWalkerConfiguration();

  @override
  void initState() {
    super.initState();

    final Node root = Node.Id('Parent');
    final Node child1 = Node.Id('Child 1');
    final Node child2 = Node.Id('Child 2');
    final Node subChild1 = Node.Id('SubChild 1');
    final Node subChild2 = Node.Id('SubChild 2');

    graph.addEdge(root, child1);
    graph.addEdge(root, child2);
    graph.addEdge(child1, subChild1);
    graph.addEdge(child2, subChild2);

    builder
      ..siblingSeparation = 50
      ..levelSeparation = 100
      ..subtreeSeparation = 75
      ..orientation = BuchheimWalkerConfiguration.ORIENTATION_TOP_BOTTOM;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    HandText.treeChartTitle,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Text(
                    HandText.treeChartSubTitle,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(fontSize: 10),
                  ),
                ],
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    CustomPageRoute(
                      child: const PieChartDetails(),
                      direction: AxisDirection.up,
                    ),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(1),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    border: Border.all(width: 1, color: Colors.grey),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.settings,
                        size: 15,
                      ),
                      Text(
                        HandText.settings,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        Center(
          child: InteractiveViewer(
            boundaryMargin: EdgeInsets.all(20),
            minScale: 0.1,
            maxScale: 2.0,
            child: GraphView(
              graph: graph,
              algorithm:
                  BuchheimWalkerAlgorithm(builder, TreeEdgeRenderer(builder)),
              paint: Paint()
                ..color = Colors.blue
                ..strokeWidth = 2
                ..style = PaintingStyle.stroke,
              builder: (Node node) {
                return rectangleWidget(node.key!.value);
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget rectangleWidget(String label) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: Colors.lightBlueAccent,
        boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 2)],
      ),
      child: Text(label, style: TextStyle(color: Colors.white)),
    );
  }
}
