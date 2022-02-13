import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:lottie/lottie.dart';
import 'package:makemywindoor/models/project.dart';
import 'package:makemywindoor/screens/create_project/create_project.dart';
import 'package:makemywindoor/screens/projects/project_details.dart';
import 'package:makemywindoor/services/project_service.dart';
import 'package:makemywindoor/services/user_service.dart';
import 'package:makemywindoor/utils/size_config.dart';
import 'package:provider/provider.dart';

class MyProjects extends StatelessWidget {
  const MyProjects({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        // stream: Provider.of<ProjectServices>(context).getAllProjects(),
        stream: Provider.of<ProjectServices>(context)
            .getProjects(Provider.of<UserServices>(context).currentUser!.phone),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!.docs.isEmpty) {
              return Center(
                child: Column(
                  children: [
                    SizedBox(
                      width: SizeConfig.screenWidth * 0.5,
                      height: SizeConfig.screenHeight * 0.5,
                      child: Lottie.asset(
                        "assets/imgs/lotties/empty.json",
                        reverse: true,
                      ),
                    ),
                    const Text("No Projects Available"),
                  ],
                ),
              );
            }
            List<Project> list = snapshot.data!.docs
                .map((e) => Project.fromMap(e.data()))
                .toList();
            return ListView.separated(
                itemCount: list.length,
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(
                      height: 1,
                    ),
                itemBuilder: (BuildContext context, int index) {
                  return Dismissible(
                    secondaryBackground: Container(
                        // color: Colors.red,
                        color: Colors.green,
                        alignment: AlignmentDirectional.centerEnd,
                        child: const Padding(
                          padding: EdgeInsets.only(right: 16.0),
                          child: Icon(
                            // LineIcons.trash,
                            LineIcons.edit,
                            color: Colors.white,
                          ),
                        )),
                    background: Container(
                        color: Colors.red,
                        alignment: AlignmentDirectional.centerStart,
                        child: const Padding(
                          padding: EdgeInsets.only(left: 16.0),
                          child: Icon(
                            LineIcons.trash,
                            color: Colors.white,
                          ),
                        )),
                    key: Key(index.toString() +
                        list[index].projectDetails.projectName),
                    confirmDismiss: (direction) async {
                      return await showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text("Confirm"),
                              content: Text("Are you sure you want to " +
                                  (direction == DismissDirection.endToStart
                                      ? "edit"
                                      : "delete") +
                                  " this project?"),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () =>
                                      Navigator.of(context).pop(false),
                                  child: const Text("CANCEL"),
                                ),
                                TextButton(
                                    onPressed: () {
                                      direction == DismissDirection.endToStart
                                          ? {
                                              Navigator.of(context).pop(false),
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        CreateProjectScreen(
                                                          isEdit: true,
                                                          project: list[index],
                                                        )),
                                              )
                                            }
                                          : Navigator.of(context).pop(true);
                                    },
                                    child: Text(
                                        direction == DismissDirection.endToStart
                                            ? "EDIT"
                                            : "DELETE")),
                              ],
                            );
                          });
                    },
                    onDismissed: (dir) async {
                      await Provider.of<ProjectServices>(context, listen: false)
                          .deleteProject(list[index]);
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Project deleted")));
                    },
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 16),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProjectDetailScreen(
                              project: list[index],
                            ),
                          ),
                        );
                      },
                      title: Text(list[index].projectDetails.projectName),
                      subtitle: Text(list[index].projectDetails.customerName +
                          '\n' +
                          list[index].projectDetails.customerNumber),
                      trailing:
                          Text(list[index].totalCharge.toStringAsFixed(2)),
                    ),
                  );
                });
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}
