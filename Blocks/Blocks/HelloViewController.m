//
//  HelloViewController.m
//  Blocks
//
//  Created by Harish on 03/03/14.
//  Copyright (c) 2014 Harish. All rights reserved.
//

#import "HelloViewController.h"

@interface HelloViewController ()

@end

@implementation HelloViewController
@synthesize odometer = _odometer;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
   
    
///* Double Block *///
    double (^distanceFromRateAndTime)(double rate, double time);
    distanceFromRateAndTime = ^double(double rate, double time) {
        return rate * time;
    };
    double dx = distanceFromRateAndTime(35, 1.5);
    NSLog(@"A car driving 35 mph will travel "
          @"%.2f miles in 1.5 hours.", dx);
    
    
///* Double Block single *///
    double (^DoubleBlock)(double) = ^(double num){
        double no = num +1;
        return no;
    };
    double numbers = DoubleBlock(5);
    NSLog(@"Double Block single--> %f",numbers);
    
    
///* Diff Block *///
    NSString *(^myBigBlock)(int, NSString *, NSArray *) = ^(int foo, NSString *barString, NSArray *bash){
        NSInteger count = [bash count];
        NSInteger result = count * foo;
        return [NSString stringWithFormat:@"You passed %@ and the result is %ld", barString, (long)result];
    };
        NSString *theString = @"this is a string";
    NSArray *theArray = [NSArray arrayWithObjects:@"1", @"2", @"3", nil];
    NSString *stringFromTheBlock = myBigBlock(5, theString, theArray);
    NSLog(@"Diff Block--> %@", stringFromTheBlock);
    
///* string Block *///
    NSString *make = @"Honda";
    NSString *(^getFullCarName)(NSString * , NSString*) = ^(NSString *model,NSString *model1) {
        NSString * h1 =[make stringByAppendingFormat:@" %@", model];
        return [h1 stringByAppendingString:model1];
    };
    NSLog(@"string Block-->%@", getFullCarName(@"Accord", @"zen"));    // Honda Accord
    
  
    
    
///* array Block *///
    NSArray *(^ArrayBlock)(NSArray* , NSArray*) = ^(NSArray *arr1,NSArray *arr2){
        NSArray *newArray=[arr1 arrayByAddingObjectsFromArray:arr2];
        return newArray;
    };
    NSArray *theArray1 = [NSArray arrayWithObjects:@"4", @"5", @"6", nil];
    NSArray *arrBlock = ArrayBlock(theArray,theArray1);
    NSLog(@"array Block--> %@",arrBlock);
    
    
////////////////////////////** calling block functions **////////////////////////////
    HelloViewController * hellow = [[HelloViewController alloc]init];
    
///* double function *///
    
    [hellow driveForDuration:4 withVariableSpeed:^double(double time) {
        return 5;
    } steps:6];
    NSLog(@"double function : The car has now driven %.2f meters", hellow.odometer);

    
///* string function *///
    
    [hellow doSomethingWithBlock1:^(NSString *thing1, int thing2) {
        
        NSLog(@"string function : nsstring->%@ ini->%d",thing1,thing2);
            }];
    

    
///* array function *///

    [hellow doSomethingWithBlock2:^(NSArray *thing1) {
        NSLog(@"array function :%@",thing1);
    }];
    

}

-(void)adding{
    NSLog(@"hai done");
}


- (void)driveForDuration:(double)duration
       withVariableSpeed:(double (^)(double time))speedFunction
                   steps:(int)numSteps{
    double dt = duration / numSteps;
    NSLog(@"%f",dt);

    for (int i=1; i<=numSteps; i++) {
        _odometer += speedFunction(i*dt) * dt;
        NSLog(@"%d-%f",i,_odometer);
    }
    
}


-(void)doSomethingWithBlock1:(void (^)(NSString *thing1, int thing2))block{
    NSString * thing = @"hehehehe";
    int thin = 2;
    block(thing,thin);
    
}


-(void)doSomethingWithBlock2:(void (^)(NSArray *thing1))block{
    NSArray *theArray1 = [NSArray arrayWithObjects:@"4", @"5", @"6", nil];
    block(theArray1);

}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
