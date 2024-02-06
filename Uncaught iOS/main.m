//
//  main.m
//  Uncaught iOS
//
//  Created by Eva Vidic on 03/11/2023.
//

#import <UIKit/UIKit.h>
#import "Retronator.Xni.Framework.h"

int main(int argc, char *argv[]) {
    [GameHost load];
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
    int retVal = UIApplicationMain(argc, argv, @"GameHost", @"Uncaught");
    [pool release];
    return retVal;
}
