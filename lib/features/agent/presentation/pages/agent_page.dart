import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:valguide3/features/agent/presentation/widgets/agent_widgets.dart';

import '../providers/agent_provider.dart';

class AgentPage extends StatefulWidget {
  const AgentPage({Key? key}) : super(key: key);

  @override
  State<AgentPage> createState() => _AgentPageState();
}

class _AgentPageState extends State<AgentPage> {
  @override
  void initState() {
    Provider.of<AgentProvider>(context, listen: false).eitherFailureOrAgent();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AgentWidget();
  }
}
