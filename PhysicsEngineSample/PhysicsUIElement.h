//
//  PhysicsUIElement.h
//  PhysicsEngineSample
//
//  Created by PRANAV KAPOOR on 3/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PhysicsUIView.h"

#define LAST_ELEMENT_STATE_COLLISION 0
#define LAST_ELEMENT_STATE_FREE      1

@interface PhysicsUIElement : NSObject <PhysicsUIViewDelegagte>
{
    volatile bool lastElementState;
    volatile double xVelocity;volatile double yVelocity;
    float mass;
    volatile double renderedLocationX;
    volatile double renderedLocationY;
    volatile bool viewInteractionMode;
    PhysicsUIView *view;
}

-(PhysicsUIElement *) initElementWithView:(UIView *)_view;

-(void) _setViewInteractionMode:(_Bool)_isViewInInteractionMode;

@property (readwrite,assign) volatile double xVelocity;
@property (readwrite,assign) volatile double yVelocity;
@property (readwrite,assign) float mass;
@property (readwrite,assign) bool viewInteractionMode;
@property (readwrite,assign) volatile double renderedLocationX;
@property (readwrite,assign) volatile double renderedLocationY;
@property (readwrite,assign) PhysicsUIView *view;
@property (readwrite,assign) volatile bool lastElementState;
@end
