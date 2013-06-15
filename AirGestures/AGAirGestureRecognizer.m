//
//  AGAirGestureRecognizer.m
//  AirGestures
//
//  Created by Jon Como on 6/15/13.
//  Copyright (c) 2013 Jon Como. All rights reserved.
//

#import "AGAirGestureRecognizer.h"
#import "GPUImage.h"

@implementation AGAirGestureRecognizer
{
    GPUImageVideoCamera *videoCamera;
    GPUImageMotionDetector *customFilter;
}

-(id)init
{
    if (self = [super init]) {
        //init
        
        [self setupCamera];
    }
    
    return self;
}

-(void)setupCamera
{
    videoCamera = [[GPUImageVideoCamera alloc] initWithSessionPreset:AVCaptureSessionPreset640x480 cameraPosition:AVCaptureDevicePositionFront];
    videoCamera.outputImageOrientation = UIInterfaceOrientationPortrait;
    
    customFilter = [[GPUImageMotionDetector alloc] init];
    
    __weak AGAirGestureRecognizer *weakSelf = self;
    
    [customFilter setMotionDetectionBlock:^(CGPoint center, CGFloat intensity, CMTime time) {
        if (weakSelf.block) {
            weakSelf.block(center, intensity);
        }
    }];
    
    [videoCamera addTarget:customFilter];
    
    [videoCamera startCameraCapture];
}

@end
