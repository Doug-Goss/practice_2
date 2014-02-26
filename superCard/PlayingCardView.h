//
//  PlayingCardView.h
//  superCard
//
//  Created by Doug Goss on 2/23/14.
//  Copyright (c) 2014 Doug Goss. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlayingCardView : UIView
{
    //const CGFloat CORNER_FONT_STANDARD_HEIGHT;
   // const CGFloat CORNER_RADIUS;
}

    @property (nonatomic) NSUInteger rank;
    @property (nonatomic, strong) NSString *suit;
    @property (nonatomic) BOOL faceUp;

    
-(CGFloat)CornerScaleFactor;
-(CGFloat)CornerRadius;
-(CGFloat)CorneroffSet;


- (void)SetRank:(NSUInteger )newrank;


- (NSUInteger )Rank;


-(void)SetSuit:(NSString *)newsuit;


-(NSString *)Suit;

-(void)SetFaceUp:(BOOL )newfaceUp;



@end
