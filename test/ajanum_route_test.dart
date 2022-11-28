import 'package:ajanum_route/ajanum_route.dart';
import 'package:ajanum_route/ajanum_route_method_channel.dart';
import 'package:ajanum_route/ajanum_route_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';
// import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:plugin_plate';

class MockAjanumRoutePlatform with MockPlatformInterfaceMixin implements AjanumRoutePlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final AjanumRoutePlatform initialPlatform = AjanumRoutePlatform.instance;

  test('$MethodChannelAjanumRoute is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelAjanumRoute>());
  });

  test('getPlatformVersion', () async {
    AjanumRoute ajanumRoutePlugin = AjanumRoute();
    MockAjanumRoutePlatform fakePlatform = MockAjanumRoutePlatform();
    AjanumRoutePlatform.instance = fakePlatform;

    expect(await ajanumRoutePlugin.getPlatformVersion(), '42');
  });
}
