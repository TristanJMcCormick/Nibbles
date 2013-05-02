//
//  Queue.m
//  StackAndQueue
//
//  Created by Eric Chown on 10/30/12.
//  Copyright (c) 2012 Eric Chown. All rights reserved.
//

#import "Queue.h"

@implementation Queue

@synthesize queue;

- (id)init
{
    if (self = [super init]) {
        
    }
    return self;
}

- (id)queue
{
    if (!queue) queue = [[List alloc] init];
    return queue;
}

- (void)enqueue:(CGPoint)anObject
{
    [self.queue addToTail:anObject];
}
- (CGPoint)dequeue
{
    return [self.queue removeFromHead];
}
- (void)clear
{
    [self.queue clear];
}
- (int)size
{
    return self.queue.count;
}
- (CGPoint)peek
{
    return [self.queue getHead];
}

- (BOOL)isEmpty
{
    return self.queue.count == 0;
}

@end
