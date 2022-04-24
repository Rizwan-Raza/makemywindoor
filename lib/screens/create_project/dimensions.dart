import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:makemywindoor/models/project_dimens.dart';
import 'package:makemywindoor/utils/size_config.dart';
import 'package:makemywindoor/widgets/my_textfield.dart';

// stores ExpansionPanel state information
class Item {
  Item(
      {this.isExpanded = false,
      this.sfx = 1,
      this.type = 'Type',
      this.esqtText})
      : esqt = TextEditingController(text: esqtText);
  int sfx;
  bool isExpanded;
  String type;
  String? esqtText;
  TextEditingController esqt;
}

class DimensionScreen extends StatefulWidget {
  final List<ProjectDimensions> projectDimensions;
  final GlobalKey<FormState> dimensForm;
  final bool isEdit;
  const DimensionScreen(
      {Key? key,
      required this.dimensForm,
      required this.projectDimensions,
      required this.isEdit})
      : super(key: key);

  @override
  State<DimensionScreen> createState() => _DimensionScreenState();
}

class _DimensionScreenState extends State<DimensionScreen> {
  bool hasError = false;
  late List<Item> items;
  Map<String, int> types = {
    "Type": 0,
    "Custom": 0,
    "Door": 0,
    "Window": 0,
  };
  @override
  void initState() {
    super.initState();
    items = widget.isEdit
        ? widget.projectDimensions.map((e) {
            types[e.type] = int.parse(e.dimensionID.split(" ").last);
            return Item(
              sfx: int.parse(e.dimensionID.split(" ").last),
              type: e.type,
              esqtText: e.esft.toString(),
            );
          }).toList()
        : [Item(isExpanded: true)];

    widget.isEdit
        ? items[0].isExpanded = true
        : {
            types['Type'] = 1,
            widget.projectDimensions.add(ProjectDimensions.empty())
          };
  }

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
                    widget.projectDimensions.add(ProjectDimensions.empty());
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
            widget.projectDimensions[items.indexOf(item)].dimensionID =
                item.type + " " + item.sfx.toString();
            return ListTile(
              dense: true,
              title: Text(item.type + " " + item.sfx.toString()),
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
                            width:
                                SizeConfig.screenWidth - 48 - 16 - 16 - 24 - 16,
                            child: DropdownButtonFormField<String>(
                              value: item.type,
                              icon: Expanded(
                                child: Row(
                                  children: const [
                                    Expanded(child: SizedBox()),
                                    Icon(LineIcons.angleDown),
                                  ],
                                ),
                              ),
                              itemHeight: 48,
                              decoration: const InputDecoration(
                                errorText: null,
                                enabledBorder: InputBorder.none,
                              ),
                              validator: (value) {
                                if (value == null ||
                                    value.isEmpty ||
                                    value == "Type") {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text("Please select a type"),
                                      duration: Duration(seconds: 2),
                                    ),
                                  );
                                  hasError = true;
                                  for (var element in items) {
                                    element.isExpanded = false;
                                  }
                                  setState(() {
                                    item.isExpanded = true;
                                  });
                                }
                                return null;
                              },
                              onSaved: (value) {
                                widget.projectDimensions[items.indexOf(item)]
                                    .type = value!;
                              },
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
                                // types[item.type] =
                                //     types[item.type]! - 1;
                                if (item.type != type) {
                                  for (var element in items) {
                                    // decrement all
                                    if (element.type == item.type &&
                                        item.sfx < element.sfx) {
                                      element.sfx--;
                                    }
                                  }
                                  types[item.type] = types[item.type]! - 1;
                                  setState(() {
                                    item.type = type!;
                                  });
                                  types[item.type] = types[item.type]! + 1;
                                  item.sfx = types[item.type]!;
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
                MyTextFormField(
                  label: "Height (in cms)",
                  icon: LineIcons.rulerVertical,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      for (var element in items) {
                        element.isExpanded = false;
                      }
                      // setState(() {
                      //   item.isExpanded = true;
                      // });
                      item.isExpanded = true;

                      return "Please enter a height";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    widget.projectDimensions[items.indexOf(item)].height =
                        int.parse(value!);
                  },
                  keyboardType: TextInputType.number,
                  initialValue:
                      widget.projectDimensions[items.indexOf(item)].height != 0
                          ? widget.projectDimensions[items.indexOf(item)].height
                              .toString()
                          : null,
                  onChanged: (value) {
                    widget.projectDimensions[items.indexOf(item)].height =
                        value.isNotEmpty ? int.parse(value) : 0;
                    item.esqt.text = (widget
                                        .projectDimensions[items.indexOf(item)]
                                        .width /
                                    30.48 *
                                    widget
                                        .projectDimensions[items.indexOf(item)]
                                        .height /
                                    30.48)
                                .round() !=
                            0
                        ? (widget.projectDimensions[items.indexOf(item)].width /
                                30.48 *
                                widget.projectDimensions[items.indexOf(item)]
                                    .height /
                                30.48)
                            .round()
                            .toString()
                        : "";
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                MyTextFormField(
                  label: "Width (in cms)",
                  icon: LineIcons.rulerHorizontal,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      for (var element in items) {
                        element.isExpanded = false;
                      }
                      // setState(() {
                      //   item.isExpanded = true;
                      // });
                      item.isExpanded = true;

                      return "Please enter a width";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    widget.projectDimensions[items.indexOf(item)].width =
                        int.parse(value!);
                  },
                  keyboardType: TextInputType.number,
                  initialValue:
                      widget.projectDimensions[items.indexOf(item)].width != 0
                          ? widget.projectDimensions[items.indexOf(item)].width
                              .toString()
                          : null,
                  onChanged: (value) {
                    widget.projectDimensions[items.indexOf(item)].width =
                        value.isNotEmpty ? int.parse(value) : 0;
                    item.esqt.text = (widget
                                        .projectDimensions[items.indexOf(item)]
                                        .width /
                                    30.48 *
                                    widget
                                        .projectDimensions[items.indexOf(item)]
                                        .height /
                                    30.48)
                                .round() !=
                            0
                        ? (widget.projectDimensions[items.indexOf(item)].width /
                                30.48 *
                                widget.projectDimensions[items.indexOf(item)]
                                    .height /
                                30.48)
                            .round()
                            .toString()
                        : "";
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                MyTextFormField(
                    label: "Estimated SQFT",
                    icon: LineIcons.rulerCombined,
                    controller: item.esqt,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        for (var element in items) {
                          element.isExpanded = false;
                        }
                        // setState(() {
                        //   item.isExpanded = true;
                        // });
                        item.isExpanded = true;

                        return "Please enter an estimated SQFT";
                      }
                      return null;
                    },
                    onSaved: (value) {
                      widget.projectDimensions[items.indexOf(item)].esft =
                          value!.isNotEmpty ? double.parse(value) : 0;
                    },
                    keyboardType: TextInputType.number,
                    // initialValue: (widget
                    //             .projectDimensions[items.indexOf(item)].height *
                    //         widget.projectDimensions[items.indexOf(item)].width)
                    //     .toString(),
                    onChanged: (value) {
                      widget.projectDimensions[items.indexOf(item)].esft =
                          value.isNotEmpty ? double.parse(value) : 0;
                    }),
                const SizedBox(
                  height: 16,
                ),
                MyTextFormField(
                    label: "Rate",
                    icon: LineIcons.percentage,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        for (var element in items) {
                          element.isExpanded = false;
                        }
                        // setState(() {
                        //   item.isExpanded = true;
                        // });
                        item.isExpanded = true;

                        return "Please enter a rate";
                      }
                      return null;
                    },
                    onSaved: (value) {
                      widget.projectDimensions[items.indexOf(item)].rate =
                          value!.isNotEmpty ? int.parse(value) : 0;
                    },
                    initialValue:
                        widget.projectDimensions[items.indexOf(item)].rate != 0
                            ? widget.projectDimensions[items.indexOf(item)].rate
                                .toString()
                            : null,
                    onChanged: (value) {
                      widget.projectDimensions[items.indexOf(item)].rate =
                          value.isNotEmpty ? int.parse(value) : 0;
                    }),
                const SizedBox(
                  height: 16,
                ),
                MyTextFormField(
                    label: "Remarks",
                    icon: LineIcons.pencilRuler,
                    onSaved: (value) {
                      widget.projectDimensions[items.indexOf(item)].remarks =
                          value!;
                    },
                    initialValue:
                        widget.projectDimensions[items.indexOf(item)].remarks,
                    onChanged: (value) {
                      widget.projectDimensions[items.indexOf(item)].remarks =
                          value;
                    }),
                const SizedBox(
                  height: 16,
                ),
                if (items.length > 1)
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton.icon(
                        onPressed: () {
                          widget.projectDimensions
                              .removeAt(items.indexOf(item));
                          for (var element in items) {
                            // decrement all
                            if (element.type == item.type &&
                                item.sfx < element.sfx) {
                              element.sfx--;
                            }
                          }
                          types[item.type] = types[item.type]! - 1;
                          items.removeAt(items.indexOf(item));
                          items.last.isExpanded = true;
                          setState(() {});
                        },
                        icon: const Icon(LineIcons.trash),
                        label: const Text("Delete")),
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
