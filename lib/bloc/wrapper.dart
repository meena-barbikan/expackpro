import 'package:expackpro/bloc/increment_bloc.dart';
import 'package:expackpro/bloc/increment_event.dart';
import 'package:expackpro/bloc/increment_state.dart';
import 'package:expackpro/bloc/login/login_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'login/login_screen.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({super.key});

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    // return MultiBlocProvider(providers: [
    //   BlocProvider<IncrementBloc>(
    //     create: (BuildContext context) => IncrementBloc(),
    //   ),
    //   BlocProvider<LoginBloc>(
    //     create: (BuildContext context) => LoginBloc(),
    //   )
    // ], child: LoginScreen());
    return BlocProvider<IncrementBloc>(
        create: (BuildContext context) => IncrementBloc(),
        child: incrementstate());
  }
}

class incrementstate extends StatefulWidget {
  const incrementstate({super.key});

  @override
  State<incrementstate> createState() => _incrementstateState();
}

class _incrementstateState extends State<incrementstate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Column(
        children: [
          FloatingActionButton(
            onPressed: () {
              BlocProvider.of<IncrementBloc>(context).add(AddEvent());
            },
            child: Icon(Icons.add),
          ),
          const SizedBox(
            height: 10,
          ),
          FloatingActionButton(
            onPressed: () {
              BlocProvider.of<IncrementBloc>(context).add(Subtract());
            },
            child: Icon(Icons.remove),
          ),
        ],
      ),
      body: BlocBuilder<IncrementBloc, IncrementState>(
          builder: (BuildContext context, state) {
        return Center(
          child: Text("${state.counter}"),
        );
      }),
    );
  }
}
