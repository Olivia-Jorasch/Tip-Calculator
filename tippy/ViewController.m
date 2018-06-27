//
//  ViewController.m
//  tippy
//
//  Created by Olivia Jorasch on 6/26/18.
//  Copyright © 2018 FBU. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *billField;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;
@property (weak, nonatomic) IBOutlet UIView *topView;
@property (weak, nonatomic) IBOutlet UILabel *tipText;
@property (weak, nonatomic) IBOutlet UILabel *totalText;
@property double tip;
@property double total;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidAppear:(BOOL)animated {
    if (self.tip) {
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        double peopleNumber = [defaults doubleForKey:@"peopleNumber"];
        double perPersonTip = self.tip/peopleNumber;
        double perPersonTotal = self.total/peopleNumber;
        self.tipLabel.text = [NSString stringWithFormat:@"$%.2f", perPersonTip];
        self.totalLabel.text = [NSString stringWithFormat:@"$%.2f", perPersonTotal];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onTap:(id)sender {
    [self.view endEditing:YES];
}

- (IBAction)onEdit:(id)sender {
    double bill = [self.billField.text doubleValue];
    NSArray *percentages = @[@(0.15), @(0.2), @(0.25)];
    double tipPercentage = [percentages[self.tipControl.selectedSegmentIndex] doubleValue];
    self.tip = tipPercentage * bill;
    self.total = bill + self.tip;
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    double peopleNumber = [defaults doubleForKey:@"peopleNumber"];
    double perPersonTip = self.tip/peopleNumber;
    double perPersonTotal = self.total/peopleNumber;
    self.tipLabel.text = [NSString stringWithFormat:@"$%.2f", perPersonTip];
    self.totalLabel.text = [NSString stringWithFormat:@"$%.2f", perPersonTotal];
}

- (IBAction)onEditBegin:(id)sender {
    CGRect newFrame = self.billField.frame;
    newFrame.origin.y -= 50;
    CGRect newTopView = self.topView.frame;
    newTopView.origin.y -=50;
    CGRect newTipLabel = self.tipLabel.frame;
    newTipLabel.origin.y -=50;
    CGRect newTotalLabel = self.totalLabel.frame;
    newTotalLabel.origin.y -=50;
    CGRect newTipText = self.tipText.frame;
    newTipText.origin.y -=50;
    CGRect newTotalText = self.totalText.frame;
    newTotalText.origin.y -=50;
    [UIView animateWithDuration:0.2 animations:^{
        self.billField.frame = newFrame;
        self.topView.frame = newTopView;
        self.tipLabel.frame = newTipLabel;
        self.totalLabel.frame = newTotalLabel;
        self.tipText.frame = newTipText;
        self.totalText.frame = newTotalText;
    }];
    self.tipLabel.alpha = 1;
    self.totalLabel.alpha = 1;
    self.tipText.alpha = 1;
    self.totalText.alpha = 1;
}

- (IBAction)onEditEnd:(id)sender {
    CGRect newFrame = self.billField.frame;
    newFrame.origin.y += 50;
    CGRect newTopView = self.topView.frame;
    newTopView.origin.y +=50;
    CGRect newTipLabel = self.tipLabel.frame;
    newTipLabel.origin.y +=50;
    CGRect newTotalLabel = self.totalLabel.frame;
    newTotalLabel.origin.y +=50;
    CGRect newTipText = self.tipText.frame;
    newTipText.origin.y +=50;
    CGRect newTotalText = self.totalText.frame;
    newTotalText.origin.y +=50;
    [UIView animateWithDuration:0.2 animations:^{
        self.billField.frame = newFrame;
        self.topView.frame = newTopView;
        self.tipLabel.frame = newTipLabel;
        self.totalLabel.frame = newTotalLabel;
        self.tipText.frame = newTipText;
        self.totalText.frame = newTotalText;
    }];
    self.tipLabel.alpha = 0;
    self.totalLabel.alpha = 0;
    self.tipText.alpha = 0;
    self.totalText.alpha = 0;
}

@end
