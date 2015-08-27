//
//  WhiskeyViewController.m
//  alcolator
//
//  Created by Vetri Selvi Vairamuthu on 8/26/15.
//  Copyright (c) 2015 Vetri Selvi Vairamuthu. All rights reserved.
//

#import "WhiskeyViewController.h"

@interface WhiskeyViewController ()
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (nonatomic) UILabel *sampleLabel;
@end

@implementation WhiskeyViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //coded view and subviews
    self.descriptionLabel.numberOfLines = 0;
    //self.navigationItem.title = @"Whiskey";
    
//    self.sampleLabel = [[UILabel alloc] init];
//    self.sampleLabel.text = @"The quick brown fox jumped over the lazy dog.";
//    [self.sampleLabel sizeToFit];
//    [self.view addSubview:self.sampleLabel];
}

//- (void)viewWillLayoutSubviews
//{
//    [super viewWillLayoutSubviews];
//    //frame based layout - (constraint based layout is another category)
//    CGFloat heightOfLabel = CGRectGetHeight(self.sampleLabel.bounds);
//    self.sampleLabel.frame = CGRectMake(0,
//                                        CGRectGetHeight(self.view.bounds)-heightOfLabel,
//                                        CGRectGetWidth(self.sampleLabel.bounds),
//                                        heightOfLabel);
//}

- (void)buttonPressed:(UIButton *)sender;
{
   [self.beerPercentageTextField resignFirstResponder];
    
    int numberOfBeers = self.beerCountSlider.value;
    int ouncesInOneBeerGlass = 12;  //assume they are 12oz beer bottles
    
    float alcoholPercentageOfBeer = [self.beerPercentageTextField.text floatValue] / 100;
    float ouncesOfAlcoholPerBeer = ouncesInOneBeerGlass * alcoholPercentageOfBeer;
    float ouncesOfAlcoholTotal = ouncesOfAlcoholPerBeer * numberOfBeers;
    
    float ouncesInOneWhiskeyGlass = 1;  // a 1oz shot
    float alcoholPercentageOfWhiskey = 0.4;  // 40% is average
    
    float ouncesOfAlcoholPerWhiskeyGlass = ouncesInOneWhiskeyGlass * alcoholPercentageOfWhiskey;
    float numberOfWhiskeyGlassesForEquivalentAlcoholAmount = ouncesOfAlcoholTotal / ouncesOfAlcoholPerWhiskeyGlass;
    
    NSString *beerText;
    
    if (numberOfBeers == 1) {
        beerText = NSLocalizedString(@"beer", @"singular beer");
    } else {
        beerText = NSLocalizedString(@"beers", @"plural of beer");
    }
    
    NSString *whiskeyText;
    
    if (numberOfWhiskeyGlassesForEquivalentAlcoholAmount == 1) {
        whiskeyText = NSLocalizedString(@"shot", @"singular shot");
    } else {
        whiskeyText = NSLocalizedString(@"shots", @"plural of shot");
    }
    NSString *resultText = [NSString stringWithFormat:NSLocalizedString(@"%d %@ (with %.2f%% alcohol) contains as much alcohol as %.1f %@ of whiskey.", nil), numberOfBeers, beerText, [self.beerPercentageTextField.text floatValue], numberOfWhiskeyGlassesForEquivalentAlcoholAmount, whiskeyText];
    self.resultLabel.text = resultText;
    [self.resultLabel sizeToFit];
    [self.tabBarItem setBadgeValue:[NSString stringWithFormat:@"%d", (int) ceilf(numberOfWhiskeyGlassesForEquivalentAlcoholAmount)]];


}


@end
