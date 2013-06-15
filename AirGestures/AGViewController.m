//
//  AGViewController.m
//  AirGestures
//
//  Created by Jon Como on 6/15/13.
//  Copyright (c) 2013 Jon Como. All rights reserved.
//

#import "AGViewController.h"
#import "AGAirGestureRecognizer.h"
#import <QuartzCore/QuartzCore.h>

@interface AGViewController ()
{
    AGAirGestureRecognizer *air;
    
    __weak IBOutlet UIView *box;
}

@end

@implementation AGViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    air = [[AGAirGestureRecognizer alloc] init];
    
    [air setBlock:^(CGPoint center, float intensity){
        dispatch_async(dispatch_get_main_queue(), ^{
            box.layer.transform = CATransform3DMakeTranslation( (0.5-center.x) * 200, (0.5-center.y) * 200, 0);
        });
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
