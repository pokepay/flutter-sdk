#import "PokepaySdkPlugin.h"
#if __has_include(<pokepay_sdk/pokepay_sdk-Swift.h>)
#import <pokepay_sdk/pokepay_sdk-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "PokepaySdkPlugin.h"
#endif

@implementation PokepaySdkPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftPokepaySdkPlugin registerWithRegistrar:registrar];
}
@end
