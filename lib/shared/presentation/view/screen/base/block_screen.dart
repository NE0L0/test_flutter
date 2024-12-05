//ignore_for_file: no_logic_in_create_state
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class BlocScreenWidget<B extends Bloc, S> extends StatelessWidget {
  const BlocScreenWidget({super.key});
  final isBlocLazy = false;

  B createBloc(BuildContext context);
  BlocScreenContentState<B, S> createState();

  Widget buildScaffold({Widget? child}) => Scaffold(
    body: child,
  );

  Widget buildBlocProvider({required Widget child}) => BlocProvider(
    lazy: isBlocLazy,
    create: createBloc,
    child: child,
  );

  Widget getScreenContent() => BlocScreenContentWidget(stateBuilder: createState);

  BlocScreenContentWidget createContentWidget(BuildContext context) {
    final state = createState();
    final widget = BlocScreenContentWidget<B, S>(stateBuilder: () => state);
    return widget;
  }

  @override
  Widget build(BuildContext context)  => buildScaffold(
    child: buildBlocProvider(
      child: getScreenContent(),
    ),
  );
}

class BlocScreenContentWidget<B extends Bloc, S> extends StatefulWidget {
  const BlocScreenContentWidget({super.key, required this.stateBuilder});

  final BlocScreenContentState<B, S> Function() stateBuilder;

  @override
  BlocScreenContentState<B, S> createState() => stateBuilder();
}

abstract class BlocScreenContentState<B extends Bloc, S> extends State<BlocScreenContentWidget> {
  B get bloc => BlocProvider.of<B>(context);

  Widget buildContent(BuildContext context, S state);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: bloc,
      builder: (context, state) => buildContent(context, state as S),
    );
  }
}
