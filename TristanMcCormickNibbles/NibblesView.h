//
//  NibblesView.h
//  TristanMcCormickNibbles
//
//  Created by Tristan J. McCormick on 11/25/12.
//  Copyright (c) 2012 Tristan J. McCormick. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NibblesConstants.h"

@class NibblesView;

@protocol NibblesViewDelegate
- (int)contentsOfNibblesView:(NibblesView *)requestor atPoint:(CGPoint)point;
@end

@interface NibblesView : UIView {
    id delegate;
}

@property (nonatomic) id delegate;

#define FIELDINSET 1
#define GRIDWIDTH 50
#define GRIDHEIGHT 50
#define BOXSIZE 600 / GRIDWIDTH

@end
