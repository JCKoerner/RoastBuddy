//
//  FirstViewController.h
//  RoastBuddy
//
//  Created by John Koerner on 8/20/14.
//  Copyright (c) 2014 Etude Group. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstViewController : UIViewController <UIAlertViewDelegate>{
    bool isRunning;
    NSTimeInterval startTime;
    NSTimeInterval elapsedTime;
    
    
    NSTimeInterval globalElapsedTime;
    NSTimeInterval currentEpochStart;
    
    NSTimeInterval firstCrackStart;
    NSTimeInterval firstCrackEnd;
    NSTimeInterval secondCrackStart;
    
    NSInteger phase;
    NSArray *crackArray;
}




@property (nonatomic, retain) NSTimer *roastTimer;

@property (weak, nonatomic) IBOutlet UIView *whiteBackgroundView;


@property (weak, nonatomic) IBOutlet UILabel *timerDisplay;
@property (weak, nonatomic) IBOutlet UILabel *elapsedTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *targetTimeLabel;
@property (weak, nonatomic) IBOutlet UIButton *finishButton;

@property (weak, nonatomic) IBOutlet UIButton *startButton;
@property (weak, nonatomic) IBOutlet UIButton *resetButton;
@property (weak, nonatomic) IBOutlet UIButton *firstCrackStartButton;
@property (weak, nonatomic) IBOutlet UIButton *firstCrackEndButton;
@property (weak, nonatomic) IBOutlet UIButton *secondCrackStartButton;
@property (weak, nonatomic) IBOutlet UIButton *resumeButton;
@property (weak, nonatomic) IBOutlet UIButton *saveButton;

-(IBAction)handleStartPressed:(id)sender;
-(IBAction)handleResetPressed:(id)sender;

-(IBAction)handleFirstCrackStartPressed:(id)sender;
-(IBAction)handleFirstCrackEndPressed:(id)sender;
-(IBAction)handleSecondCrackStartPressed:(id)sender;
-(IBAction)handleFinishButtonPressed:(id)sender;
-(IBAction)handleResumeButtonPressed:(id)sender;
-(IBAction)handleSaveButtonPressed:(id)sender;

-(NSString *)formattedTimeStringForInterval:(NSTimeInterval)theInterval;

+ (UIImage *)imageWithColor:(UIColor *)color;


-(void)setUIButtonAesthetics:(UIButton *)button forMode:(int)mode;

-(void)activateButton:(UIButton *)button;
-(void)deactivateButton:(UIButton *)button;

@end
