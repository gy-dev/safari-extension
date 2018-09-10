//
//  SafariExtensionHandler.m
//  first-safari-extension-EX
//
//  Created by raysharp on 2018/9/10.
//  Copyright © 2018 raysharp. All rights reserved.
//

#import "SafariExtensionHandler.h"
#import "SafariExtensionViewController.h"

@interface SafariExtensionHandler ()

@end

@implementation SafariExtensionHandler

- (void)messageReceivedWithName:(NSString *)messageName fromPage:(SFSafariPage *)page userInfo:(NSDictionary *)userInfo {
    // This method will be called when a content script provided by your extension calls safari.extension.dispatchMessage("message").
    [page getPagePropertiesWithCompletionHandler:^(SFSafariPageProperties *properties) {
        NSLog(@"The extension received a message (%@) from a script injected into (%@) with userInfo (%@)", messageName, properties.url, userInfo);
    }];
}

- (void)toolbarItemClickedInWindow:(SFSafariWindow *)window {
    // This method will be called when your toolbar item is clicked.
    // NSLog(@"The extension's toolbar item was clicked");

//    [window openTabWithURL:[NSURL URLWithString:@"http://www.baidu.com"] makeActiveIfPossible:YES completionHandler:^(SFSafariTab * _Nullable activeTab){
//
//    }];
    //return;
    [window getActiveTabWithCompletionHandler:^(SFSafariTab * _Nullable activeTab) {
		[activeTab getActivePageWithCompletionHandler:^(SFSafariPage * _Nullable activePage) {
			// Invoke handleMessage() in script.js.  UserInfo is ignored, just for example purposes.
			
			[activePage dispatchMessageToScriptWithName:@"message" userInfo:@{ @"myKey": @"myValue" }];
		}];
	}];
}

- (void)validateToolbarItemInWindow:(SFSafariWindow *)window validationHandler:(void (^)(BOOL enabled, NSString *badgeText))validationHandler {
    // This method will be called whenever some state changes in the passed in window. You should use this as a chance to enable or disable your toolbar item and set badge text.
    validationHandler(YES, nil);
}

- (SFSafariExtensionViewController *)popoverViewController {
    return [SafariExtensionViewController sharedController];
}

- (void)messageReceivedFromContainingAppWithName:(NSString *)messageName
                                        userInfo:(NSDictionary<NSString *,id> *)userInfo
{
    NSLog(@"The extension received a message (%@) from ContainingApp with userInfo (%@)", messageName, userInfo);
}

@end
