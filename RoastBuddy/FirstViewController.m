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
    self.startButton.layer.cornerRadius = 20.0;
    self.startButton.layer.borderWidth = 1.0f;
   
    
    [self.finishButton setTitle:@"Finish" forState:UIControlStateNormal];
    [self.finishButton  setBackgroundColor:[UIColor whiteColor]];
    self.finishButton.layer.cornerRadius = 20.0;
    self.finishButton.layer.borderWidth = 1.0f;
    self.finishButton.layer.borderColor = [UIColor darkGrayColor].CGColor;
   
    
    [self.resumeButton setTitle:@"Resume" forState:UIControlStateNormal];
    [self.resumeButton  setBackgroundColor:[UIColor whiteColor]];
    self.resumeButton.layer.cornerRadius = 20.0;
    self.resumeButton.layer.borderWidth = 1.0f;
    self.resumeButton.layer.borderColor = [UIColor darkGrayColor].CGColor;
    
    [self.saveButton setTitle:@"Finish" forState:UIControlStateNormal];
    [self.saveButton setBackgroundColor:[UIColor whiteColor]];
    self.saveButton.layer.cornerRadius = 20.0;
    self.saveButton.layer.borderWidth = 1.0f;
    
    self.saveButton.layer.borderColor = [UIColor colorWithRed:0 green:0.584 blue:0.337 alpha:.9].CGColor;
    [self.saveButton setTitleColor:[UIColor colorWithRed:0 green:0.584 blue:0.337 alpha:.9] forState:UIControlStateNormal];
    
    
    
    self.whiteBackgroundView.layer.borderColor = [UIColor colorWithWhite:.7 alpha:1].CGColor;
    self.whiteBackgroundView.layer.borderWidth = .8f;
    

    
    [self.resetButton setTitle:@"RESET" forState:UIControlStateNormal];
    [self.resetButton setBackgroundColor:[UIColor whiteColor]];
    self.resetButton.layer.cornerRadius = initialFrame.size.width/2;
    self.resetButton.layer.borderWidth = 1.0f;
    
    self.resetButton.layer.borderColor = [UIColor colorWithRed:0.42 green:0.565 blue:0.855 alpha:1.0].CGColor;
    [self.resetButton setTitleColor:[UIColor colorWithRed:.1 green:.1 blue:.1 alpha:.2] forState:UIControlStateNormal];
    [self.resetButton setTitleColor:[UIColor colorWithRed:0.42 green:0.565 blue:0.855 alpha:1.0] forState:UIControlStateHighlighted];
    
    
    
    crackArray = [[NSArray alloc] initWithObjects:self.firstCrackStartButton, self.firstCrackEndButton, self.secondCrackStartButton, nil];
    for (UIButton *button in crackArray) {
        button.clipsToBounds = TRUE;
        [button setBackgroundColor:[UIColor clearColor]];
        
        [button setBackgroundImage:[FirstViewController imageWithColor:[UIColor whiteColor]] forState:UIControlStateNormal];
        [button setBackgroundImage:[FirstViewController imageWithColor:[UIColor clearColor]] forState:UIControlStateDisabled];
        
        button.layer.cornerRadius = button.frame.size.height/2;
        button.layer.borderWidth = 1.0f;
        
        button.layer.borderColor = [UIColor lightGrayColor].CGColor;
        [button setTitleColor:[UIColor colorWithRed:0.42 green:0.565 blue:0.855 alpha:1.0] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor lightGrayColor] forState:UIControlStateDisabled];

    }
    
   self.view.backgroundColor = [UIColor colorWithRed:226.0/255.0 green:229.0/255.0 blue:234.0/255.0 alpha:1.0];
    
    
    [self resetDisplay];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark Utility Methods

-(NSString *)formattedTimeStringForInterval:(NSTimeInterval)theInterval {
    NSTimeInterval intervalCopy = theInterval;
    int mins = (int)(intervalCopy / 60.0);
    intervalCopy -= mins * 60;
    int secs = (int)intervalCopy;
    intervalCopy -= secs;
//    int fraction = intervalCopy * 10.0;
    return [NSString stringWithFormat:@"%02u:%02u", mins, secs];
    
    
}


+ (UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

#pragma mark UI/Timer Methods

-(void)updateGlobalTimer {
    
    if (isRunning == FALSE) {
        return;
    }
    
    NSTimeInterval currentTime = [NSDate timeIntervalSinceReferenceDate];
    NSTimeInterval epochElapsed = currentTime - currentEpochStart;
    
    

    self.elapsedTimeLabel.text = [self formattedTimeStringForInterval:globalElapsedTime+epochElapsed];
    
    
    if (firstCrackStart != 0 && phase >=1) {
        self.timerDisplay.text = [NSString stringWithFormat:@"Time since 1C:   %@",[self formattedTimeStringForInterval:currentTime-firstCrackStart]] ;
    }
    
    [self performSelector:@selector(updateGlobalTimer) withObject:self afterDelay:0.01];
}


-(void)resetDisplay {
    self.timerDisplay.text = @"";
    self.targetTimeLabel.text = @"";
    self.elapsedTimeLabel.text = @"00:00";
    isRunning = FALSE;
    globalElapsedTime = 0;
    self.timerDisplay.alpha = 0;

    
    
    self.startButton.layer.borderColor = [UIColor colorWithRed:0 green:0.584 blue:0.337 alpha:.9].CGColor;
    [self.startButton setTitleColor:[UIColor colorWithRed:0 green:0.584 blue:0.337 alpha:.9] forState:UIControlStateNormal];
    
    [self.startButton setTitle:@"Start" forState:UIControlStateNormal];
    
    self.finishButton.alpha = 0;
    
    firstCrackStart = 0;
    firstCrackEnd = 0;
    secondCrackStart = 0;
    phase = 0;
    self.firstCrackEndButton.enabled = FALSE;
    self.secondCrackStartButton.enabled = FALSE;
    self.firstCrackStartButton.enabled = FALSE;
    [self.finishButton setAlpha:0];
    [self.timerDisplay setAlpha:0];
    [self.resumeButton setAlpha:0];
    [self.saveButton setAlpha:0];
    
    for (UIButton *button in crackArray) {
        button.layer.borderColor = [UIColor lightGrayColor].CGColor;
    }
    

}


-(void)setUIButtonAesthetics:(UIButton *)button forMode:(int)mode {
    if (mode==0) {
        button.layer.borderColor = [UIColor lightGrayColor].CGColor;
    } else if (mode==1) {
        button.layer.borderColor = [UIColor colorWithRed:0.42 green:0.565 blue:0.855 alpha:1.0].CGColor;
    }
}

-(void)activateButton:(UIButton *)button {
    button.enabled = TRUE;
    button.layer.borderColor = [UIColor colorWithRed:0.42 green:0.565 blue:0.855 alpha:1.0].CGColor;
}

-(void)deactivateButton:(UIButton *)button {
    button.enabled = FALSE;
    button.layer.borderColor = [UIColor lightGrayColor].CGColor;
}


# pragma mark IBActions

-(IBAction)handleStartPressed:(id)sender {
    
    if (isRunning == FALSE && phase == 0) {
        //new timer case
        isRunning = TRUE;
        self.startButton.layer.borderColor = [UIColor redColor].CGColor;
        [self.startButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [self.startButton setTitle:@"Cancel" forState:UIControlStateNormal];
        
        currentEpochStart = [NSDate timeIntervalSinceReferenceDate];
        
        [self updateGlobalTimer];
        
        [self activateButton:self.firstCrackStartButton];
        
        
        
        
    } else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Cancel Roast" message:@"Are you sure you want to cancel this roast?" delegate:self cancelButtonTitle:@"No" otherButtonTitles:@"Yes", nil];
        [alert show];
        [alert setDelegate:self];


    }
    
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    if (buttonIndex==1) {
        [self handleResetPressed:nil];
    }
}

-(IBAction)handleResetPressed:(id)sender {
    [self resetDisplay];
}


-(IBAction)handleFirstCrackStartPressed:(id)sender {
    // target roast duration logic
    NSTimeInterval currentTime = [NSDate timeIntervalSinceReferenceDate];
    NSTimeInterval epochElapsed = currentTime - currentEpochStart;
    
    NSTimeInterval targetIntervalHigh = epochElapsed/.75;
    NSTimeInterval targetIntervalLow = epochElapsed/.80;
    
    NSString *theText = [NSString stringWithFormat:@"%@ - %@", [self formattedTimeStringForInterval:targetIntervalLow], [self formattedTimeStringForInterval:targetIntervalHigh]];
    [self.targetTimeLabel setText:theText];
    
    
    // UI updates
    
    [self.finishButton setTitle:@"Pause" forState:UIControlStateNormal];
    [UIView animateWithDuration:.5 animations:^{
        self.timerDisplay.alpha = 1;
        self.finishButton.alpha = 1;
    }];

    firstCrackStart = [NSDate timeIntervalSinceReferenceDate];
    phase = 1;
    
    [self deactivateButton:self.firstCrackStartButton];

    [self activateButton:self.firstCrackEndButton];

}

-(IBAction)handleFirstCrackEndPressed:(id)sender {
    firstCrackEnd = [NSDate timeIntervalSinceReferenceDate];
    phase = 2;
    
    [self deactivateButton:self.firstCrackEndButton];
    
    [self activateButton:self.secondCrackStartButton];
    
    
}

-(IBAction)handleSecondCrackStartPressed:(id)sender {
    secondCrackStart = [NSDate timeIntervalSinceReferenceDate];
    phase = 3;
    
    [self deactivateButton:self.secondCrackStartButton];
}

-(IBAction)handleFinishButtonPressed:(id)sender {
    if (isRunning && phase<4) {
        
        isRunning = FALSE;
        [sender setAlpha:0];
        [self.resumeButton setAlpha:1];
        [self.saveButton setAlpha:1];
    } else {
        
    }

}

-(IBAction)handleResumeButtonPressed:(id)sender {
    isRunning = TRUE;
    [self updateGlobalTimer];
    
    [self.resumeButton setAlpha:0];
    [self.saveButton setAlpha:0];
    [UIView animateWithDuration:.5 animations:^{

        [self.finishButton setAlpha:1];
    }];
    
    

}

-(IBAction)handleSaveButtonPressed:(id)sender {
    
}



@end
