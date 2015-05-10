//
//  Model.m
//  dynamicAnimator
//
//  Created by Bjarte Sjursen on 11.05.15.
//  Copyright (c) 2015 Bjarte Sjursen. All rights reserved.
//

#import "Model.h"

@interface Model()


@property (nonatomic) NSString* myName;


@end

@implementation Model

-(NSString*) myName{
    
    if(!_myName){
        
        _myName = [[NSString alloc] initWithFormat:@"Bjarte Sjursen"];
        
    }
    
    return _myName;
    
}

@end
