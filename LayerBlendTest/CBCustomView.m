//
//  CBCustomView.m
//  LayerBlendTest
//
//  Created by ly on 14-1-26.
//  Copyright (c) 2014年 ly. All rights reserved.
//

#import "CBCustomView.h"

@implementation CBCustomView
{
    CGFloat fontSize;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup
{
    // Text
    fontSize = 13.0;
    UIFont *font = [UIFont systemFontOfSize:fontSize];
    self.text = [[NSAttributedString alloc] initWithString:@"I'm a custom view :)" attributes:@{NSFontAttributeName:font}];
    
    // Image
    self.img1 = [UIImage imageNamed:@"img1"];
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextScaleCTM(context, 1, -1);
    
    // Text
    CGContextSetTextPosition(context, 0, -fontSize);
    CTLineRef line = CTLineCreateWithAttributedString((__bridge_retained CFAttributedStringRef)self.text);
    CTLineDraw(line, context);
    
    // Image
    CGFloat w = CGRectGetWidth(self.frame);
    CGContextDrawImage(context, CGRectMake(w-18.0, -18.0, 18.0, 18.0), [[self img1] CGImage]);
}

@end
