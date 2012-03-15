//
//  PhysicsUIElement.m
//  PhysicsEngineSample
//
//  Created by PRANAV KAPOOR on 3/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PhysicsUIElement.h"

@implementation PhysicsUIElement
@synthesize xVelocity;
@synthesize yVelocity;
@synthesize renderedLocationX;
@synthesize renderedLocationY;
@synthesize viewInteractionMode;
@synthesize mass;
@synthesize view;
@synthesize lastElementState;

-(PhysicsUIElement *) initElementWithView:(PhysicsUIView *)_view
{
    view=_view;
    renderedLocationX=view.center.x;
    renderedLocationY=view.center.y;
    view.delegate=self;
    xVelocity=0;
    yVelocity=-1;
    mass=1;
    lastElementState=LAST_ELEMENT_STATE_FREE;
    return self;
}

-(void) viewVelocityChanged:(float)_xVelocity:(float)_yVelocity
{
    xVelocity=_xVelocity;
    yVelocity=_yVelocity;
    mass=1;
}

-(void) _setViewInteractionMode:(_Bool)_isViewInInteractionMode
{
    viewInteractionMode=_isViewInInteractionMode;
}
    

@end
