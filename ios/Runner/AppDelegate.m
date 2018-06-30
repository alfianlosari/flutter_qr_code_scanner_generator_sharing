#include "AppDelegate.h"
#include "GeneratedPluginRegistrant.h"

@implementation AppDelegate

static NSString *const SHARE_CHANNEL = @"channel:me.alfian.share/share";

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [GeneratedPluginRegistrant registerWithRegistry:self];
    FlutterViewController* controller = (FlutterViewController*)self.window.rootViewController;

    FlutterMethodChannel *shareChannel =
    [FlutterMethodChannel methodChannelWithName:SHARE_CHANNEL
                                binaryMessenger:controller];

    [shareChannel setMethodCallHandler:^(FlutterMethodCall *call, FlutterResult result) {
        if ([@"shareFile" isEqualToString:call.method]) {
            [self shareFile:call.arguments
             withController:[UIApplication sharedApplication].keyWindow.rootViewController];
        }
    }];

    return [super application:application didFinishLaunchingWithOptions:launchOptions];
}

- (void)shareFile:(id)sharedItems withController:(UIViewController *)controller {
    NSMutableString *filePath = [NSMutableString stringWithString:sharedItems];
    NSString *docsPath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *imagePath = [docsPath stringByAppendingPathComponent:filePath];
    NSURL *imageUrl = [NSURL fileURLWithPath:imagePath];
    NSData *imageData = [NSData dataWithContentsOfURL:imageUrl];
    UIImage *shareImage = [UIImage imageWithData:imageData];

    UIActivityViewController *activityViewController =
    [[UIActivityViewController alloc] initWithActivityItems:@[ shareImage ]
                                      applicationActivities:nil];
    [controller presentViewController:activityViewController animated:YES completion:nil];
}

@end