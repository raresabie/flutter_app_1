import 'package:flutter/material.dart';
import 'package:flutter_app_1/screens/ChildToParent19.dart';
import 'package:flutter_app_1/screens/SecondPage.dart';
import 'package:flutter_app_1/screens/ThirdPage.dart';
import 'package:flutter_app_1/screens/fourth.dart';
import 'dart:async';
import 'dart:math';

import 'package:flutter_app_1/screens/homepage.dart';

void main() {
  var firstApp = new MaterialApp(home: new MyApp(),);
  var secondApp = MyApp2();
  runApp(secondApp);
}

class MyApp2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Navigation",
      routes: <String, WidgetBuilder >{
        "/home" : (BuildContext context) => Homepage(),
        "/second" : (BuildContext context) => SecondPage(name: "",),
        "/third" : (BuildContext context) => ThirdPage(),
        "/fourth" : (BuildContext context) => FourthPage(),
        "/childToParent" : (BuildContext context) => ChildToParent19(),
      }, //all available pages
      home: Homepage(), //first page displayed
    );
  }

}


class MyApp extends StatefulWidget {
  int currentTutorial = 0;

  List tutorials = <State<MyApp>>[
    StepperNameAgeState(),
    GridViewState(),
    StepperState(),
    TabBarViewState(),
    ExtensionPanelState(),
    TimeSliderState(),
    _ChipState(),
    _PopUpMenuState()
  ];

  @override
  State<MyApp> createState() => tutorials[currentTutorial];
}

class StepperNameAgeState extends State<MyApp> {
  int currentStep = 0;
  List<Step> steps = <Step>[];
  String name;
  String age;

  TextEditingController ageController;
  TextEditingController nameController;

  Step lastStep;

  @override
  void initState() {
    nameController = TextEditingController();
    ageController = TextEditingController();

    steps = [
      Step(
          title: Text("inserisci nome"),
          isActive: true,
          content: Container(
            child: Center(
              child: TextField(
                decoration: InputDecoration(hintText: "enter your name"),
                controller: nameController,
              ),
            ),
          )),
      Step(
          title: Text("inserisci età"),
          isActive: true,
          content: Container(
            child: Center(
              child: TextField(
                decoration: InputDecoration(hintText: "enter your age"),
                controller: ageController,
                keyboardType: TextInputType.number,
              ),
            ),
          )),
      Step(
          title: Text("i tuoi dati"),
          isActive: true,
          content: Container(
            child: Center(child: Text("nome : ${name},\n età : ${age}")),
          ))
    ];
  }

  void onStepTapped(int index) {
    setState(() {
      currentStep = index;
    });
  }

  void onStepContinue() {
    if (currentStep != steps.length - 1) {
      setState(() {
        if (currentStep == 1) {
          name = nameController.text;
          age = ageController.text;
          print(age);
          print(name);
        }
        currentStep++;
      });
    }
  }

  void onStepCancel() {
    setState(() {
      if (currentStep != 0) currentStep--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("insert your data"),
      ),
      body: Container(
        padding: EdgeInsets.all(32.0),
        child: Center(
          child: Stepper(
            steps: [
              Step(
                  title: Text("inserisci nome"),
                  isActive: true,
                  content: Container(
                    child: Center(
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: "enter your name"),
                        controller: nameController,
                      ),
                    ),
                  )),
              Step(
                  title: Text("inserisci età"),
                  isActive: true,
                  content: Container(
                    child: Center(
                      child: TextField(
                        decoration: InputDecoration(hintText: "enter your age"),
                        controller: ageController,
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  )),
              Step(
                  title: Text("i tuoi dati"),
                  isActive: true,
                  content: Container(
                    child: Center(
                        child: Text("nome : ${name},\n età : ${age}")),
                  ))
            ],
            onStepTapped: onStepTapped,
            onStepContinue: onStepContinue,
            onStepCancel: onStepCancel,
            type: StepperType.vertical,
            currentStep: currentStep,
          ),
        ),
      ),
    );
  }
}

class Area {
  int index;
  String name;
  Color color;

  Area({this.index: -1, this.name: "Area", this.color: Colors.lightBlueAccent});
}

class GridViewState extends State<MyApp> {
  int location;
  List<Area> areas;

  @override
  void initState() {
    areas = <Area>[];

    for (int i = 0; i < 16; i++) {
      areas.add(Area(index: i, name: "Area ${i}"));
    }

    var rng = new Random();
    location = rng.nextInt(areas.length);
  }

  Widget generate(int index) {
    return GridTile(
        child: Container(
          padding: EdgeInsets.all(5.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(primary: areas[index].color),
            onPressed: () => onClicked(index),
            child: Text(
              areas[index].name,
              textAlign: TextAlign.center,
            ),
          ),
        ));
  }

  void onClicked(int index) {
    setState(() {
      if (index == location) {
        areas[index].color = Colors.green;
      } else {
        areas[index].color = Colors.red;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
// TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("GridItemView"),
      ),
      body: Container(
        padding: EdgeInsets.all(32.0),
        child: Center(
          child: GridView.count(
            crossAxisCount: 4,
            children: List<Widget>.generate(16, (index) => generate(index)),
          ),
        ),
      ),
    );
  }
}

class StepperState extends State<MyApp> {
  List<Step> steps;
  int currentState;

  void stepContinue() {
    setState(() {
      currentState++;
      if (currentState >= steps.length) currentState = steps.length - 1;
    });
  }

  void stepCancel() {
    setState(() {
      currentState--;
      if (currentState == 0) currentState = 0;
    });
  }

  void stepTap(int index) {
    setState(() {
      currentState = index;
    });
  }

  @override
  void initState() {
    currentState = 0;
    steps = <Step>[
      Step(title: Text("Title 1"), content: Text("content 1 "), isActive: true),
      Step(
          title: Text("Title 2"), content: Text("content 2 "), isActive: false),
      Step(title: Text("Title 3"), content: Text("content 3 "), isActive: true),
      Step(title: Text("Title 4"), content: Text("content 4 "), isActive: true),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stepper state"),
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Center(
            child: Stepper(
              steps: steps,
              type: StepperType.vertical,
              currentStep: currentState,
              onStepCancel: stepCancel,
              onStepContinue: stepContinue,
              onStepTapped: stepTap,
            )),
      ),
    );
  }
}

class Choice {
  final String title;
  final IconData icon;

  const Choice({this.title, this.icon});
}

class TabBarViewState extends State<MyApp> with SingleTickerProviderStateMixin {
  TabController controller;
  List<Choice> items = <Choice>[
    const Choice(title: "car", icon: Icons.directions_car),
    const Choice(title: "bike", icon: Icons.directions_bike),
    const Choice(title: "car", icon: Icons.directions_car),
    const Choice(title: "bike", icon: Icons.directions_bike),
    const Choice(title: "car", icon: Icons.directions_car),
    const Choice(title: "bike", icon: Icons.directions_bike),
  ];

  @override
  void initState() {
    controller = TabController(length: items.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("tabBarView"),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(40.0),
            child: Theme(
              data: Theme.of(context).copyWith(accentColor: Colors.yellow),
              child: Container(
                height: 48.0,
                alignment: Alignment.center,
                child: TabPageSelector(
                  controller: controller,
                ),
              ),
            ),
          ),
        ),
        body: TabBarView(
            controller: controller,
            children: items.map((item) {
              return Container(
                padding: EdgeInsets.all(25.0),
                child: Center(
                  child: Column(
                    children: [
                      Text(item.title),
                      Icon(
                        item.icon,
                        size: 80.0,
                      )
                    ],
                  ),
                ),
              );
            }).toList()));
  }
}

class MyItem {
  bool isExpanded;
  final String header;
  final Widget body;

  MyItem(this.isExpanded, this.header, this.body);
}

class ExtensionPanelState extends State<MyApp> {
  List<MyItem> items = <MyItem>[];

  @override
  void initState() {
    for (int i = 0; i < 5; i++) {
      items.add(MyItem(
          false,
          "item nr $i",
          Container(
            padding: EdgeInsets.all(10.0),
            child: Text("Hello word"),
          )));
    }

    super.initState();
  }

  ExpansionPanel createItem(MyItem myItem) {
    return ExpansionPanel(
        headerBuilder: (BuildContext context, bool isExpanded) {
          return Container(
            padding: EdgeInsets.all(5.0),
            child: Text("Header ${myItem.header}"),
          );
        },
        body: myItem.body,
        isExpanded: myItem.isExpanded);
  }

  void onGoToNextPressed() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("ExtensionPanelState"),
        ),
        body: Container(
          padding: EdgeInsets.all(10.0),
          child: Center(
            child: ListView(
              children: [
                ExpansionPanelList(
                  expansionCallback: (int index, bool isExpanded) {
                    setState(() {
                      items[index].isExpanded = !items[index].isExpanded;
                    });
                  },
                  children: items.map(createItem).toList(),
                ),
              ],
            ),
          ),
        ));
  }
}

class TimeSliderState extends State<MyApp> {
  String lastTime = "no estabilished";
  double value = 0.0;
  static Duration duration = Duration(milliseconds: 50);
  Timer timer;
  bool orarSense = false;
  double defaultChange = 0.1;

  Color backColor = Colors.blue.shade100;
  Color valColor = Colors.blue;

  @override
  void initState() {
    timer = Timer.periodic(duration, timeout);

    double i = ((DateTime
        .now()
        .hour % 12) / 12);
    value = i;
    lastTime = DateTime.now().toString();

    super.initState();
  }

  void invertColors() {
    Color temp = backColor;
    backColor = valColor;
    valColor = temp;
  }

  void timeout(Timer timer) {
//print(value);
    setState(() {
      if (value < 0.0) {
        value = 1.0;
        orarSense = false;
        invertColors();
      }
      if (value > 1.0) {
        value = 0.0;
        orarSense = true;
        invertColors();
      }

      if (orarSense) {
        value = value + defaultChange;
      } else {
        value = value - defaultChange;
      }
    });
  }

  void onStartPressed() {
    setState(() {
      orarSense = !orarSense;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Time Slider"),
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            children: [
              Text(lastTime),
              LinearProgressIndicator(
                value: value,
                backgroundColor: backColor,
                semanticsLabel: "da",
                valueColor: AlwaysStoppedAnimation(valColor),
              ),
              CircularProgressIndicator(
                value: value,
                backgroundColor: backColor,
                semanticsLabel: "da",
                valueColor: AlwaysStoppedAnimation(valColor),
              ),
              ElevatedButton(
                onPressed: onStartPressed,
                child: Text("START"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ChipState extends State<MyApp> {
  String _value = "nothing yet string variable";

  int counter = 0;
  List<Widget> _list = <Widget>[];

  void _onClicked() {
    Widget child = _newItem(counter);
    setState(() => _list.add(child));
  }

  @override
  void initState() {
    for (int i = 0; i < 5; i++) {
      Widget child = _newItem(i);
      _list.add(child);
    }
  }

  Widget _newItem(int i) {
    Key key = Key('item_${i}');
    Container child = Container(
      key: key,
      padding: EdgeInsets.all(10.0),
      child: Chip(
        label: Text("${i} name here"),
        deleteIconColor: Colors.red,
        deleteButtonTooltipMessage: "Delete item",
        onDeleted: () => _removeItem(key),
        avatar: CircleAvatar(
          backgroundColor: Colors.grey.shade500,
          child: Text(i.toString()),
          foregroundColor: Colors.black,
        ),
      ),
    );
    counter++;
    return child;
  }

  void _removeItem(Key key) {
    for (int i = 0; i < _list.length; i++) {
      Widget child = _list.elementAt(i);
      if (child.key == key) {
        setState(() {
          _list.removeAt(i);
          print("removing ${key} key");
//counter -= 1;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text("Appbar title"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onClicked,
        child: Icon(Icons.add),
      ),
      body: Container(
        padding: EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            children: _list,
          ),
        ),
      ),
    );
  }
}

enum Animal { cat, dog, bird, fish, lizard }

class _PopUpMenuState extends State<MyApp> {
  Animal selectedAnimal = Animal.bird;
  String actualValue = "Make a selection";
  List<PopupMenuItem<Animal>> items = <PopupMenuItem<Animal>>[];

  @override
  void initState() {
    super.initState();
    for (Animal animal in Animal.values) {
      items.add(PopupMenuItem(
        child: Text(getDisplay(animal)),
        value: animal,
      ));
    }
  }

  void onSelected(Animal animal) {
    setState(() {
      selectedAnimal = animal;
      actualValue = "Animal selected : ${getDisplay(animal)}";
    });
  }

  String getDisplay(Animal animal) {
    int index = animal.toString().indexOf(".");
    index++;
    return animal.toString().substring(index);
  }

  @override
  Widget build(BuildContext context) {
// TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("PopUpMenuState"),
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Center(
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(5.0),
                child: Text(actualValue),
              ),
              PopupMenuButton<Animal>(
                  child: Icon(Icons.add),
                  initialValue: Animal.cat,
                  onSelected: onSelected,
                  itemBuilder: (BuildContext context) {
                    return items;
                  })
            ],
          ),
        ),
      ),
    );
  }
}
