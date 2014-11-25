//
//  SaveRoastViewController.m
//  RoastBuddy
//
//  Created by John Koerner on 8/28/14.
//  Copyright (c) 2014 Etude Group. All rights reserved.
//

#import "SaveRoastViewController.h"


@interface SaveRoastViewController ()

@end

@implementation SaveRoastViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


-(id)initWithRoast:(Roast *)theRoast {
    self = [super init];
    if (self) {
        roast = theRoast;
        self.title = @"Roast Details";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    NSLog(@"%f", roast.firstCrackEnd);
    
}

- (void)viewDidAppear:(BOOL)animated {
    self.navigationController.navigationBarHidden = FALSE;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark UITableView delegate methods
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                       reuseIdentifier:@"cell"];
        [cell.textLabel setTextColor:[UIColor darkGrayColor]];
        [cell.detailTextLabel setTextColor:[UIColor lightGrayColor]];
    }
    
    
    cell.textLabel.text = @"test";
    cell.detailTextLabel.text = @"123";
    
    
    return cell;
    
}

-(int)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}




@end
