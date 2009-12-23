//
//  TwitterAction.h
//  Twitter
//
//  Created by Joshua Holt on 12/23/09.
//  Copyright Eloqua Ltd. 2009. All rights reserved.
//

#import <QSCore/QSObject.h>
#import <QSCore/QSActionProvider.h>
#import "TwitterAction.h"

#define kTwitterAction @"TwitterAction"

void TwitterNotify(NSString *message);

@interface TwitterAction : QSActionProvider
{
}
@end

