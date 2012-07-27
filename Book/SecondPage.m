//
//  SecondPage.m
//  Book
//
//  Created by Thiago Silva on 7/27/12.
//  Copyright (c) 2012 LPJ. All rights reserved.
//

#import "SecondPage.h"

@implementation SecondPage

@synthesize run, background;

-(void)clean{
    [run setImage:nil];
    run.animationImages = nil;
}

-(void)displayRun{
    
    run = [[UIImageView alloc] initWithFrame:CGRectMake(10, 200, 200, 200)];
    [run setImage:[UIImage imageNamed:@"run-1.jpg"]];
    run.opaque = YES;
    
    background = [[UIImageView alloc] initWithFrame:CGRectMake(0, -200, 1024, 879)];
    [background setImage:[UIImage imageNamed:@"city.jpg"]];
    background.opaque = YES;
    [self.view addSubview:background];
    [self.view sendSubviewToBack:background];

}

-(IBAction)play:(UITapGestureRecognizer *)sender{
     NSLog(@"TAPED_TIMER");
   // [self clean];
    run = [[UIImageView alloc] initWithFrame:CGRectMake(10, 200, 200, 200)];
    run.animationImages = [NSArray arrayWithObjects:
                           [UIImage imageNamed:@"run-1.jpg"],
                           [UIImage imageNamed:@"run-2.jpg"],
                           [UIImage imageNamed:@"run-3.jpg"],
                           [UIImage imageNamed:@"run-4.jpg"],
                           [UIImage imageNamed:@"run-5.jpg"],
                           [UIImage imageNamed:@"run-6.jpg"], nil];
    run.animationDuration = 0.5;
    run.animationRepeatCount = 5;
    [run startAnimating];
    [self.view addSubview:run];
    
    //background = [[UIImageView alloc] initWithFrame:CGRectMake(0, -200, 1024, 879)];
    
    [UIImageView animateWithDuration:2.5 animations:^{
        CGRect frame = background.frame;
        frame.origin.x = -704;
        background.frame = frame;
    }];
    [UIImageView commitAnimations];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"SecondPage", @"SecondPage");
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self displayRun];
    run.userInteractionEnabled = YES;
    UITapGestureRecognizer *doubleTapTimer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(play:)];
    doubleTapTimer.numberOfTapsRequired = 1;
    [run addGestureRecognizer:doubleTapTimer];
    [self.view addSubview:run];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
