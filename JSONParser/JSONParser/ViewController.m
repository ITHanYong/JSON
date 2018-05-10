//
//  ViewController.m
//  JSONParser
//
//  Created by HanYong on 2018/5/10.
//  Copyright © 2018年 HanYong. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, retain) NSDictionary *dataDict;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    [self parserJSON:[self setJSON]];
}

-(NSString *)setJSON{
    
    NSDictionary *dTest = @{
        @"channel" : @{
            @"nodeId" : @"ELS-002-001",
            @"name" : @"A",
            @"hasChildren" : @1,
            @"parentId" : @"-1"
        },
        @"channels" :@""
    };
    
    NSData *data = [NSJSONSerialization dataWithJSONObject:dTest options:NSJSONWritingPrettyPrinted error:nil];
    NSString *jsonStr = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    return jsonStr;
}

-(void)parserJSON:(NSString *)jsonStr{
    
//    NSData *JSONData = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"test" ofType:@"json"]];
    
    NSData *JSONData = [jsonStr dataUsingEncoding:NSUTF8StringEncoding];
    _dataDict = [NSJSONSerialization JSONObjectWithData:JSONData options:NSJSONReadingAllowFragments error:nil];
    
    NSDictionary *channel = [_dataDict objectForKey:@"channel"];
    BOOL hasChildren = [[channel objectForKey:@"hasChildren"] boolValue];
    
    NSLog(@"%@",_dataDict);
    if (hasChildren) {
        
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
