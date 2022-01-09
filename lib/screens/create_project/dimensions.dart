import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:makemywindoor/helperwidgets/my_textfield.dart';
import 'package:makemywindoor/model/project_dimens.dart';
import 'package:makemywindoor/utils/size_config.dart';

class DimensionsScreen extends StatefulWidget {
  final GlobalKey<FormState> dimensForm;
  const DimensionsScreen({Key? key, required this.dimensForm})
      : super(key: key);

  @override
  State<DimensionsScreen> createState() => _DimensionsScreenState();
}

class _DimensionsScreenState extends State<DimensionsScreen> {
  ProjectDimensions pdim = ProjectDimensions.empty();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.dimensForm,
      child: ExpansionPanelList(
        expansionCallback: (int index, bool isExpanded) {
          setState(() {
            items[index].isExpanded = !isExpanded;
          });
        },
        children: [
          ExpansionPanel(
            headerBuilder: (context, isExpanded) => const ListTile(
              title: Text("Window 1"),
            ),
            body: Column(
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
                            width: SizeConfig.blockSizeHorizontal * 73,
                            child: DropdownButton<String>(
                              value: pdim.type,
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
                                setState(() {
                                  pdim.type = type!;
                                });
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
            ),
          ),
        ],
      ),
    );
  }
}

class ExpansionItem {
  ExpansionItem({
    // required this.expandedValue,
    // required this.headerValue,
    this.isExpanded = false,
  });

  // String expandedValue;
  // String headerValue;
  bool isExpanded;
}

List<ExpansionItem> items = [
  ExpansionItem(
    // expandedValue: 'Expanded 1',
    // headerValue: 'Header 1',
    isExpanded: false,
  ),
  ExpansionItem(
    // expandedValue: 'Expanded 2',
    // headerValue: 'Header 2',
    isExpanded: false,
  ),
  ExpansionItem(
    // expandedValue: 'Expanded 3',
    // headerValue: 'Header 3',
    isExpanded: false,
  ),
];
