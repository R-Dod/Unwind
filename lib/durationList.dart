import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DurationDialog extends StatefulWidget {
  final Function(int value) onRadioSelection;
  const DurationDialog({Key? key, required this.onRadioSelection}) : super(key: key);

  @override
  State<DurationDialog> createState() => _DurationDialogState();
}

class _DurationDialogState extends State<DurationDialog> {
  double screenWidth = 0;
  List<int> times = [2, 5, 10, 15, 20, 25, 30];
  int _time = 0;

  setSelectedRadio(int val) {
    setState(() {
      _time = val;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _time = times[0];
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Select your meditation duration\n',
            style: TextStyle(
              fontSize: screenWidth * 0.04,
            ),
            textAlign: TextAlign.center,
          ),
          ListView.builder(
            shrinkWrap: true,
              itemCount: times.length,
              itemBuilder: (context, index) => RadioListTile(
                  value: times[index],
                  title: Text('${times[index]} minutes'),
                  groupValue: _time,
                  onChanged: (val) {
                    setSelectedRadio(val as int);
                    widget.onRadioSelection(_time);
                  })),
        ],
      ),
    );
  }
}
