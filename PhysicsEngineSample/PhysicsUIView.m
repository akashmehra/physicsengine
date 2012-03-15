//
//  PhysicsUIView.m
//  PhysicsEngineSample
//
//  Created by PRANAV KAPOOR on 3/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PhysicsUIView.h"
#import "PhysicsUIUtilities.h"

@implementation PhysicsUIView
@synthesize delegate;
-(PhysicsUIView *) initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    self.backgroundColor=[UIColor whiteColor];
    return self;
}

-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    interactionStartTime=[NSDate date];
    startLocation=self.center;
    [delegate _setViewInteractionMode:TRUE];
}

-(void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch* touch = [touches anyObject];
    CGPoint touchPoint = [touch locationInView:[self superview]];
    self.center=touchPoint;
     /*float delX=self.center.x-startLocation.x;
    float delY=self.center.y-startLocation.y;
    NSDate *time = [NSDate date];
   NSTimeInterval interactionInterval = [time timeIntervalSinceDate:interactionStartTime];
    float velX=[PhysicsUIUtilities velocityForDistance:delX inTimeInterval:interactionInterval];
    float velY=[PhysicsUIUtilities velocityForDistance:delY inTimeInterval:interactionInterval];
    [delegate viewVelocityChanged:velX :velY];*/

}

-(void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{  
    UITouch* touch = [touches anyObject];
    CGPoint touchPoint = [touch locationInView:[self superview]];
    self.center=touchPoint;
    float delX=self.center.x-startLocation.x;
    float delY=self.center.y-startLocation.y;
    NSTimeInterval interactionInterval ;//= [interactionStartTime timeIntervalSinceNow];
    interactionInterval=1;
    float velX=[PhysicsUIUtilities velocityForDistance:delX inTimeInterval:interactionInterval];
    float velY=[PhysicsUIUtilities velocityForDistance:delY inTimeInterval:interactionInterval];
    
    [delegate viewVelocityChanged:velX :velY];
    [delegate _setViewInteractionMode:FALSE];

}



@end
