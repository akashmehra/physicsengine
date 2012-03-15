//
//  PhysicsUIUtilities.m
//  PhysicsEngineSample
//
//  Created by PRANAV KAPOOR on 3/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PhysicsUIUtilities.h"

@implementation PhysicsUIUtilities
+(float) distanceBetweenThePoints:(CGPoint) pt1 :(CGPoint) pt2
{
    float distance= sqrtf((pt1.x-pt2.x)*(pt1.x-pt2.x) + (pt1.y-pt2.y)*(pt1.y-pt2.y));
    return distance;
}

/////GIVES VELOCITY IN SENSE OF PIXELS MOVED EVERY 0.16MS : Conforms to 60FPS
+(float) velocityForDistance:(float)distance inTimeInterval:(NSTimeInterval)interval
{
    float velocity=distance/(interval*1000);
    velocity=velocity*16;
    return velocity;
}


+(int) doesView:(UIView *)view intersectWithFrame:(CGRect)frame
{
    CGPoint top=CGPointMake(view.center.x, view.center.y-view.frame.size.height/2);
    CGPoint bottom=CGPointMake(view.center.x, view.center.y+view.frame.size.height/2);
    CGPoint left=CGPointMake(view.center.x-view.frame.size.width/2, view.center.y);
    CGPoint right=CGPointMake(view.center.x+view.frame.size.width/2, view.center.y);
    int collisionPoint=0;
    if (CGRectContainsPoint(frame, top))collisionPoint=collisionPoint|1;
    if (CGRectContainsPoint(frame, bottom))collisionPoint=collisionPoint | 2;
    if (CGRectContainsPoint(frame, left))collisionPoint=collisionPoint | 4;
    if (CGRectContainsPoint(frame, right))collisionPoint=collisionPoint | 8;
    return collisionPoint;
}

+(int) doesView:(UIView *)view leaveTheFrame:(CGRect)frame
{
    CGPoint top=CGPointMake(view.center.x, view.center.y-view.frame.size.height/2);
    CGPoint bottom=CGPointMake(view.center.x, view.center.y+view.frame.size.height/2);
    CGPoint left=CGPointMake(view.center.x-view.frame.size.width/2, view.center.y);
    CGPoint right=CGPointMake(view.center.x+view.frame.size.width/2, view.center.y);
    int collisionPoint=0;
    if (!CGRectContainsPoint(frame, top))collisionPoint=collisionPoint|1;
    if (!CGRectContainsPoint(frame, bottom))collisionPoint=collisionPoint | 2;
    if (!CGRectContainsPoint(frame, left))collisionPoint=collisionPoint | 4;
    if (!CGRectContainsPoint(frame, right))collisionPoint=collisionPoint | 8;
    return collisionPoint;
}

@end
