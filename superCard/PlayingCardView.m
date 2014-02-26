//
//  PlayingCardView.m
//  superCard
//
//  Created by Doug Goss on 2/23/14.
//  Copyright (c) 2014 Doug Goss. All rights reserved.
//

#import "PlayingCardView.h"

@implementation PlayingCardView

#define CORNER_FONT_STANDARD_HEIGHT 180.0
#define CORNER_RADIUS 12.0

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    UIBezierPath *roundedRect = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:[self cornerRadius]];
    
    [roundedRect addClip];
    [[UIColor whiteColor] setFill];
    UIRectFill(self.bounds);
    [[UIColor blackColor] setStroke];
    [roundedRect stroke];
    [self drawCorners];
    
    
}

- (void)Setup
{
    self.backgroundColor = nil;
    self.opaque = NO;
    self.contentMode = UIViewContentModeRedraw;
}

-(void)drawCorners
{
    NSMutableParagraphStyle *style =[[NSMutableParagraphStyle alloc] init];
    style.alignment = NSTextAlignmentCenter;
    UIFont *cornerFont = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    (cornerFont = [cornerFont fontWithSize:cornerFont.pointSize * [self cornerScaleFactor]]);
    NSString *cornerString = [NSString stringWithFormat:@"%@\n%@",[self rankAsString], self.suit];
    NSAttributedString *cornerText = [[NSAttributedString alloc] initWithString:cornerString];
    CGRect textBounds;
    textBounds.size = [cornerText size];
    textBounds.origin = CGPointMake([self CorneroffSet], [self CorneroffSet]);
    [cornerText drawInRect:textBounds];
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextTranslateCTM(ctx, self.bounds.size.width, self.bounds.size.height);
    CGContextRotateCTM(ctx, M_PI);
    [cornerText drawInRect:textBounds];
    
    
}

- (NSString *)rankAsString {
    return @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"][self.rank];
}

- (void)SetRank:(NSUInteger )newrank
{
    self.rank = newrank;
    [self setNeedsDisplay];
}




-(void)SetSuit:(NSString *)newsuit
{
    self.suit = newsuit;
    [self setNeedsDisplay];
}



-(void)SetFaceUp:(BOOL )newfaceUp
{
    self.faceUp = newfaceUp;
    [self setNeedsDisplay];
}

- (CGFloat)cornerScaleFactor
{
    return self.bounds.size.height / CORNER_FONT_STANDARD_HEIGHT;

}
- (CGFloat)cornerRadius {
    return CORNER_RADIUS * [self cornerScaleFactor];
}

- (CGFloat)CorneroffSet
{
    return [self cornerRadius] / 3.0 ;
}

-(void)awakeFromNib
{
    [self Setup];
}


@end
