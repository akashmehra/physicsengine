//
//  ViewController.h
//  PhysicsEngineSample
//
//  Created by PRANAV KAPOOR on 3/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PhysicsController.h"

@interface ViewController : UIViewController
    {
        PhysicsController *physicsContoller;
        IBOutlet UIView *canvasView;
    }

-(void) initController;
-(IBAction) startEngine;
@end
