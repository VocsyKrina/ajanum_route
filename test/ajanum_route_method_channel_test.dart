import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ajanum_route/ajanum_route_method_channel.dart';

void main() {
  MethodChannelAjanumRoute platform = MethodChannelAjanumRoute();
  const MethodChannel channel = MethodChannel('ajanum_route');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
