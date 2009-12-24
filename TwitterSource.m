//
//  TwitterSource.m
//  Twitter
//
//  Created by Joshua Holt on 12/23/09.
//

#import "TwitterSource.h"
#import <QSCore/QSObject.h>


@implementation TwitterSource
- (BOOL)indexIsValidFromDate:(NSDate *)indexDate forEntry:(NSDictionary *)theEntry{
    return YES;
}

- (NSImage *) iconForEntry:(NSDictionary *)dict{
    return nil;
}


// Return a unique identifier for an object (if you haven't assigned one before)
//- (NSString *)identifierForObject:(id <QSObject>)object{
//    return nil;
//}

- (NSArray *) objectsForEntry:(NSDictionary *)theEntry{
    NSMutableArray *objects=[NSMutableArray arrayWithCapacity:1];
    QSObject *newObject;
	
	newObject=[QSObject objectWithName:@"TestObject"];
	[newObject setObject:@"" forType:TwitterType];
	[newObject setPrimaryType:TwitterType];
	[objects addObject:newObject];
  
    return objects;
    
}


// Object Handler Methods

- (void)setQuickIconForObject:(QSObject *)object{
  [object setIcon:[QSResourceManager imageNamed:@"QSTwitter2"]]; // An icon that is either already in memory or easy to load
}
- (BOOL)loadIconForObject:(QSObject *)object{
	return NO;
}
@end
