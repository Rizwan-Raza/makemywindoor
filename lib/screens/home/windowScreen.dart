import 'package:flutter/material.dart';
import 'package:makemywindoor/utils/my_constants.dart';
import 'package:makemywindoor/utils/size_config.dart';
import 'package:makemywindoor/widgets/my_appbar.dart';

class WindowScreen extends StatefulWidget {
  const WindowScreen({Key? key}) : super(key: key);

  @override
  State<WindowScreen> createState() => _WindowScreenState();
}

class _WindowScreenState extends State<WindowScreen> {
  int selected = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: MyConstants.appbarTitle1[0],
      ),
      body: Column(
        // mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: ListView(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  children: MyConstants.windowsScreenChips
                      .map((e) => Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: FilterChip(
                              label: Text(e),
                              selected: selected ==
                                  MyConstants.windowsScreenChips.indexOf(e),
                              onSelected: (bool value) {
                                setState(() {
                                  selected =
                                      MyConstants.windowsScreenChips.indexOf(e);
                                });
                              },
                              selectedColor:
                                  Theme.of(context).colorScheme.primary,
                              showCheckmark: false,
                            ),
                          ))
                      .toList()),
            ),
          ),
          Expanded(
            child: ListView(
              // padding: EdgeInsets.all(0),
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              children: [
                Stack(
                  children: [
                    Container(
                      color: Colors.grey.shade300,
                      height: SizeConfig.blockSizeVertical * 30,
                      width: SizeConfig.screenWidth,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Image.asset(
                          MyConstants.windowsData[MyConstants
                              .windowsScreenChips[selected]]['imageUrl'],
                          fit: BoxFit.cover,
                          gaplessPlayback: true,
                        ),
                      ),
                    ),
                  ],
                ),
                // myThickDivider(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyConstants.windowsDataIcon[0],
                      const SizedBox(
                        width: 10,
                      ),
                      Flexible(
                        child: Text(
                          MyConstants.windowsData[
                              MyConstants.windowsScreenChips[selected]]['desc'],
                          style: const TextStyle(
                            // fontSize: 14,
                            overflow: TextOverflow.visible,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                myThickDivider(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyConstants.windowsDataIcon[1],
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Features',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: MyConstants
                                    .windowsData[MyConstants
                                            .windowsScreenChips[selected]]
                                        ['features']
                                    .length,
                                itemBuilder: (BuildContext context, int index) {
                                  // MyConstants
                                  //     .windowsData[MyConstants
                                  //             .windowsScreenChips[selected]]
                                  //         ['features']
                                  //     .keys.toList()[index];
                                  // log(reversed.toString());
                                  return Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text('- '),
                                      Flexible(
                                        child: Text(
                                          MyConstants.windowsData[MyConstants
                                                      .windowsScreenChips[
                                                  selected]]['features'][
                                              MyConstants
                                                  .windowsData[MyConstants
                                                          .windowsScreenChips[
                                                      selected]]['features']
                                                  .keys
                                                  .toList()[index]],
                                          overflow: TextOverflow.visible,
                                          maxLines: 3,
                                          //  reversed.entries.key,
                                          style: const TextStyle(
                                            overflow: TextOverflow.visible,
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                }),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                myThickDivider(),
                recommendWidgetAvaibaleIn('Recommended', 'recommeded',
                    MyConstants.windowsDataIcon[2]),
                myThickDivider(),
                recommendWidgetAvaibaleIn('Available In', 'availablein',
                    MyConstants.windowsDataIcon[3]),
              ],
            ),
            flex: 9,
          )
        ],
      ),
    );
  }

  recommendWidgetAvaibaleIn(String type, String key, Icon icon) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          icon,
          const SizedBox(
            width: 10,
          ),
          Expanded(
              child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                type,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 5,
              ),
              Flexible(
                child: Text(
                  MyConstants
                          .windowsData[MyConstants.windowsScreenChips[selected]]
                      [key],
                  overflow: TextOverflow.visible,
                  maxLines: 3,
                  //  reversed.entries.key,
                  style: const TextStyle(
                    overflow: TextOverflow.visible,
                  ),
                ),
              ),
            ],
          )),
        ],
      ),
    );
  }

  myThickDivider() {
    return Divider(
      thickness: 5,
      color: Colors.grey.shade300,
    );
  }
}
