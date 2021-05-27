import 'package:another_flushbar/flushbar_helper.dart';
import 'package:cybear_jinni/application/scene/scene_bloc.dart';
import 'package:cybear_jinni/domain/scene/scene.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SceneWidget extends StatelessWidget {
  SceneWidget(this.currentScene);

  final Scene currentScene;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SceneBloc, SceneState>(
        listener: (context, SceneState state) {
      state.map(
        (value) => (v) {},
        loading: (loadingNow) {},
        error: (errorNow) {
          FlushbarHelper.createError(message: 'Error');
        },
        loaded: (_) => const Text('sds'),
      );
    }, builder: (context, state) {
      return state.map(
        (value) => const Text('value'),
        loading: (_) => const Text('Loading'),
        loaded: (sceneState) {
          return Container(
            margin: const EdgeInsets.fromLTRB(5, 0, 5, 10),
            child: RaisedButton(
              padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
              color: currentScene.backgroundColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
                side: BorderSide(
                    color: (Theme.of(context).textTheme.bodyText1!.color)!,
                    width: 0.6),
              ),
              onPressed: () {
                HapticFeedback.lightImpact();
                // smartDevicesWithWish
                //     .forEach((SmartDeviceObject key, List<DeviceActions> value) {
                //   for (final DeviceActions deviceActionForSmartDevice in value) {
                //     key.executeWish(wishEnumForSmartDevice);
                //   }
                // });
              },
              highlightColor: (Theme.of(context).textTheme.bodyText1!.color)!,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.black54,
                ),
                alignment: Alignment.center,
                child: Text(
                  currentScene.name,
                  style: TextStyle(
                    fontSize: 23,
                    color: (Theme.of(context).textTheme.bodyText1!.color)!,
                  ),
                  textAlign: TextAlign.center,
                ),
                // Text(
                //   _element,
                //   style: const TextStyle(fontSize: 27),
                //   textAlign: TextAlign.center,
                // ),
              ),
            ),
          );
        },
        error: (_) => const Text('Error'),
      );
    });
  }
}
