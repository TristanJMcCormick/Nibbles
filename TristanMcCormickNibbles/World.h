//
//  World.h
//  TristanMcCormickNibbles
//
//  Created by Tristan J. McCormick on 11/25/12.
//  Copyright (c) 2012 Tristan J. McCormick. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NibblesConstants.h"
#import "NibblesView.h"

@interface World : NSObject {
    NSMutableArray *worldGrid;
    CGPoint foodLocation;
    int level;
}

@property (strong, nonatomic) NSMutableArray *worldGrid;
@property (nonatomic) CGPoint foodLocation;
@property (nonatomic) int level;

//For the ViewController to communicate with the World
- (id) initWithWidth: (int)w height:(int)h;
-(void) placeFood;
-(CGPoint)getCenter;

//For the Snake to communicate with the World
-(void)placeSnakeAtPoint:(CGPoint)point;
-(void)consumeFood;
-(BOOL)containsFoodAtPoint:(CGPoint)point;
-(BOOL)containsSnakeAtPoint:(CGPoint)point;
-(BOOL)outOfBoundsAtPoint:(CGPoint)point;
-(void)clearPoint:(CGPoint)point;
-(void)printWorldAt:(NSString *)string;

@end
