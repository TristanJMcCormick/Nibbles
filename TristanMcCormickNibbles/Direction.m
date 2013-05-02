//
//  Direction.m
//  TristanMcCormickNibbles
//
//  Created by Tristan J. McCormick on 11/25/12.
//  Copyright (c) 2012 Tristan J. McCormick. All rights reserved.
//

#import "Direction.h"
#import "NibblesConstants.h"

@implementation Direction
@synthesize directionPoint;

-(id)initWithX:(int)x y:(int)y {
    self = [super init];
    
    directionPoint.x = x;
    directionPoint.y = y;
    
    return self;
}

-(CGPoint)translatePoint:(CGPoint)point {
    point.x = point.x + directionPoint.x;
    point.y = point.y + directionPoint.y;
    
    return point;
}

-(BOOL)isOpposite:(Direction *) dir {
    
    if([self directionPoint].x == 1 && [dir directionPoint].x == -1) {
        return true;
    }
    if([self directionPoint].x == -1 && [dir directionPoint].x == 1) {
        return true;
    }
    if([self directionPoint].y == 1 && [dir directionPoint].y == -1) {
        return true;
    }
    if([self directionPoint].y == -1 && [dir directionPoint].y == 1) {
        return true;
    }
    return false;}

-(BOOL)isSame:(Direction *) dir {
    
    if([self directionPoint].x == 1 && [dir directionPoint].x == 1) {
        return true;
    }
    if([self directionPoint].x == -1 && [dir directionPoint].x == -1) {
        return true;
    }
    if([self directionPoint].y == 1 && [dir directionPoint].y == 1) {
        return true;
    }
    if([self directionPoint].y == -1 && [dir directionPoint].y == -1) {
        return true;
    }
    return false;
}


@end
