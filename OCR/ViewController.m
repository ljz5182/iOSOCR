//
//  ViewController.m
//  OCR
//
//  Created by 梁家章 on 22/12/2017.
//  Copyright © 2017 liangjiazhang. All rights reserved.
//

#import "ViewController.h"
#import "TesseractOCR.h"



@interface ViewController ()


@property (nonatomic , retain) UIImageView * imageView;
@property (nonatomic , retain) UITextView * textView;


@end

@implementation ViewController

@synthesize imageView,textView;



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    UILabel * labelTitleLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 60, self.view.frame.size.width,  60)];
    labelTitleLabel.backgroundColor = [UIColor clearColor];
    labelTitleLabel.text = @"图片";
    [self.view addSubview:labelTitleLabel];
    
    
    if (!imageView) {
        imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 140, self.view.frame.size.width, self.view.frame.size.width * 0.7)];
        [imageView setImage:[UIImage imageNamed:@"onew.png"]];
        [self.view addSubview:imageView];
    }
    
    
    UILabel * labelResultLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, self.imageView.frame.origin.y + self.imageView.frame.size.height + 20, self.view.frame.size.width,  60)];
    labelResultLabel.backgroundColor = [UIColor clearColor];
    labelResultLabel.text = @"识别结果";
    [self.view addSubview:labelResultLabel];
    
    if (!textView) {
        textView = [[UITextView alloc]initWithFrame:CGRectMake(0, labelResultLabel.frame.origin.y + labelResultLabel.frame.size.height + 20, self.view.frame.size.width, 300)];
        textView.font = [UIFont systemFontOfSize:16.0f];
        
        [self.view addSubview:textView];
        
    }
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)recognizeText:(UIImage *)images {
    
    G8Tesseract * objectText = [[G8Tesseract alloc]initWithLanguage:@"chi_sim"];
    
    objectText.engineMode = G8OCREngineModeCubeOnly;
    objectText.pageSegmentationMode = G8PageSegmentationModeAuto;
    objectText.image = images;
    
    if ([objectText recognize]) {
        self.textView.text = objectText.recognizedText;
    }
    
    
}

@end
