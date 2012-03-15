//
//  PhysicsController.m
//  PhysicsEngineSample
//
//  Created by PRANAV KAPOOR on 3/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PhysicsController.h"

@implementation PhysicsController

-(PhysicsController *) initPhysicsContollerWithFrictionParameter:(float)_frictionParamter
                                                DampingParameter:(float)_boundaryDampingParameter 
                                                            View:(UIView *)_canvas
{
    frictionParameter=_frictionParamter;
    boundaryDampingParameter=_boundaryDampingParameter;
    UIControlElements=[[NSMutableArray alloc] init];
    canvas=_canvas;
    return self;
}
-(void) loadUIElements:(NSMutableArray *) elements
{
    for(int c=0;c<[elements count];c++)
    {
        PhysicsUIElement *element=[elements objectAtIndex:c];
        [UIControlElements addObject:element];
        
    }
}


-(void) renderElements
{
    for(int c=0;c<[UIControlElements count];c++)
    {
        volatile PhysicsUIElement *element=[UIControlElements objectAtIndex:c];
      
        element.renderedLocationX=element.renderedLocationX+element.xVelocity;
        element.renderedLocationY=element.renderedLocationY+element.yVelocity;

        ///CHECK FOR COLLISION WITH BOUNDING BOX;
        int collisionPoint;
        collisionPoint=[PhysicsUIUtilities doesView:element.view leaveTheFrame:CGRectMake(0, 0, canvas.frame.size.width, canvas.frame.size.height)];
        if(collisionPoint!=0) /// COLLISION WITH WALL IS FREE BODY COLLISION
        {
            if(element.lastElementState==LAST_ELEMENT_STATE_FREE)
            {
                if((collisionPoint & COLLISION_TOP)!=0)
                {
                    double yVel=element.yVelocity;
                    element.yVelocity=yVel*-1;
                }
                else if((collisionPoint & COLLISION_BOTTOM)!=0)
                {
                    double yVel=element.yVelocity;
                    element.yVelocity=yVel*-1;
                }   
                if((collisionPoint & COLLISION_LEFT)!=0)
                {
                    double xVel=element.xVelocity;
                    element.xVelocity=xVel*-1;
                }
                else if((collisionPoint & COLLISION_RIGHT)!=0)
                {
                    double xVel=element.xVelocity;
                    element.xVelocity=xVel*-1;
                }
            }
            element.lastElementState=LAST_ELEMENT_STATE_COLLISION;
        }
        else
        {
            element.lastElementState=LAST_ELEMENT_STATE_FREE;
            ///CHECK FOR COLLISION WITH UIELEMENTS;
            for(int i=0;i<[UIControlElements count];i++)
            {
                if(i==c)continue;
                PhysicsUIElement *collisionElement=[UIControlElements objectAtIndex:i];
                
                collisionPoint=[PhysicsUIUtilities doesView:element.view intersectWithFrame:collisionElement.view.frame];
                if(collisionPoint!=0) /// COLLISION WITH WALL IS FREE BODY COLLISION
                {
                    if(element.lastElementState==LAST_ELEMENT_STATE_FREE)
                    {
                        
                        if((collisionPoint & COLLISION_TOP)!=0)
                        {
                            
                            double xVelocity=collisionElement.xVelocity;
                            double yVelocity=collisionElement.yVelocity;
                            collisionElement.yVelocity*=-1;
                            collisionElement.xVelocity=element.xVelocity;
                            element.yVelocity=element.yVelocity*-1;
                            element.xVelocity=xVelocity;
                                                    }
                        else if((collisionPoint & COLLISION_BOTTOM)!=0)
                        {
                            double xVelocity=collisionElement.xVelocity;
                            double yVelocity=collisionElement.yVelocity;
                            collisionElement.yVelocity*=-1;
                            collisionElement.xVelocity=element.xVelocity;
                            element.yVelocity=element.yVelocity*-1;
                            element.xVelocity=xVelocity;
                        }   
                        if((collisionPoint & COLLISION_LEFT)!=0)
                        {
                            double xVelocity=collisionElement.xVelocity;
                            double yVelocity=collisionElement.yVelocity;
                            collisionElement.xVelocity*=-1;
                            collisionElement.yVelocity=element.yVelocity;
                            element.xVelocity=element.xVelocity*-1;
                            element.yVelocity=yVelocity;

                        }
                        else if((collisionPoint & COLLISION_RIGHT)!=0)
                        {
                            double xVelocity=collisionElement.xVelocity;
                            double yVelocity=collisionElement.yVelocity;
                            collisionElement.xVelocity*=-1;
                            collisionElement.yVelocity=element.yVelocity;
                            element.xVelocity=element.xVelocity*-1;
                            element.yVelocity=yVelocity;

                        }

            
                        //element.lastElementState=LAST_ELEMENT_STATE_COLLISION;
                        //collisionElement.lastElementState=LAST_ELEMENT_STATE_COLLISION;
                        
                    }
                }
                else
                {
                    element.lastElementState=LAST_ELEMENT_STATE_FREE;
                }
                
                
                
            }
        }
        element.renderedLocationX=element.renderedLocationX+element.xVelocity;
        element.renderedLocationY=element.renderedLocationY+element.yVelocity;
        
        
        
        
        
        
    }
}

-(void) updateElements
{
    for(int c=0;c<[UIControlElements count];c++)
    {
        PhysicsUIElement *element=[UIControlElements objectAtIndex:c];
        if ([element viewInteractionMode]==false)
            {
                    element.view.center=CGPointMake(element.renderedLocationX,element.renderedLocationY);
            }
    }
}

-(void) startEngine
{
    engineState=ENGINE_STATE_RUNNING;
    [NSThread detachNewThreadSelector:@selector(renderingThread) toTarget:self withObject:nil];
}
-(void) stopEngine
{
    engineState=ENGINE_STATE_STOP;
}

-(void) pauseEngine
{
    engineState=ENGINE_STATE_PAUSE;
}

-(void) renderingThread
{
    while(engineState!=ENGINE_STATE_STOP)
    {
        if(engineState!=ENGINE_STATE_PAUSE)
        {
            [self renderElements];
            [self performSelectorOnMainThread:@selector(updateElements) withObject:nil waitUntilDone:YES];
        }
        [NSThread sleepForTimeInterval:0.016];
    }
}
@end
