//
//  AtkViewController.m
//  Rnd_AutoLayout
//
//  Created by Rick Boykin on 3/14/14.
//  Copyright (c) 2014 Asymptotik Limited. All rights reserved.
//

#import "AtkViewController.h"

@interface AtkViewController ()<UIPickerViewDataSource, UIPickerViewDelegate>

@property (weak, nonatomic) IBOutlet UITextField *txtName;
@property (weak, nonatomic) IBOutlet UITextField *txtStreet;
@property (weak, nonatomic) IBOutlet UITextField *txtCity;
@property (weak, nonatomic) IBOutlet UITextField *txtState;
@property (strong, nonatomic) IBOutlet UIPickerView *pickerState;
@property (strong, nonatomic) NSArray *states;

@end

@implementation AtkViewController

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if(self)
    {
        [self initialize];
    }
    
    return self;
}

- (void)initialize
{
    self.states = @[@"Alabama",
                    @"Alaska",
                    @"Arizona",
                    @"Arkansas",
                    @"California",
                    @"Colorado",
                    @"Connecticut",
                    @"Delaware",
                    @"Florida",
                    @"Georgia",
                    @"Hawaii",
                    @"Idaho",
                    @"Illinois",
                    @"Indiana",
                    @"Iowa",
                    @"Kansas",
                    @"Kentucky",
                    @"Louisiana",
                    @"Maine",
                    @"Maryland",
                    @"Massachusetts",
                    @"Michigan",
                    @"Minnesota",
                    @"Mississippi",
                    @"Missouri",
                    @"Montana",
                    @"Nebraska",
                    @"Nevada",
                    @"New Hampshire",
                    @"New Jersey",
                    @"New Mexico",
                    @"New York",
                    @"North Carolina",
                    @"North Dakota",
                    @"Ohio",
                    @"Oklahoma",
                    @"Oregon",
                    @"Pennsylvania",
                    @"Rhode Island",
                    @"South Carolina",
                    @"South Dakota",
                    @"Tennessee",
                    @"Texas",
                    @"Utah",
                    @"Vermont",
                    @"Virginia",
                    @"Washington",
                    @"West Virginia",
                    @"Wisconsin",
                    @"Wyoming"];
}

// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    int ret = 0;
    
    if(pickerView == _pickerState)
    {
        ret = 1;
    }
    
    return ret;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent: (NSInteger)component
{
    int ret = 0;
    
    if(pickerView == _pickerState)
    {
        ret = _states.count;
    }
    
    return ret;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    NSString *ret = 0;
    
    if(pickerView == _pickerState)
    {
        ret = [_states objectAtIndex:row];
    }
    
    return ret;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if(pickerView == _pickerState)
    {
        NSString *value = [_states objectAtIndex:row];
        _txtState.text = value;
    }
}

- (void)doneTapped:(id)source
{
    NSInteger row = [_pickerState selectedRowInComponent:0];
    NSString *value = [_states objectAtIndex:row];
    _txtState.text = value;
    [_txtState resignFirstResponder];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIToolbar *accessoryView = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 44)];
    accessoryView.barStyle = UIBarStyleBlackTranslucent;
    
    UIBarButtonItem *space = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    
    UIBarButtonItem *done = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(doneTapped:)];
    
    accessoryView.items = [NSArray arrayWithObjects:space,done, nil];
    
    _txtState.inputAccessoryView = accessoryView;
    
    self.pickerState = [[UIPickerView alloc] init];
    _pickerState.dataSource = self;
    _pickerState.delegate = self;
    _pickerState.showsSelectionIndicator = YES;
    _pickerState.backgroundColor = [UIColor whiteColor];
    _txtState.inputView = self.pickerState;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
