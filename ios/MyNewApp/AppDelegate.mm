#import "AppDelegate.h"

#import <React/RCTBundleURLProvider.h>

#import <ConsentUI/ConsentUI.h>
#import "MyNewApp-Swift.h"
//#import "MyNewApp.h"

@implementation AppDelegate

RCT_EXPORT_MODULE()

RCT_EXPORT_METHOD(pushVC:(NSDictionary *)props){

  dispatch_async(dispatch_get_main_queue(), ^{
    [self invokeFramework:props];
  });

}

- (void)invokeFramework:(NSDictionary *)props
{
  
  UIWindow *window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
  
  UIViewController *controller = [[UIViewController alloc] init];
  
  window.rootViewController = controller;
  [window makeKeyAndVisible];

  ConsentSDKSwift * help = [ConsentSDKSwift shared];
  [help getSDKConfigureWithAppUrl:props[@"appUrl"] cdnUrl:props[@"cdnUrl"] tenantId:props[@"tenantId"] appId:props[@"appId"]];
  
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  self.moduleName = @"MyNewApp";
  // You can add your custom initial props in the dictionary below.
  // They will be passed down to the ViewController used by React Native.
  self.initialProps = @{};
  
  //[self invokeFramework];

  return [super application:application didFinishLaunchingWithOptions:launchOptions];
}

- (NSURL *)sourceURLForBridge:(RCTBridge *)bridge
{
  return [self bundleURL];
}

- (NSURL *)bundleURL
{
#if DEBUG
  return [[RCTBundleURLProvider sharedSettings] jsBundleURLForBundleRoot:@"index"];
#else
  return [[NSBundle mainBundle] URLForResource:@"main" withExtension:@"jsbundle"];
#endif
}

@end
