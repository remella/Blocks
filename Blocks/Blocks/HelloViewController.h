//
//  HelloViewController.h
//  Blocks
//
//  Created by Harish on 03/03/14.
//  Copyright (c) 2014 Harish. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HelloViewController : UIViewController{
    
}

@property double odometer;

- (void)driveForDuration:(double)duration
       withVariableSpeed:(double (^)(double time))speedFunction
                   steps:(int)numSteps;
-(void)doSomethingWithBlock1:(void (^)(NSString *thi, int thin))block;

@end
