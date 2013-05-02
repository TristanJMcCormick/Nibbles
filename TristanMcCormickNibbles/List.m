//
//  List.m
//  StackAndQueue
//
//  Possibly buggy, and certainly incomplete, implementation of a List class - I haven't fully tested it yet.
//  Created by Eric Chown on 10/29/12.
//  Copyright (c) 2012 Eric Chown. All rights reserved.
//

#import "List.h"

@implementation List

@synthesize head;
@synthesize tail;
@synthesize count;

- (id)init
{
    if (self = [super init]) {
        count = 0;
        self.head = NULL;
        self.tail = NULL;
    }
    return self;
}

- (void)addToHead:(CGPoint)anObject
{
    Element *temp = [[Element alloc] init];
    temp.data = anObject;
    temp.next = head;
    self.head = temp;
    if (count == 0) {
        self.tail = temp;
    }
    count++;
}

- (void)addToTail:(CGPoint)anObject
{
    Element *temp = [[Element alloc] init];
    temp.data = anObject;
    temp.next = nil;
    self.tail.next = temp;
    self.tail = temp;
    if (count == 0) {
        self.head = temp;
    }
    count++;
}

- (CGPoint)removeFromHead
{
    Element *temp = head;
    CGPoint object = temp.data;
    self.head = self.head.next;
    if (count == 1) {
        self.tail = nil;
    }
    if (count > 0) {
        count--;
    }
    return object;
}

- (CGPoint)removeFromTail
{
    Element *temp = head;
    CGPoint object = self.tail.data;
    while (temp.next.next) {
        temp = temp.next;
    }
    self.tail = temp;
    self.tail.next = nil;
    if (count == 1) {
        self.head = nil;
    }
    if (count > 0) {
        count--;
    }
    return object;
}

- (CGPoint)getHead
{
    return head.data;
}

- (CGPoint)getTail
{
    return tail.data;
}

- (void)clear
{
    self.head = nil;
    self.tail = nil;
    count = 0;
}

- (int)size
{
    return self.count;
}

@end
