//
//  List.h
//  StackAndQueue
//
//  Created by Eric Chown on 10/29/12.
//  Copyright (c) 2012 Eric Chown. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Element.h"

@interface List : NSObject {
    Element *head;
    Element *tail;
    int count;
}

@property (nonatomic) Element *head;
@property (nonatomic) Element *tail;
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
