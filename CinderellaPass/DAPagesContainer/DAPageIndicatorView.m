//
//  DAPageIndicatorView.m
//  DAPagesContainerScrollView
//
//  Created by Daria Kopaliani on 5/29/13.
//  Copyright (c) 2013 Daria Kopaliani. All rights reserved.
//

#import "DAPageIndicatorView.h"


@implementation DAPageIndicatorView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.opaque = NO;
        _color = [UIColor blackColor];
    }
    return self;
}

#pragma mark - Public

- (void)setColor:(UIColor *)color
{
    if (![_color isEqual:color]) {
        _color = color;
        [self setNeedsDisplay];
        
        
    }
}

#pragma mark - Private

- (void)drawRect:(CGRect)rect
{
    NSLog(@"width %f height %f",rect.size.width,rect.size.height);
    NSLog(@"pos x %f pos y %f",rect.origin.x,rect.origin.y);
    
//    CGContextRef context = UIGraphicsGetCurrentContext();
    
//    UIImage *img = [UIImage imageNamed:@"top.png"];
//    
//    [img drawInRect:rect];
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    

    CGContextBeginPath(context);
    CGContextMoveToPoint   (context, CGRectGetMinX(rect), CGRectGetMinY(rect));
    CGContextAddLineToPoint(context, CGRectGetMidX(rect), CGRectGetMaxY(rect));
    CGContextAddLineToPoint(context, CGRectGetMaxX(rect), CGRectGetMinY(rect));
    CGContextClosePath(context);
    
    CGContextSetFillColorWithColor(context, self.color.CGColor);
    CGContextFillPath(context);
    
    
    
}


@end