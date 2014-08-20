//
//  Roast.m
//  RoastBuddy
//
//  Created by John Koerner on 8/20/14.
//  Copyright (c) 2014 Etude Group. All rights reserved.
//

#import "Roast.h"

@implementation Roast
@synthesize firstCrack, secondCrack, totalRoastTime;
@synthesize roastDate, beanName, roastNotes;



-(float)firstCrackPercentOfTotal {
    return ((float)self.firstCrack/(float)self.totalRoastTime)*100;
}

- (id)initWithCoder:(NSCoder *)decoder {
    self = [super init];
    if (!self) {
        return nil;
    }
    
    self.roastDate = [decoder decodeObjectForKey:@"roastDate"];
    self.beanName = [decoder decodeObjectForKey:@"beanName"];
    self.roastNotes = [decoder decodeObjectForKey:@"roastNotes"];
    self.firstCrack = [decoder decodeDoubleForKey:@"firstCrack"];
    self.secondCrack =  [decoder decodeDoubleForKey:@"secondCrack"];
    self.totalRoastTime = [decoder decodeDoubleForKey:@"totalRoastTime"];
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeObject:self.roastDate forKey:@"roastDate"];
    [encoder encodeObject:self.beanName forKey:@"beanName"];
    [encoder encodeObject:self.roastNotes forKey:@"roastNotes"];
    [encoder encodeDouble:self.firstCrack forKey:@"firstCrack"];
    [encoder encodeDouble:self.secondCrack forKey:@"secondCrack"];
    [encoder encodeDouble:self.totalRoastTime forKey:@"totalRoastTime"];
}




@end
