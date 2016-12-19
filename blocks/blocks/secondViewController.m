//
//  secondViewController.m
//  blocks
//
//  Created by 方超 on 16/8/21.
//  Copyright © 2016年 方超. All rights reserved.
//

#import "secondViewController.h"

@interface secondViewController ()

@property(nonatomic,strong)void(^selfblock)();
@property(nonatomic,copy)NSString *  name;


@end

@implementation secondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.name=@"小明";
    __weak typeof(self) weakself = self;
    void(^block)()=^{
//        NSLog(@"%@",weakself.name);
        
        __strong typeof(weakself) strongself = weakself;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            NSLog(@"延时操作的block%@",strongself.name);
        });
        
    };
    self.selfblock=block;

}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self dismissViewControllerAnimated:YES completion:nil];
    self.selfblock();

}
-(void)dealloc{
    NSLog(@"销毁了");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
