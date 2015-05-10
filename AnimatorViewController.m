//
//  AnimatorViewController.m
//  dynamicAnimator
//
//  Created by Bjarte Sjursen on 09.05.15.
//  Copyright (c) 2015 Bjarte Sjursen. All rights reserved.
//

#import "AnimatorViewController.h"

@interface AnimatorViewController ()
@property(strong,nonatomic) UIDynamicAnimator* animator;
@property(strong, nonatomic) UICollisionBehavior* collider;
@property(strong, nonatomic) UIGravityBehavior* gravity;
@property(strong, nonatomic) UIView* dropView;
@end

@implementation AnimatorViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    CGRect frame = CGRectMake(self.view.frame.size.width/2, 0, 70, 70);
    
    self.dropView = [[UIView alloc] initWithFrame:frame];
    self.dropView.backgroundColor = [UIColor colorWithRed:0.0000 green:0.6863 blue:0.6941 alpha:1.0];
    
    [self.view addSubview:self.dropView];
    [self.collider addItem:self.dropView];
    [self.gravity addItem:self.dropView];
    
    UIPanGestureRecognizer* dropViewGesture = [[UIPanGestureRecognizer alloc]
                                               initWithTarget:self action:@selector(moveDropView:)];
    
    [self.dropView addGestureRecognizer:dropViewGesture];
    
}

-(void) moveDropView:(UIPanGestureRecognizer*) dropViewGesture{
    
    self.dropView.center = [dropViewGesture locationInView:self.view];

    if(dropViewGesture.state == UIGestureRecognizerStateEnded){
     
        [self.animator updateItemUsingCurrentState:self.dropView];
        
    }
}

-(UIDynamicAnimator*) animator{
    
    if(!_animator){
        
        _animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
        
    }
    
    return _animator;
    
}

-(UIGravityBehavior*)gravity{
    
    if(!_gravity){
        
        _gravity = [[UIGravityBehavior alloc] init];
        _gravity.magnitude = 1.0;
        [self.animator addBehavior:_gravity];
        
    }
    
    return _gravity;
    
}

-(UICollisionBehavior*) collider{
    
    if(!_collider){
        
        _collider = [[UICollisionBehavior alloc] init];
        _collider.translatesReferenceBoundsIntoBoundary = YES;
        [self.animator addBehavior:_collider];

        
    }
    
    return _collider;
    
}

@end
