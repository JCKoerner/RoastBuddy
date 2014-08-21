//
//  FirstViewController.h
//  RoastBuddy
//
//  Created by John Koerner on 8/20/14.
//  Copyright (c) 2014 Etude Group. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstViewController : UIViewController {
    bool isRunning;
    NSTimeInterval startTime;
    NSTimeInterval elapsedTime;
    
    
    NSTimeInterval globalElapsedTime;
    NSTimeInterval currentEpochStart;
}




@property (nonatomic, retain) NSTimer *roastTimer;



@property (weak, nonatomic) IBOutlet UILabel *timerDisplay;
@property (weak, nonatomic) IBOutlet UILabel *elapsedTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *targetTimeLabel;

@property (weak, nonatomic) IBOutlet UIButton *startButton;
@property (weak, nonatomic) IBOutlet UIButton *resetButton;

-(IBAction)handleStartPressed:(id)sender;
-(IBAction)handleResetPressed:(id)sender;


-(NSString *)formattedTimeStringForInterval:(NSTimeInterval)theInterval;

@end
