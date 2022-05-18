#import "TruespotPlugin.h"
#if __has_include(<truespot/truespot-Swift.h>)
#import <truespot/truespot-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "truespot-Swift.h"
#endif

@implementation TruespotPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftTruespotPlugin registerWithRegistrar:registrar];
}
@end
