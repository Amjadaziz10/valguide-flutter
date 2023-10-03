import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:valguide3/features/gun/presentation/widgets/gun_widgets.dart';

import '../providers/gun_provider.dart';

class GunPage extends StatefulWidget {
  const GunPage({Key? key}) : super(key: key);

  @override
  State<GunPage> createState() => _GunPageState();
}

class _GunPageState extends State<GunPage> {
  @override
  void initState() {
    Provider.of<GunProvider>(context, listen: false).eitherFailureOrGun();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const GunWidget();
  }
}
