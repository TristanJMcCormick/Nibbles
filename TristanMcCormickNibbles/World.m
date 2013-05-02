//  World.m
//  TristanMcCormickNibbles
//
//  Created by Tristan J. McCormick on 11/25/12.
//  Copyright (c) 2012 Tristan J. McCormick. All rights reserved.
//

#import "World.h"

@implementation World

@synthesize worldGrid;
@synthesize foodLocation;
@synthesize level;

- (id) initWithWidth: (int)w height:(int)h {
    self = [super init];
    self.worldGrid = [NSMutableArray arrayWithCapacity:h];
    self.level = 1;
    
    for(int i = 0; i < h; i++) {
        [self.worldGrid addObject:[NSMutableArray arrayWithCapacity:w]];
        for(int j = 0; j < w; j++) {
            NSNumber *n = [NSNumber numberWithInt:EMPTY];
            [[[self worldGrid] objectAtIndex:i] addObject:n ];
        }
    }
    
    [self placeFood];

    return self;
}

-(void) placeFood {
    
    int x, y;
    
    while(1) {
        x = arc4random() % GRIDWIDTH - 1;
        y = arc4random() % GRIDHEIGHT - 1;
        if (x < 0 || y < 0) {
        }
        else if([[[worldGrid objectAtIndex:y] objectAtIndex:x] integerValue] == EMPTY) {
            if([self foodLocation].x != x && [self foodLocation].y != y) {
                break;
           }
        }
    }
    
    NSNumber *food = [NSNumber numberWithInt:FOOD];
    [[[self worldGrid] objectAtIndex:y] replaceObjectAtIndex:x withObject:food];
    foodLocation.x = x;
    foodLocation.y = y;
}

-(CGPoint)getCenter {
    
    CGPoint center;
    
    center.x = GRIDWIDTH / 2;
    center.y = GRIDHEIGHT / 2;
    
    return center;
}

-(void)placeSnakeAtPoint:(CGPoint)point {
    
    NSNumber *newSnakeSegment = [NSNumber numberWithInt:SNAKE];
    [[[self worldGrid] objectAtIndex:point.y] replaceObjectAtIndex:point.x withObject:newSnakeSegment];
      
}

-(void)consumeFood {
    [self clearPoint:foodLocation];
    [self placeFood];
}

-(BOOL)containsFoodAtPoint:(CGPoint)point {
    
    if([[[worldGrid objectAtIndex:point.y] objectAtIndex:point.x] integerValue] == FOOD) {
        return true;
    }
    
    return false;
    
}

-(BOOL)containsSnakeAtPoint:(CGPoint)point {
    
    if([[[worldGrid objectAtIndex:point.y] objectAtIndex:point.x] integerValue] == SNAKE) {
        return true;
    }
    
    return false;
    
}

-(BOOL)outOfBoundsAtPoint:(CGPoint)point {
    
    if(point.x < 0 || GRIDWIDTH - 1 < point.x || point.y < 0 || GRIDHEIGHT - 1 < point.y) {
        return true;
    }
    
    return false;   
}

-(void)clearPoint:(CGPoint)point {
    
    NSNumber *emptyCell = [NSNumber numberWithInt:EMPTY];
    [[[self worldGrid] objectAtIndex:point.y] replaceObjectAtIndex:point.x withObject:emptyCell];
    
}

-(void)printWorldAt:(NSString *)string {
    NSLog(@"%@", string);
    for (int i = 0; i < GRIDWIDTH - 1; i++) {
        for (int j = 0; j < GRIDHEIGHT - 1; j++) {
            if([[[[self worldGrid] objectAtIndex:j] objectAtIndex:i] integerValue] == SNAKE) {
                NSLog(@"[%i,%i] holds a snake segment", i, j);
            }
        }
    }
    NSLog(@"Done printing the world");
    NSLog(@"\n");
}


@end
