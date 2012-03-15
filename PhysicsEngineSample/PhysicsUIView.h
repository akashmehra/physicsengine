//
//  PhysicsUIView.h
//  PhysicsEngineSample
//
//  Created by PRANAV KAPOOR on 3/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol PhysicsUIViewDelegagte 
-(void) viewVelocityChanged:(float)xVelocity:(float)yVelocity;
-(void) _setViewInteractionMode:(bool)isViewInInteractionMode;
@end
@interface PhysicsUIView : UIView
{
    id<PhysicsUIViewDelegagte> delegate;
    NSDate *interactionStartTime;
    CGPoint startLocation;
}
@property (readwrite,assign) id<PhysicsUIViewDelegagte> delegate;

-(PhysicsUIView *) initWithFrame:(CGRect)frame;
@end
