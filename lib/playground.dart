import 'package:flutter/material.dart';

class ExpansionTileWidget extends StatefulWidget {
  const ExpansionTileWidget({Key? key}) : super(key: key);

  @override
  State<ExpansionTileWidget> createState() => _ExpansionTileWidgetState();
}

class _ExpansionTileWidgetState extends State<ExpansionTileWidget> {
  List<bool> _isCardExpanded = [false, false, false, false, false];
  bool _isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
              height: MediaQuery.of(context).size.height,
              child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) => GestureDetector(
                        onTap: () async {
                          setState(() {
                            _isExpanded = !_isExpanded;
                          });
                          _onClickCard(index);
                          // if (_isCardExpanded[index] == true) {
                          //   setState(() {
                          //     _isCardExpanded[index] = !_isCardExpanded[index];
                          //     print(_isCardExpanded[index]);
                          //   });
                          // } else {
                          //   await Future.delayed(
                          //       const Duration(milliseconds: 1000));
                          //   setState(() {
                          //     _isCardExpanded[index] = !_isCardExpanded[index];
                          //     print(_isCardExpanded[index]);
                          //   });
                          // }
                        },
                        child: AnimatedContainer(
                          margin: const EdgeInsets.all(8),
                          padding: const EdgeInsets.all(8),
                          duration: const Duration(seconds: 1),
                          curve: Curves.easeInOut,
                          height: _isExpanded ? 300 : 100,
                          width: 100,
                          color: Colors.grey,
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              ///title content
                              Positioned(
                                  child: Container(
                                height: 100,
                                width: double.maxFinite,
                                color: Colors.red,
                              )),

                              ///content
                              _isCardExpanded[index]
                                  ? Positioned(
                                      bottom: 0,
                                      left: 30,
                                      child: AnimatedOpacity(
                                        duration: const Duration(seconds: 5),
                                        curve: Curves.easeInOut,
                                        opacity: _isCardExpanded[index] ? 1 : 0,
                                        child: Center(
                                          child: Container(
                                            height: 180,
                                            width: 300,
                                            color: Colors.blue,
                                          ),
                                        ),
                                      ),
                                    )
                                  : AnimatedContainer(
                                      duration: const Duration(milliseconds: 1),
                                      curve: Curves.easeInOut,
                                      child: Positioned(
                                          bottom: 0,
                                          right: 0,
                                          child: Container()),
                                    ),

                              ///chevron
                              AnimatedPositioned(
                                  duration: const Duration(seconds: 1),
                                  curve: Curves.easeInOut,
                                  right: -10,
                                  top: _isExpanded ? 150 : 20,
                                  child: AnimatedContainer(
                                    duration: const Duration(seconds: 1),
                                    curve: Curves.easeInOut,
                                    height: 30,
                                    width: 20,
                                    color: _isExpanded
                                        ? Colors.yellowAccent
                                        : Colors.green,
                                  )),
                            ],
                          ),
                        ),
                      ))),
        ],
      ),
    );
  }

  void _onClickCard(int index) {
    for (int i = 0; i < _isCardExpanded.length; i++) {
      if (i == index) {
        setState(() {
          _isCardExpanded[i] = !_isCardExpanded[i];
          // _isExpanded = true;
        });
      } else {
        setState(() {
          _isCardExpanded[i] = false;
          //  _isExpanded = false;
        });
      }
    }
  }
}
