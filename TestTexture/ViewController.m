//
//  ViewController.m
//  TestTexture
//
//  Created by junbo.rao on 2022/3/16.
//

#import "ViewController.h"
#import "AnimalTableController.h"
#import "OrginAnimalTableController.h"
#import "RainforestCardInfo.h"
#import "DoraemonManager.h"
@interface ViewController ()
@property (nonatomic, strong) UIButton *btn1;
@property (nonatomic, strong) UIButton *btn2;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.btn1];
    [self.view addSubview:self.btn2];
    
}

- (UIButton *)btn1 {
    if (!_btn1) {
        _btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
        _btn1.frame = CGRectMake(10, 100, 200, 50);
        _btn1.backgroundColor = [UIColor redColor];
        [_btn1 setTitle:@"原始写法列表" forState:UIControlStateNormal];
        [_btn1 addTarget:self action:@selector(btnClick1) forControlEvents:UIControlEventTouchUpInside];
    }
    return  _btn1;
}
- (UIButton *)btn2 {
    if (!_btn2) {
        _btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
        _btn2.frame = CGRectMake(10, 100 + 80, 200, 50);
        _btn2.backgroundColor = [UIColor redColor];
        [_btn2 setTitle:@"AsyncDisplayKit写法列表" forState:UIControlStateNormal];
        [_btn2 addTarget:self action:@selector(btnClick2) forControlEvents:UIControlEventTouchUpInside];
    }
    return _btn2;
}

- (void)btnClick1 {
    OrginAnimalTableController *table = [[OrginAnimalTableController alloc]initWithAnimals:[RainforestCardInfo allAnimals]];
    [self.navigationController pushViewController:table animated:YES];
}

- (void)btnClick2 {
    AnimalTableController *table = [[AnimalTableController alloc]initWithAnimals:[RainforestCardInfo allAnimals]];
    [self.navigationController pushViewController:table animated:YES];

}

@end
