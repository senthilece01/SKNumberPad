#import "SkNumberpadPlugin.h"
#if __has_include(<sk_numberpad/sk_numberpad-Swift.h>)
#import <sk_numberpad/sk_numberpad-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "sk_numberpad-Swift.h"
#endif

@implementation SkNumberpadPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftSkNumberpadPlugin registerWithRegistrar:registrar];
}
@end
