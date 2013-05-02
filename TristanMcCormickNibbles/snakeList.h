//  These SnakeList files are also adapted from my Professor's project
//
//
//  snakeList.h
//  TristanMcCormickNibbles
//
//  Created by Tristan J. McCormick on 11/29/12.
//  Copyright (c) 2012 Tristan J. McCormick. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "snakeElement.h"

@interface snakeList : NSObject {
    snakeElement *head;
    snakeElement *tail;
    int count;
}

@property (nonatomic) snakeElement *head;
@property (nonatomic) snakeElement *tail;
@property (nonatomic) int count;

- (void)addToHead:(CGPoint)anObject;
- (void)addToTail:(CGPoint)anObject;
- (CGPoint)removeFromHead;
- (CGPoint)removeFromTail;
- (void)clear;
- (int)size;
- (CGPoint)getHead;
- (CGPoint)getTail;

@end
