
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_flutter/viewmodel/counter_viewmodel.dart';
import 'package:stacked/stacked.dart';

class Counter extends StatefulWidget {
  const Counter({Key? key}) : super(key: key);

  @override
  _CounterState createState() {
    return _CounterState();
  }
}

class _CounterState extends State<Counter> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CounterViewModel>.reactive(
        builder: (context, viewmodel, child) => Scaffold(
          appBar: AppBar(
            title: Text("Counter"),
          ),
          floatingActionButton: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                  child: Icon(Icons.add_circle),
                  onPressed: () {
                    return viewmodel.increment();
                  }
              ),
              FloatingActionButton(
                  child: Icon(Icons.exposure_minus_1),
                  onPressed: () {
                    return viewmodel.decrement();
                  }
              ),
            ],
          ),
          body: Container(
            child: Center(
              child: Text(viewmodel.getCounter.toString()),
            ),
          ),
        ),
        viewModelBuilder: () => CounterViewModel()
    );
  }

  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
