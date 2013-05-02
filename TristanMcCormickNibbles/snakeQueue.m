//
//  snakeQueue.m
//  TristanMcCormickNibbles
//
//  Created by Tristan J. McCormick on 11/29/12.
//  Copyright (c) 2012 Tristan J. McCormick. All rights reserved.
//

#import "snakeQueue.h"

@implementation snakeQueue

@synthesize queue;

- (id)init
{
    if (self = [super init]) {
        
    }
    [self queue];
    return self;
}

- (id)queue
{
    if (!queue) queue = [[snakeList alloc] init];
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
