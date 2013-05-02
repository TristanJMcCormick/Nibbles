//
//  Direction.h
//  TristanMcCormickNibbles
//
//  Created by Tristan J. McCormick on 11/25/12.
//  Copyright (c) 2012 Tristan J. McCormick. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "World.h"

@interface Direction : NSObject {
    CGPoint directionPoint;
}

@property CGPoint directionPoint;

-(id)initWithX:(int)x y:(int)y;
-(CGPoint)translatePoint:(CGPoint)point;
-(BOOL)isOpposite:(Direction *) dir;
-(BOOL)isSame:(Direction *) dir;

@end
