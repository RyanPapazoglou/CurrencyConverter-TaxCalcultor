//
//  MyTabBarController.m
//  CurrencyConverter
//
//  Created by Ryan Papazoglou on 7/11/14.
//  Copyright (c) 2014 Ryan Papazoglou. All rights reserved.
//

#import "MyTabBarController.h"
#import "RPViewController.h"
#import "CurrencyViewController.h"

@interface MyTabBarController ()

@end

@implementation MyTabBarController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.delegate = self;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController{
    
    if(self.selectedIndex == 0){
        
        RPViewController* firstView = (RPViewController*) self.selectedViewController;
        CurrencyViewController* secondView = (CurrencyViewController*) viewController;
        
        secondView.itemViewTwo = firstView.itemViewOne;
        
    }
    return YES;
}
@end
