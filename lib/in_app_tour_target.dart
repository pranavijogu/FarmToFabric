// ignore_for_file: non_constant_identifier_names

import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';
import 'package:flutter/material.dart';

List<TargetFocus> addSiteTargets({
  required GlobalKey MarketKey,
  required GlobalKey QualityKey,
  required GlobalKey WarehouseKey,
  required GlobalKey ServicesKey,
  required GlobalKey EducationKey,
  required GlobalKey TrackingKey,
  required GlobalKey NewsKey,
  required GlobalKey PriceKey,
}) {
  List<TargetFocus> targets = [];

  targets.add(
    TargetFocus(
      keyTarget: MarketKey,
      alignSkip: Alignment.topRight,
      radius: 10,
      shape: ShapeLightFocus.Circle,
      contents: [
        TargetContent(
          align: ContentAlign.top,
          builder: (context, controller) {
            return Container(
              alignment: Alignment.center,
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "This is where you can buy wool",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ],
              ),
            );
          },
        )
      ],
    ),
  );

  targets.add(
    TargetFocus(
      keyTarget: QualityKey,
      alignSkip: Alignment.topRight,
      radius: 10,
      shape: ShapeLightFocus.Circle,
      contents: [
        TargetContent(
          align: ContentAlign.top,
          builder: (context, controller) {
            return Container(
              alignment: Alignment.center,
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "This is where you can sell your wool ",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ],
              ),
            );
          },
        )
      ],
    ),
  );

  targets.add(
    TargetFocus(
      keyTarget: WarehouseKey,
      alignSkip: Alignment.topRight,
      radius: 10,
      shape: ShapeLightFocus.Circle,
      contents: [
        TargetContent(
          align: ContentAlign.top,
          builder: (context, controller) {
            return Container(
              alignment: Alignment.center,
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "This is where you can access warehouses to store your wool",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ],
              ),
            );
          },
        )
      ],
    ),
  );

  targets.add(
    TargetFocus(
      keyTarget: ServicesKey,
      alignSkip: Alignment.topRight,
      radius: 10,
      shape: ShapeLightFocus.Circle,
      contents: [
        TargetContent(
          align: ContentAlign.top,
          builder: (context, controller) {
            return Container(
              alignment: Alignment.center,
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "This is where you can access services for your raw wool",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ],
              ),
            );
          },
        )
      ],
    ),
  );

  targets.add(
    TargetFocus(
      keyTarget: EducationKey,
      alignSkip: Alignment.topRight,
      radius: 10,
      shape: ShapeLightFocus.Circle,
      contents: [
        TargetContent(
          align: ContentAlign.top,
          builder: (context, controller) {
            return Container(
              alignment: Alignment.center,
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "This is where you can educate yourselves about wool and its process",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ],
              ),
            );
          },
        )
      ],
    ),
  );

  targets.add(
    TargetFocus(
      keyTarget: TrackingKey,
      alignSkip: Alignment.topRight,
      radius: 10,
      shape: ShapeLightFocus.Circle,
      contents: [
        TargetContent(
          align: ContentAlign.top,
          builder: (context, controller) {
            return Container(
              alignment: Alignment.center,
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "This is where you can track your order",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ],
              ),
            );
          },
        )
      ],
    ),
  );

  return targets;
}
