import 'package:flutter/material.dart';
import 'package:jobsque/model/cubit/json_models/all_jobs.dart';
import 'package:jobsque/model/widgets.dart';
import '../routes/route_name.dart';
import 'job_list_items.dart';

class SavedItems extends StatelessWidget {
  final List<Data> listItem;
  const SavedItems({
    super.key,
    required this.listItem,
  });

  @override
  Widget build(BuildContext context) {
    return listItem.isEmpty
        ? Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 100),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset("assets/images/Saved item.png"),
                headline(text: "Nothing has been saved yet"),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
                  child: Center(
                    child: normalText(
                      text: "Press the star icon on the job you want to save",
                    ),
                  ),
                )
              ],
            ),
          )
        : Column(children: [
            title(text: "${listItem.length.toString()}Jobs saved"),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
              child: ListView.separated(
                  shrinkWrap: true,
                  separatorBuilder: (context, index) => Divider(
                        height: 10,
                        color: Colors.grey.withOpacity(0.4),
                      ),
                  itemCount: listItem.length,
                  itemBuilder: (context, index) => SavedBuilderItem(
                        jobItem: listItem[index],
                      )),
            ),
          ]);
  }
}

class AppliedItems extends StatefulWidget {
  const AppliedItems({
    super.key,
    required this.listItem,
    required this.active,
    required this.rejected,
  });

  @override
  State<AppliedItems> createState() => _AppliedItemsState();
  final bool active;
  final bool rejected;
  final List<Data> listItem;
}

class _AppliedItemsState extends State<AppliedItems> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: widget.active == true
            ? widget.listItem.isEmpty
                ? title(text: "${widget.listItem.length.toString()} Jobs")
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      title(text: "${widget.listItem.length.toString()} Jobs"),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: ListView.separated(
                              shrinkWrap: true,
                              separatorBuilder: (context, index) => Divider(
                                    height: 10,
                                    color: Colors.grey.withOpacity(0.4),
                                  ),
                              itemCount: widget.listItem.length,
                              itemBuilder: (context, index) =>
                                  ActiveAppliedBuilderItem(
                                    jobItem: widget.listItem[index],
                                  )),
                        ),
                      ),
                    ],
                  )
            : widget.rejected == true
                ? Padding(
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, top: 50),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset("assets/images/noapplied.png"),
                        headline(text: "No applications were rejected"),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 10, left: 20, right: 20),
                          child: Center(
                            child: normalText(
                              text:
                                  "If there is an application that was rejected by the company it will appear here",
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                : null);
  }
}

class NotificationPageItems extends StatelessWidget {
  final List<Data> listItem;
  const NotificationPageItems({
    super.key,
    required this.listItem,
  });

  @override
  Widget build(BuildContext context) {
    return listItem.isEmpty
        ? Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 100),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset("assets/images/Notification Ilustration.png"),
                headline(text: "No new notifications yet"),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
                  child: Center(
                    child: normalText(
                      text:
                          "You will receive a notification if there is something on your account",
                    ),
                  ),
                )
              ],
            ),
          )
        : ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(
                  height: 3,
                ),
            itemCount: listItem.length,
            itemBuilder: (context, index) => BuilderItem(
                  jobItem: listItem[index],
                ));
  }
}

class SearchPageItems extends StatelessWidget {
  final List<Data> listItem;
  const SearchPageItems({
    super.key,
    required this.listItem,
  });

  @override
  Widget build(BuildContext context) {
    return listItem.isEmpty
        ? Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 100),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset("assets/images/Search Ilustration.png"),
                headline(text: "Search not found"),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
                  child: Center(
                    child: normalText(
                      text:
                          "Try searching with different keywords\n so we can show you",
                    ),
                  ),
                )
              ],
            ),
          )
        : Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.separated(
                shrinkWrap: true,
                separatorBuilder: (context, index) => Divider(
                      height: 10,
                      color: Colors.grey.withOpacity(0.1),
                    ),
                itemCount: listItem.length,
                itemBuilder: (context, index) => HomeBuilderItem(
                      jobItem: listItem[index],
                    )),
          );
  }
}

class CompletedApplyStepper extends StatelessWidget {
  const CompletedApplyStepper({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset("assets/images/ApplyComplete.png"),
          Padding(
            padding: const EdgeInsets.only(left: 90, right: 50),
            child: headline(text: "Your data has been successfully sent"),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
            child: Center(
              child: normalText(
                text:
                    "You will get a message from our team,about\n the announcement of employee acceptance",
              ),
            ),
          ),
          const SizedBox(height: 200),
          defaultButton(
              text: "Back to home",
              onPressed: () {
                Navigator.pushNamed(context, AppRouter.homeScreen);
              })
        ],
      ),
    ));
  }
}
