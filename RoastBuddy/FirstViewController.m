//
//  FirstViewController.m
//  RoastBuddy
//
//  Created by John Koerner on 8/20/14.
//  Copyright (c) 2014 Etude Group. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.timerDisplay.text = @"0:00.0";
    isRunning = FALSE;
    
    
    CGRect initialFrame = self.startButton.frame;
    [self.startButton setTitle:@"START" forState:UIControlStateNormal];
    [self.startButton setBackgroundColor:[UIColor whiteColor]];
    self.startButton.layer.cornerRadius = initialFrame.size.width/2;
    self.startButton.layer.borderWidth = 1.0f;
    
    
   
    self.startButton.layer.borderColor = [UIColor colorWithRed:0.42 green:0.565 blue:0.855 alpha:1.0].CGColor;
    [self.startButton setTitleColor:[UIColor colorWithRed:.1 green:.1 blue:.1 alpha:.2] forState:UIControlStateNormal];
    [self.startButton setTitleColor:[UIColor colorWithRed:0.42 green:0.565 blue:0.855 alpha:1.0] forState:UIControlStateHighlighted];

    elapsedTime = 0;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(NSString *)formattedTimeStringForInterval:(NSTimeInterval)theInterval {
    NSTimeInterval intervalCopy = theInterval;
    int mins = (int)(intervalCopy / 60.0);
    intervalCopy -= mins * 60;
    int secs = (int)intervalCopy;
    intervalCopy -= secs;
    int fraction = intervalCopy * 10.0;
    return [NSString stringWithFormat:@"%u:%02u.%u", mins, secs, fraction];
    
    
}

-(void)updateTimer {
   
    if (isRunning == FALSE) {
        return;
    }
    
    NSTimeInterval currentTime = [NSDate timeIntervalSinceReferenceDate];
    NSTimeInterval elapsed = currentTime - startTime;
    

    
    self.timerDisplay.text = [self formattedTimeStringForInterval:elapsed];
//    self.elapsedTime.text = [NSString stringWithFormat:<#(NSString *), ...#>]
    
    [self performSelector:@selector(updateTimer) withObject:self afterDelay:0.1];
}

-(IBAction)handleStartPressed:(id)sender {
    //
    if (isRunning == FALSE && elapsedTime==0) {
        isRunning = TRUE;
        elapsedTime = 0;
        startTime = [NSDate timeIntervalSinceReferenceDate];
       
        
        [self.startButton setTitle:@"STOP" forState:UIControlStateNormal];
        [self updateTimer];
        
    } else if (isRunning == FALSE && elapsedTime>0) {
        isRunning = TRUE;
        NSTimeInterval currentTime = [NSDate timeIntervalSinceReferenceDate];
        NSTimeInterval elapsed = currentTime - startTime;
        elapsedTime += elapsed;

    } else {
        
    
        
        [self.startButton setTitle:@"START" forState:UIControlStateNormal];
        isRunning = FALSE;
    }
//    
//    self.roastTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updateTimer) userInfo:nil repeats:YES];
    
}



@end
