//
//  ViewController.m
//  TestAutoresizing
//
//  Created by Alexander on 13.03.14.
//  Copyright (c) 2014 Alexander. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{}
@property (nonatomic, weak) IBOutlet UIView *resizingView;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

- (void)runInfiniteAnim
{
    
    [UIView animateWithDuration:1.0 animations:^{
        CGRect frame = self.resizingView.frame;
        frame.size.width -= 100;
        self.resizingView.frame = frame;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:1.0 animations:^{
            CGRect frame = self.resizingView.frame;
            frame.size.height -= 100;
            self.resizingView.frame = frame;
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:1.0 animations:^{
                CGRect frame = self.resizingView.frame;
                frame.size.width += 100;
                frame.size.height += 100;
                self.resizingView.frame = frame;
            } completion:^(BOOL finished) {
                [self runInfiniteAnim];
            }];
        }];
    }];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self runInfiniteAnim];
}


@end
