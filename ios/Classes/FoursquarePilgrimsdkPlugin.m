#import "FoursquarePilgrimSdkPlugin.h"
#import <foursquare_pilgrimsdk/foursquare_pilgrimsdk-Swift.h>

@implementation FoursquarePilgrimSdkPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFoursquarePilgrimSdkPlugin registerWithRegistrar:registrar];
}
@end
