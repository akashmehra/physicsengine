//
//  ViewController.m
//  PhysicsEngineSample
//
//  Created by PRANAV KAPOOR on 3/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initController];
	// Do any additional setup after loading the view, typically from a nib.
}


-(void) initController
{
    physicsContoller=[[PhysicsController alloc] initPhysicsContollerWithFrictionParameter:0.1 DampingParameter:0.1 View:canvasView];
    PhysicsUIView *view1=[[PhysicsUIView alloc] initWithFrame:CGRectMake(0, 0, 32, 32)];
    PhysicsUIView *view2=[[PhysicsUIView alloc] initWithFrame:CGRectMake(128, 128, 32, 32)];
    PhysicsUIView *view3=[[PhysicsUIView alloc] initWithFrame:CGRectMake(300, 300, 64, 64)];
    PhysicsUIView *view4=[[PhysicsUIView alloc] initWithFrame:CGRectMake(328, 328, 64, 64)];
    PhysicsUIView *view5=[[PhysicsUIView alloc] initWithFrame:CGRectMake(500, 500, 128, 128)];
    PhysicsUIView *view6=[[PhysicsUIView alloc] initWithFrame:CGRectMake(700, 700, 32, 32)];
    [canvasView addSubview:view1];
    [canvasView addSubview:view2];
    [canvasView addSubview:view3];
    [canvasView addSubview:view4];
    [canvasView addSubview:view5];
    [canvasView addSubview:view6];


    PhysicsUIElement *element1=[[PhysicsUIElement alloc] initElementWithView:view1];
    PhysicsUIElement *element2=[[PhysicsUIElement alloc] initElementWithView:view2];
    PhysicsUIElement *element3=[[PhysicsUIElement alloc] initElementWithView:view3];
    PhysicsUIElement *element4=[[PhysicsUIElement alloc] initElementWithView:view4];
    PhysicsUIElement *element5=[[PhysicsUIElement alloc] initElementWithView:view5];
    PhysicsUIElement *element6=[[PhysicsUIElement alloc] initElementWithView:view6];

    NSMutableArray *array=[[NSMutableArray alloc] initWithObjects:element1, element2,element3,element4,element5,element6,nil];
    [physicsContoller loadUIElements:array];
    
}


-(IBAction) startEngine
{
    [physicsContoller startEngine];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

@end
