//
//  SaveRoastViewController.h
//  RoastBuddy
//
//  Created by John Koerner on 8/28/14.
//  Copyright (c) 2014 Etude Group. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Roast.h"

@interface SaveRoastViewController : UIViewController <UITableViewDataSource, UITableViewDelegate> {
    Roast *roast;
}



-(id)initWithRoast:(Roast *)theRoast;





@property (weak, nonatomic) IBOutlet UITableView *roastDetailsTableView;





@end
