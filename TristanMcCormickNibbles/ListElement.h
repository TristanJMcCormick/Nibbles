//
//  ListElement.h
//  StackAndQueue
//
//  Created by Eric Chown on 10/29/12.
//  Copyright (c) 2012 Eric Chown. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ListElement : NSObject {
    CGPoint data;
    ListElement *next;
}

@property (nonatomic) ListElement *next;
@property (nonatomic) CGPoint data;

@end
