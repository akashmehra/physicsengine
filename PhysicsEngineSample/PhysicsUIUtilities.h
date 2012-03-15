//
//  PhysicsUIUtilities.h
//  PhysicsEngineSample
//
//  Created by PRANAV KAPOOR on 3/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PhysicsUIUtilities : NSObject
#define COLLISION_DOES_NOT_COLLIDE 0
#define COLLISOIN_DOES_COLLIDE 1
#define COLLISION_TOP 1
#define COLLISION_BOTTOM 2
#define COLLISION_LEFT 4
#define COLLISION_RIGHT 8
+(float) distanceBetweenThePoints:(CGPoint) pt1 :(CGPoint) pt2;
+(float) velocityForDistance:(float)distance inTimeInterval:(NSTimeInterval )interval;
+(int) doesView:(UIView *)view intersectWithFrame:(CGRect)frame;
+(int) doesView:(UIView *)view leaveTheFrame:(CGRect)frame;

@end
