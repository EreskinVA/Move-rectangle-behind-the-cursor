//
//  ABCView.m
//  FirstViewSteps
//
//  Created by Aidar Valeev on 24/05/2019.
//  Copyright © 2019 Aidar Valeev. All rights reserved.
//

#import "ABCView.h"

@implementation ABCView

double coordinateFirstX;
double coordinateFirstY;
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self){
        self.backgroundColor = [UIColor redColor];
    }
    return self;
}



#pragma mark - UIRecponder

-(void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    CGPoint touchPoint = [self touchPointInView:touches];
    coordinateFirstX = touchPoint.x;
    coordinateFirstY = touchPoint.y;
};

- (void) touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    CGPoint touchPoint = [self touchPointInView:touches];
    NSLog(@"Нажатие продолжается %f %f",touchPoint.x,touchPoint.y);
    self.frame = CGRectMake(self.frame.origin.x + (touchPoint.x - coordinateFirstX),
                            self.frame.origin.y + (touchPoint.y - coordinateFirstY),
                            self.frame.size.width,
                            self.frame.size.height);
};
-(void) touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    CGPoint touchPoint = [self touchPointInView:touches];
    NSLog(@"Нажатие закончилось %f %f",touchPoint.x,touchPoint.y);
    
};

-(CGPoint)touchPointInView:(NSSet<UITouch *>*)touches{
    UITouch *touch = touches.anyObject;
    return [touch locationInView:self];
}

@end
