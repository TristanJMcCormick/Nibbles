//  The SnakeElement files are adapted with permission from
//  code from one of my professor's projects.
//
//
//  snakeElement.h
//  TristanMcCormickNibbles
//
//  Created by Tristan J. McCormick on 11/29/12.
//  Copyright (c) 2012 Tristan J. McCormick. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface snakeElement : NSObject {
    CGPoint data;
    snakeElement *next;
}

@property (nonatomic) CGPoint data;
@property (nonatomic) snakeElement *next;

@end
