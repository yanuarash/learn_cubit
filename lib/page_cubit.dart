import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_cubit/cubit_counter.dart';

class PageCubit extends StatefulWidget {
  const PageCubit({super.key});

  @override
  State<PageCubit> createState() => _PageCubitState();
}

class _PageCubitState extends State<PageCubit> {
  int counter = 0;
  int stateCounter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (_) => CounterCubit(),
          child: Column(
            children: [
              BlocConsumer<CounterCubit, Counter>(
                listener: (context, state) {
                  // listener dicall setelah rebuild widget selesai
                  // context
                  setState(() {
                    stateCounter = state.value!;
                  });
                },
                builder: (contextBloc, state) {
                  // builder dicall ditengah rebuild widget
                  // no-context
                  return Center(
                    child: Column(
                      children: [
                        Text("counter: ${state.value}"),
                        ElevatedButton(
                          onPressed: () {
                            contextBloc.read<CounterCubit>().increment();
                          },
                          child: const Text("Increment"),
                        )
                      ],
                    ),
                  );
                },
              ),
              Text("counter 2: $stateCounter"),
              ElevatedButton(
                  onPressed: () {
                    // setState(() {
                    //   counter++;
                    // });
                  },
                  child: Text("TEST BUTTON"))
            ],
          ),
        ),
      ),
    );
  }
}
