import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/map_provider.dart';
import '../widgets/map_widgets.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  @override
  void initState() {
    Provider.of<MapProvider>(context, listen: false).eitherFailureOrMap();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const MapWidget();
  }
}
