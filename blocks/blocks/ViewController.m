//
//  ViewController.m
//  blocks
//  Created by 方超 on 16/8/21.
//  Copyright © 2016年 方超. All rights reserved.
//

#import "ViewController.h"
#import "secondViewController.h"

@interface ViewController ()
@property(nonatomic,strong)void(^selfblock)();
@property(nonatomic,copy)NSString * name;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    假如block中引用了外部变量的话那block就放在堆区 如果没有引用就放在全局区
    self.name=@"会飞的哈根达斯";
    __weak typeof(self) weakself = self;
    void(^block)()=^{
//        NSLog(@"%@",weakself.name);
        
        __strong typeof(weakself) strongself = weakself;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//            NSLog(@"延时操作的block%@",weakself.name);
        });
        
    };
//    block();
    self.selfblock=block;
//    self.selfblock();
//    NSLog(@"%@",self.selfblock);
    
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    secondViewController * second=[[secondViewController alloc]init];
    [self presentViewController:second animated:YES completion:nil];
//    self.selfblock();
}

-(void)dealloc{


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
