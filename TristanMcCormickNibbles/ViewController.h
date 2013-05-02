//
//  ViewController.h
//  TristanMcCormickNibbles
//
//  Created by Tristan J. McCormick on 11/25/12.
//  Copyright (c) 2012 Tristan J. McCormick. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NibblesConstants.h"
#import "World.h"
#import "NibblesView.h"
#import "Direction.h"
#import "Snake.h"


@interface ViewController : UIViewController <NibblesViewDelegate> {
    World *World;
    Snake *Snake;
    Direction *up,*down,*left,*right;
    __weak IBOutlet NibblesView *nibblesDisplay;
    NSTimer *timer;
    BOOL gameStatePaused;
}

-(IBAction)leftPressed:(UIButton *)left;
-(IBAction)rightPressed:(UIButton *)right;
-(IBAction)downPressed:(UIButton *)down;
-(IBAction)upPressed:(UIButton *)up;
-(IBAction)pausePressed:(UIButton *)pause;
-(void)updateWorld;

- (int)contentsOfNibblesView:(NibblesView *) requestor atPoint:(CGPoint)point;

@property (nonatomic) __weak IBOutlet NibblesView *nibblesDisplay;
@property (nonatomic) Direction *up;
@property (nonatomic) Direction *down;
@property (nonatomic) Direction *left;
@property (nonatomic) Direction *right;
@property (nonatomic) World *World;
@property (nonatomic) Snake *Snake;
@property (nonatomic) NSTimer *timer;
@property (nonatomic) BOOL gameStatePaused;


@end
