//
//  Model.m
//  dynamicAnimator
//
//  Created by Bjarte Sjursen on 11.05.15.
//  Copyright (c) 2015 Bjarte Sjursen. All rights reserved.
//

#import "Model.h"

@interface Model()


@property (nonatomic) NSString* name;
@property (nonatomic) NSArray* family;


@end

@implementation Model

-(NSString*) name{
    
    if(!_name){
        
        _name = [[NSString alloc] initWithFormat:@"Robots"];
        
    }
    
    return _name;
    
}

-(NSArray*) family{
    
    if(!_family){
        
        _family = @[@"Robot1", @"Robot2", @"Robot3", @"Robot4"];
        
    }
    
    return _family;
    
}



@end
