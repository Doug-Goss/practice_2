//
//  superCardViewController.m
//  superCard
//
//  Created by Doug Goss on 2/23/14.
//  Copyright (c) 2014 Doug Goss. All rights reserved.
//

#import "superCardViewController.h"


@interface superCardViewController ()

@end

@implementation superCardViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.cardView.suit = @"♥️";
    self.cardView.rank = 13;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
