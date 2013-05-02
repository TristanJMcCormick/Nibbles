//
//  ViewController.m
//  TristanMcCormickNibbles
//
//  Created by Tristan J. McCormick on 11/25/12.
//  Copyright (c) 2012 Tristan J. McCormick. All rights reserved.
//

#import "ViewController.h"


@implementation ViewController
@synthesize nibblesDisplay;
@synthesize up;
@synthesize down;
@synthesize left;
@synthesize right;
@synthesize World;
@synthesize Snake;
@synthesize timer;
@synthesize gameStatePaused;
/*Pauses an unpaused game and unpauses a paused game
 */
-(IBAction)pausePressed:(UIButton *)pause {
    if(!gameStatePaused) {
        gameStatePaused = TRUE;
    }
    else
        gameStatePaused = FALSE;
}
/*Turns the snake left if it isn't dead or going right and the game is unpaused
 */
-(IBAction)leftPressed:(UIButton *)left {
    if(!gameStatePaused && ![self.Snake isDead]) {
        if(!self.left) {
            self.left = [[Direction alloc] initWithX:-1 y:0];
        }
        
        if(!self.Snake.snakeDirection) {
            self.Snake.snakeDirection = [[Direction alloc] initWithX:.1 y:0];
        }
        else if([self.Snake.snakeDirection isOpposite:[self left]]) {
            NSLog(@"You can't go in the opposite direction\n");
        }
        else if([self.Snake.snakeDirection isSame:[self left]]) {
            NSLog(@"You're already going in that direction\n");
        }
        else if(![self.Snake.snakeDirection isOpposite:[self left]]) {
            self.Snake.snakeDirection = [self left];
            //NSLog(@"To the left, to the left!");
        }
        else
            NSLog(@"Something is amiss! (left)");
    }
}
//Turns the snake right if it's not dead or going left and the game is unpaused
-(IBAction)rightPressed:(UIButton *)right {
    if(!gameStatePaused && ![self.Snake isDead]) {
        if(!self.right) {
            self.right = [[Direction alloc] initWithX:1 y:0];
        }
        
        if(!self.Snake.snakeDirection) {
            self.Snake.snakeDirection = [[Direction alloc] initWithX:1 y:0];
        }
        else if([self.Snake.snakeDirection isOpposite:[self right]]) {
            NSLog(@"You can't go in the opposite direction\n");
        }
        else if([self.Snake.snakeDirection isSame:[self right]]) {
            NSLog(@"You're already going in that direction\n");
        }
        else if(![self.Snake.snakeDirection isOpposite:[self right]]) {
            self.Snake.snakeDirection = [self right];
            //NSLog(@"To the right, to the right!");
        }
        else
            NSLog(@"Something is amiss! (right)");
    }
}
//Turns the snake down if it isn't dead or going up and the game is unpaused
-(IBAction)downPressed:(UIButton *)down {
    if (!gameStatePaused && ![self.Snake isDead]) {
        if(!self.down) {
            self.down = [[Direction alloc] initWithX:0 y:1];
        }
        if(!self.Snake.snakeDirection) {
            self.Snake.snakeDirection = [[Direction alloc] initWithX:0 y:1];
        }
        else if([self.Snake.snakeDirection isOpposite:[self down]]) {
            NSLog(@"You can't go in the opposite direction\n");
        }
        else if([self.Snake.snakeDirection isSame:[self down]]) {
            NSLog(@"You're already going in that direction\n");
        }
        else if(![self.Snake.snakeDirection isOpposite:[self down]]) {
            self.Snake.snakeDirection = [self down];
            //NSLog(@"Get lowwww!");
        }
        else
            NSLog(@"Something is amiss! (down)");
        
    }
}
//Turns the snake up if it isn't dead or going down and the game is unpaused
-(IBAction)upPressed:(UIButton *)up {
    if (!gameStatePaused && ![self.Snake isDead]) {
        if(!self.up) {
            self.up = [[Direction alloc] initWithX:0 y:-1];
        }
        if(!self.Snake.snakeDirection) {
            self.Snake.snakeDirection = [[Direction alloc] initWithX:0 y:-1];
        }
        else if([self.Snake.snakeDirection isOpposite:[self up]]) {
            NSLog(@"You can't go in the opposite direction\n");
        }
        else if([self.Snake.snakeDirection isSame:[self up]]) {
            NSLog(@"You're already going in that direction\n");
        }
        else if(![self.Snake.snakeDirection isOpposite:[self up]]) {
            self.Snake.snakeDirection = [self up];
            //NSLog(@"and I will raise you up! On eagles' wings");
        }
        else
            NSLog(@"Something is amiss! (up)");
    }
}
/*Calls setNeedsDisplay which calls drawRect in the NibblesView instance
 which in turn asks its delegate (this class, the VC) for the World's current
 state via the contentsOfNibblesView protocol. Note that if the snake is dead, 
 the timer is set to .05 for the death sequence, and that the snake speeds up
 as it eats food (though the timer can only go down to .01)
 */
-(void)updateWorld {

    if(self.Snake.isDead) {
        [self.timer invalidate];
        self.timer = [NSTimer scheduledTimerWithTimeInterval:.05 target:self selector:@selector(updateWorld) userInfo:nil repeats:YES];
    }
    if([self.Snake foodCounter] > 1) {
        [self.timer invalidate];
        if([self.Snake foodCounter])
        self.timer = [NSTimer scheduledTimerWithTimeInterval:(.25 - (.03*[self.Snake foodCounter])) target:self selector:@selector(updateWorld) userInfo:nil repeats:YES];
    }
    if(!gameStatePaused) {
        [self.Snake move];
        [[self nibblesDisplay] setNeedsDisplay];

    }
}
/*Creates the instances of the relevant creatures and the world and sets up
 the timer and runLoop.
 */
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.nibblesDisplay.delegate = self;
    [[self nibblesDisplay] setNeedsDisplay];
    self.gameStatePaused = FALSE;
    //Note that because the snake takes the instance of the world as a paramater
    //the world must exist before the snake. However, if it does and we want to
    //create the world with some food in it then there is a SnakeSize/Gridsize
    //chance of spawning the snake on the food, erasing it, rendering the game
    //unplayable. Perhaps never place food in the central column?
    self.World = [[World alloc] initWithWidth:GRIDWIDTH height:GRIDHEIGHT];
    
    [[self nibblesDisplay] setNeedsDisplay];
    
    self.Snake = [[Snake alloc] initAtPoint:[self.World getCenter] withSize:5 growthRate:15 world:self.World];

    
    [[self nibblesDisplay] setNeedsDisplay];
    
        timer = [NSTimer scheduledTimerWithTimeInterval:.25 target:self selector:@selector(updateWorld) userInfo:nil repeats:YES];
        
        NSRunLoop *runLoop;
        [runLoop addTimer:timer forMode:NSRunLoopCommonModes];
        [runLoop run];
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

- (int)contentsOfNibblesView:(NibblesView *) requestor atPoint:(CGPoint)point {
    
    if(point.x == [self.Snake.snakeQueue.queue getHead].x && point.y == [self.Snake.snakeQueue.queue getHead].y) {
        return 3;
    }
    NSNumber *temp = [[[[self World] worldGrid] objectAtIndex:point.y] objectAtIndex:point.x];
    int value = [temp intValue];
    return value;
}
@end
