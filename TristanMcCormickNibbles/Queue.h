//
//  Queue.h
//  StackAndQueue
//
//  Created by Eric Chown on 10/30/12.
//  Copyright (c) 2012 Eric Chown. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "List.h"

@interface Queue : NSObject {
    List *queue;
}

@property (nonatomic) List *queue;

- (id)init;
- (void)enqueue:(CGPoint)anObject;
- (CGPoint)dequeue;
- (void)clear;
- (int)size;
- (CGPoint)peek;
- (BOOL)isEmpty;

@end
