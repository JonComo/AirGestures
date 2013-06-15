//
//  AGAirGestureRecognizer.h
//  AirGestures
//
//  Created by Jon Como on 6/15/13.
//  Copyright (c) 2013 Jon Como. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^GestureRecognizedBlock)(CGPoint center, float intensity);

@interface AGAirGestureRecognizer : NSObject

@property (nonatomic, copy) GestureRecognizedBlock block;

@end