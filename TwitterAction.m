//
//  TwitterAction.m
//  Twitter
//
//  Created by Joshua Holt on 12/23/09.

#import "TwitterAction.h"
#import "JSON.h"
#import "ASI.h"
#import <QSCore/QSTextProxy.h>
#import <QSCore/QSNotifyMediator.h>

void TwitterNotify(NSString *message)
{
  QSShowNotifierWithAttributes(
        [NSDictionary dictionaryWithObjectsAndKeys:@"Quick Silver Twitter", 
         QSNotifierTitle, message, QSNotifierText,
         [QSResourceManager imageNamed:@"QSTwitter"],QSNotifierIcon,nil]);
}

@implementation TwitterAction

- (QSObject *)performActionOnObject:(QSObject *)dObject{
  
  // The Update message sent from Quicksilver's text input
  NSString *updateMessage;
  
  updateMessage = [NSString stringWithFormat:@"%@",[dObject stringValue]];
  
  // The update URL
  NSURL *updateURL = [NSURL URLWithString:
        [NSString stringWithFormat:@"http://twitter.com/statuses/update.json"]];
  
  // The update request
  ASIFormDataRequest *updateRequest = [ASIFormDataRequest requestWithURL:updateURL];
  [updateRequest setUsername:@"yourusername"];
  [updateRequest setPassword:@"yourpassword"];
  [updateRequest setPostValue:[NSString stringWithFormat:@"%@", [dObject stringValue]] forKey:@"status"];
  [updateRequest start];
  
  // The response error (if any)
  NSError *responseError = [updateRequest error];
  
  if (!responseError) {
    // The response string
    NSString *response = [updateRequest responseString];
    TwitterNotify(response);
  } else {
    TwitterNotify([responseError localizedDescription]);
  }

  
  return nil;
}
@end
