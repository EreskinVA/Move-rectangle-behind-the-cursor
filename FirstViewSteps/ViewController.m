//
//  ViewController.m
//  FirstViewSteps
//
//  Created by Vladimir Ereskin on 05.06.2019.
//  Copyright © 2018 Vladimir Ereskin. All rights reserved.
//

#import "ViewController.h"
#import "ABCView.h"
const CGFloat viewSize = 200.f;


@interface ViewController ()
@property (nonatomic,strong) ABCView *abcView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   // [self createUI];
    [self createABCView];
    
}


#pragma mark - UI
- (void) createUI
{
    
    UIView *someView = [[UIView alloc]
                        initWithFrame:CGRectMake(300,40,viewSize,viewSize)];
    someView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:someView];
    
    
    
}

- (void) createABCView {
    self.abcView = [[ABCView alloc]
                        initWithFrame:CGRectMake(0, 0, viewSize, viewSize)];
    self.abcView.center = self.view.center;
    [self.view addSubview:self.abcView];
    
    
    
//    UITapGestureRecognizer *tabRecognizer = [[UITapGestureRecognizer alloc] init];
//    tabRecognizer.delaysTouchesBegan = YES;
//    [tabRecognizer addTarget:self action: @selector(recognizerDidRecongize)];
//    [abcView addGestureRecognizer:tabRecognizer];
    
    UISwipeGestureRecognizer *swipeRecognizer =
    [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(recognizerDidRecongize:)];
    swipeRecognizer.delaysTouchesBegan = YES;
    swipeRecognizer.direction = UISwipeGestureRecognizerDirectionUp;
    [self.abcView addGestureRecognizer:swipeRecognizer];
    
   
    
    
}

#pragma mark - UIResponder

-(void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    CGPoint touchPoint = [self touchPointInView:touches];
    NSLog(@"Нажатие началось %f %f",touchPoint.x,touchPoint.y);
    self.abcView.frame = CGRectMake(touchPoint.x,
                                    touchPoint.y,
                                    self.abcView.frame.size.width,
                                    self.abcView.frame.size.height);
};

- (void) touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    CGPoint touchPoint = [self touchPointInView:touches];
    NSLog(@"Нажатие продолжается %f %f",touchPoint.x,touchPoint.y);
    self.abcView.frame = CGRectMake(touchPoint.x,
                                     touchPoint.y,
                                     self.abcView.frame.size.width,
                                     self.abcView.frame.size.height);
    [self.view layoutIfNeeded];
};
-(void) touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    CGPoint touchPoint = [self touchPointInView:touches];
    NSLog(@"Нажатие закончилось %f %f",touchPoint.x,touchPoint.y);
    
};

-(CGPoint)touchPointInView:(NSSet<UITouch *>*)touches{
    UITouch *touch = touches.anyObject;
    return [touch locationInView:self.view];
}


//-(void) recognizerDidRecongize :(UISwipeGestureRecognizer *)recognizer {
//    NSLog(@"Done");
//    [UIView animateWithDuration:0.2 animations:^{
//        self.abcView.center = CGPointMake(self.abcView.center.x, self.abcView.center.y-100);
//    }];
//}

@end
