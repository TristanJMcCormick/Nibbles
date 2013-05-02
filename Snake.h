//
//  Snake.h
//  TristanMcCormickNibbles
//
//  Created by Tristan J. McCormick on 11/25/12.
//  Copyright (c) 2012 Tristan J. McCormick. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NibblesConstants.h"
#import "World.h"
#import "Direction.h"
#import "snakeQueue.h"

@interface Snake : NSObject {
    snakeQueue *snakeQueue;
    CGPoint location;
    int snakeSize;
    int growthRate;
    World *world;
    Direction *snakeDirection;
    BOOL hasEaten;
    BOOL isDead;
    int growthSpurtCounter;
    int foodCounter;
}

@property (nonatomic) Direction *snakeDirection;
@property (nonatomic) CGPoint location;
@property (nonatomic) int snakeSize;
@property (nonatomic) int growthRate;
@property (nonatomic) World *world;
@property (nonatomic) snakeQueue *snakeQueue;
@property (nonatomic) BOOL hasEaten;
@property (nonatomic) BOOL isDead;
@property (nonatomic) int growthSpurtCounter;
@property (nonatomic) int foodCounter;


-(id) initAtPoint:(CGPoint)point withSize:(int)size growthRate:(int)rate world:(World *)newWorld;
-(void)stretch;
-(void)shrink;
-(void) move;


@end
