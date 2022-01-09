import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:makemywindoor/helperwidgets/my_textfield.dart';
import 'package:makemywindoor/model/project_dimens.dart';
import 'package:makemywindoor/utils/size_config.dart';

// stores ExpansionPanel state information
class Item {
  Item({
    this.isExpanded = false,
    this.sfx = 1,
  });
  int sfx;
  bool isExpanded;
  ProjectDimensions projectDimensions = ProjectDimensions.empty();
}

class DimensScreen extends StatefulWidget {
  final GlobalKey<FormState> dimensForm;
  const DimensScreen({Key? key, required this.dimensForm}) : super(key: key);

  @override
  State<DimensScreen> createState() => _DimensScreenState();
}

class _DimensScreenState extends State<DimensScreen> {
  late List<Item> items = [
    Item(isExpanded: true),
  ];
  Map<String, int> types = {
    "Type": 1,
    "Custom": 0,
    "Door": 0,
    "Window": 0,
  };

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Form(key: widget.dimensForm, child: _buildPanel()),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton.icon(
                  onPressed: () {
                    for (var element in items) {
                      element.isExpanded = false;
                    }
                    types["Type"] = types["Type"]! + 1;
                    items.add(Item(isExpanded: true, sfx: types["Type"]!));
                    setState(() {});
                  },
                  icon: const Icon(LineIcons.plusCircle),
                  label: const Text("Add more")),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildPanel() {
    return ExpansionPanelList(
      elevation: 0,
      key: GlobalKey(),
      expandedHeaderPadding: EdgeInsets.zero,
      expansionCallback: (int index, bool isExpanded) {
        if (!isExpanded) {
          for (var element in items) {
            element.isExpanded = false;
          }
        }
        setState(() {
          items[index].isExpanded = !isExpanded;
        });
      },
      children: items.map<ExpansionPanel>((Item item) {
        return ExpansionPanel(
          canTapOnHeader: true,
          backgroundColor: Colors.grey[200],
          headerBuilder: (BuildContext context, bool isExpanded) {
            return Row(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    LineIcons.minusCircle,
                    color: Colors.red,
                  ),
                ),
                Text(item.projectDimensions.type + " " + item.sfx.toString()),
              ],
            );
          },
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Stack(
                  children: [
                    Material(
                      elevation: 2.0,
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      child: Container(
                        height: 48,
                        color: Colors.transparent,
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: Row(
                        // mainAxisSize: MainAxisSize.max,
                        children: [
                          const Padding(
                            padding: EdgeInsets.fromLTRB(12, 12, 8, 12),
                            child: Icon(LineIcons.hardHat,
                                size: 24, color: Colors.black54),
                          ),
                          SizedBox(
                            // color: Colors.red,
                            width: SizeConfig.blockSizeHorizontal * 70,
                            child: DropdownButton<String>(
                              value: item.projectDimensions.type,
                              icon: Expanded(
                                child: Row(
                                  children: const [
                                    Expanded(child: SizedBox()),
                                    Icon(LineIcons.angleDown),
                                  ],
                                ),
                              ),
                              itemHeight: 48,
                              underline: Container(
                                height: 0,
                              ),
                              items: <String>[
                                'Type',
                                'Custom',
                                'Door',
                                'Window'
                              ].map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  enabled: value != 'Type',
                                  child: Text(
                                    value,
                                    style: TextStyle(
                                        color: value == "Type"
                                            ? Colors.black54
                                            : Colors.black),
                                  ),
                                );
                              }).toList(),
                              onChanged: (type) {
                                // types[item.projectDimensions.type] =
                                //     types[item.projectDimensions.type]! - 1;
                                if (item.projectDimensions.type != type) {
                                  for (var element in items) {
                                    // decrement all
                                    if (element.projectDimensions.type ==
                                        item.projectDimensions.type) {
                                      element.sfx--;
                                    }
                                  }
                                  types[item.projectDimensions.type] =
                                      types[item.projectDimensions.type]! - 1;
                                  setState(() {
                                    item.projectDimensions.type = type!;
                                  });
                                  types[item.projectDimensions.type] =
                                      types[item.projectDimensions.type]! + 1;
                                  item.sfx =
                                      types[item.projectDimensions.type]!;
                                }
                              },
                              hint: const Text("Type"),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                const MyTextFormField(
                    label: "Height", icon: LineIcons.rulerVertical),
                const SizedBox(
                  height: 16,
                ),
                const MyTextFormField(
                    label: "Width", icon: LineIcons.rulerHorizontal),
                const SizedBox(
                  height: 16,
                ),
                const MyTextFormField(
                    label: "Remarks", icon: LineIcons.pencilRuler),
                const SizedBox(
                  height: 16,
                ),
              ],

// ListTile(
//               title: Text(item.expandedValue),
//               subtitle:
//                   const Text('To delete this panel, tap the trash can icon'),
//               trailing: const Icon(Icons.delete),
//               onTap: () {
//                 setState(() {
//                   items.removeWhere((Item currentItem) => item == currentItem);
//                 });
//               }),
            ),
          ),
          isExpanded: item.isExpanded,
        );
      }).toList(),
    );
  }
}
