//
//  PhysicsController.h
//  PhysicsEngineSample
//
//  Created by PRANAV KAPOOR on 3/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PhysicsUIElement.h"
#import "PhysicsUIUtilities.h"

#define ENGINE_STATE_RUNNING 2
#define ENGINE_STATE_PAUSE   1
#define ENGINE_STATE_STOP    0

@interface PhysicsController : NSObject
{  
    int engineState;
    float frictionParameter;
    float boundaryDampingParameter;
    NSMutableArray *UIControlElements;
    UIView *canvas;
}  



-(PhysicsController *) initPhysicsContollerWithFrictionParameter:(float)_frictionParamter
                                                DampingParameter:(float)_boundaryDampingParameter 
                                                            View:(UIView *)_canvas;

-(void) renderElements;
-(void) startEngine;
-(void) stopEngine;
-(void) pauseEngine;
-(void) renderingThread;
-(void) loadUIElements:(NSMutableArray *) elements;


@end
