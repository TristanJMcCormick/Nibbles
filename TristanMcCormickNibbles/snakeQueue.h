//  As are these
//  snakeQueue.h
//  TristanMcCormickNibbles
//
//  Created by Tristan J. McCormick on 11/29/12.
//  Copyright (c) 2012 Tristan J. McCormick. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "snakeList.h"

@interface snakeQueue : NSObject {
    snakeList *queue;
}

@property (nonatomic) snakeList *queue;

- (id)init;
- (void)enqueue:(CGPoint)anObject;
- (CGPoint)dequeue;
- (void)clear;
- (int)size;
- (CGPoint)peek;
- (BOOL)isEmpty;

@end
