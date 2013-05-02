//
//  Element.h
//  Missionaries
//
//  Created by Eric Chown on 10/31/12.
//  Copyright (c) 2012 Eric Chown. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Element : NSObject {
    CGPoint data;
    Element *next;
}

@property (nonatomic) CGPoint data;
@property (nonatomic) Element *next;

@end
