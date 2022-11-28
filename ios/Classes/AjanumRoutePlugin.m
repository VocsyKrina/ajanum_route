#import "AjanumRoutePlugin.h"
#if __has_include(<ajanum_route/ajanum_route-Swift.h>)
#import <ajanum_route/ajanum_route-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "ajanum_route-Swift.h"
#endif

@implementation AjanumRoutePlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftAjanumRoutePlugin registerWithRegistrar:registrar];
}
@end
