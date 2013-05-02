//
//  NibblesView.m
//  TristanMcCormickNibbles
//
//  Created by Tristan J. McCormick on 11/25/12.
//  Copyright (c) 2012 Tristan J. McCormick. All rights reserved.
//

#import "NibblesView.h"

@implementation NibblesView
@synthesize delegate;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
/*Calls upon the delegate to provide the contents of the World instance at
 a given cell location and draws the relevant rectangles
 */
- (void)drawRect:(CGRect)rect
{
    CGPoint temp;
    for (int i = 0; i < GRIDWIDTH; i++) {
        for (int j = 0; j < GRIDHEIGHT; j++) {
            int x = FIELDINSET + i * BOXSIZE;
            int y = FIELDINSET + j * BOXSIZE;
            CGRect rectangle = CGRectMake(x,y,BOXSIZE,BOXSIZE);

            temp.x = i;
            temp.y = j;
         
            int item = [delegate contentsOfNibblesView:self atPoint:temp];

            CGContextRef context = UIGraphicsGetCurrentContext();
            if(item == EMPTY) {
                [[UIColor blackColor] setFill];
            }
            else if(item == SNAKE) {
                [[UIColor greenColor] setFill];
            }
            else if(item == FOOD) {
                [[UIColor redColor] setFill];
            }
            //Just so it's easier to see the head
            else if(item == 3) {
                [[UIColor brownColor] setFill];
            }
             
            CGContextFillRect(context, rectangle);
        }
    }
   
}
                        
@end
