//
//  SafariExtensionViewController.m
//  first-safari-extension-EX
//
//  Created by raysharp on 2018/9/10.
//  Copyright © 2018 raysharp. All rights reserved.
//

#import "SafariExtensionViewController.h"

@interface SafariExtensionViewController ()

@end

@implementation SafariExtensionViewController

+ (SafariExtensionViewController *)sharedController {
    static SafariExtensionViewController *sharedController = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedController = [[SafariExtensionViewController alloc] init];
    });
    return sharedController;
}

@end
