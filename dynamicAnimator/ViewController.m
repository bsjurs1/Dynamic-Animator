//
//  ViewController.m
//  dynamicAnimator
//
//  Created by Bjarte Sjursen on 08.05.15.
//  Copyright (c) 2015 Bjarte Sjursen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *gameView;
@property(strong, nonatomic) UIDynamicAnimator* animator;
@property(nonatomic) UIGravityBehavior* gravity;
@property(strong, nonatomic) UICollisionBehavior* collider;
@end

@implementation ViewController

//Static used for a private variable shared by the class
static const CGSize DROP_SIZE = {40,40};

-(UIDynamicAnimator*) animator{
    
    if(!_animator){
        
        _animator = [[UIDynamicAnimator alloc] initWithReferenceView:_gameView];
        
    }
    
    return _animator;
    
}

-(UIGravityBehavior*) gravity{
    
    if(!_gravity){
        
        _gravity = [[UIGravityBehavior alloc] init];
        _gravity.magnitude = 0.9;
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

- (IBAction)tap:(UITapGestureRecognizer *)sender {
    
    [self drop];
    
}

-(void) drop{
    
    CGRect frame;
    frame.origin = CGPointZero;
    frame.size = DROP_SIZE;
    
    //Make origin of the box position randomly accross the screen
    int x = ((arc4random()%(int)self.gameView.bounds.size.width)/DROP_SIZE.width);
    frame.origin.x = x*DROP_SIZE.width;
    
    UIView* dropView = [[UIView alloc] initWithFrame:frame];
    dropView.backgroundColor = [self randomColor];
    
    [self.gameView addSubview:dropView];
    [self.gravity addItem:dropView];
    [self.collider addItem:dropView];
    
}

-(UIColor*) randomColor{
    
    switch (arc4random()%5) {
        case 0:
            return [UIColor greenColor];
            break;
        case 1:
            return  [UIColor blueColor];
            break;
        case 2:
            return [UIColor orangeColor];
            break;
        case 3:
            return [UIColor redColor];
            break;
        case 4:
            return [UIColor purpleColor];
            break;
        default:
            return [UIColor blackColor];
            break;
    }
    
}

@end
