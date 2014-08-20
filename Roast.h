//
//  Roast.h
//  RoastBuddy
//
//  Created by John Koerner on 8/20/14.
//  Copyright (c) 2014 Etude Group. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Roast : NSObject<NSCoding> {
    
    
}



@property(nonatomic, retain) NSDate *roastDate;
@property(assign) NSTimeInterval firstCrack;
@property(assign) NSTimeInterval secondCrack;
@property(assign) NSTimeInterval totalRoastTime;

@property(nonatomic, retain) NSString *beanName;
@property(nonatomic, retain) NSString *roastNotes;



-(float)firstCrackPercentOfTotal;






@end
