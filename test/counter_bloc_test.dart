import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:simple_bloc/counter_bloc.dart';
import 'package:simple_bloc/counter_event.dart';

main() {
  CounterBloc counterBloc;
  setUp(() {
    counterBloc = CounterBloc();
  });
  test('initial state', () {
    StreamBuilder(
      stream: counterBloc.counter,
      initialData: 0,
      builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
        expect(snapshot.data, 0);
        return Container();
      },
    );
  });

  test('add increment event', () {
    counterBloc.counterEventSink.add(EventIncrement());
    StreamBuilder(
      stream: counterBloc.counter,
      builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
        expect(snapshot.data, 1);
        return Container();
      },
    );
  });

  test('add decrement event', () {
    counterBloc.counterEventSink.add(EventDecrement());
    StreamBuilder(
      stream: counterBloc.counter,
      builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
        expect(snapshot.data, -1);
        return Container();
      },
    );
  });
}
