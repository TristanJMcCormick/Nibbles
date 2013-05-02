//
//  Snake.m
//  TristanMcCormickNibbles
//
//  Created by Tristan J. McCormick on 11/25/12.
//  Copyright (c) 2012 Tristan J. McCormick. All rights reserved.
//

#import "Snake.h"

@implementation Snake
@synthesize snakeDirection;
@synthesize location;
@synthesize snakeSize;
@synthesize growthRate;
@synthesize world;
@synthesize snakeQueue;
@synthesize hasEaten;
@synthesize isDead;
@synthesize growthSpurtCounter;
@synthesize foodCounter;



-(id) initAtPoint:(CGPoint)point withSize:(int)size growthRate:(int)rate world:(World *)newWorld {
    
    
    self = [super init];
    
    //make the snake's queue
    self.snakeQueue = [[snakeQueue alloc] init];
    //initializes all of the instance variables
    self.location = point;
    self.growthRate = rate;
    self.world = newWorld;
    self.snakeSize = size;
    self.growthSpurtCounter = 0;
    self.foodCounter = 0;
    
    //places head of snake at given location
    [self.snakeQueue enqueue:self.location];
    [[self world] placeSnakeAtPoint:self.location];
    
    //adds appropriate number of segments to start snake with fail message if the snake is too big
    if([self location].y + size > GRIDHEIGHT) {
        NSLog(@"Sorry but you've tried to create a snake that's too big for this world!");
        exit(0);
    }
    for (int i = 0; i < self.snakeSize - 1; i++) {
        CGPoint newSegmentLocation;
        newSegmentLocation.x = [self.snakeQueue.queue getTail].x;
        newSegmentLocation.y = [self.snakeQueue.queue getTail].y + 1;
        [self.snakeQueue.queue addToTail:newSegmentLocation];
        [[self world] placeSnakeAtPoint:newSegmentLocation];
    }
    self.snakeDirection = [[Direction alloc] initWithX:0 y:-1];
    
    //This search for a food placement should take care of the issue of initing the
    //snake onto the piece of food...
    for (int i = 0; i < GRIDHEIGHT - 1; i++) {
        for (int j = 0; j < GRIDWIDTH - 1; j++) {
            if([[[self.world.worldGrid objectAtIndex:i] objectAtIndex:j] integerValue] == FOOD) {
                return self;
            }
        }
    }
    [self.world placeFood];
    return self;
}
/*Runs checks on the square that the head would go into, and kills the snake/eats the food
 if appropriate. If the snake didn't die, it moves forward into the square.
 
 */
-(void) stretch {
    CGPoint translatedHead = [[self.snakeQueue queue] getHead];
    translatedHead = [self.snakeDirection translatePoint:translatedHead];
    if(![[self world] outOfBoundsAtPoint:translatedHead] && ![[self world] containsSnakeAtPoint:translatedHead]) {
        if([[self world] containsFoodAtPoint:translatedHead] && ![[self world] containsSnakeAtPoint:translatedHead]) {
            [[self world] consumeFood];
            self.hasEaten = true;
            self.foodCounter++;
            growthSpurtCounter = growthSpurtCounter + self.growthRate;//Should allow you to eat food in rapid succession
        }
        [self.snakeQueue.queue addToHead:translatedHead];
        [[self world] placeSnakeAtPoint:translatedHead];
    }
    else {
        self.isDead = true;
        //[self.world printWorldAt:@"SNAKE DIED IN THIS STATE"];
    }
}

/*Moves all of the elements of the snake up one 
 */
-(void) shrink {
    CGPoint translatedTail = [[self.snakeQueue queue] getTail];
    [[self world] clearPoint:translatedTail];
    translatedTail = [self.snakeDirection translatePoint:translatedTail];
    [self.snakeQueue.queue removeFromTail];

}
/*Calls the stretch and shrink methods depending on whether the snake
 is alive or dead. Also 
 */
-(void) move {
    if(isDead) {
        [self shrink];
        if([[self snakeQueue] queue].count == 0) {
            exit(0);
        }
    }
    else {
        [self stretch];
        if(growthSpurtCounter == 0) {
            hasEaten = FALSE;
        }
        if(![self hasEaten]) {
            [self shrink];
            return;
        }
        growthSpurtCounter--;
        
    }
    
}


@end
