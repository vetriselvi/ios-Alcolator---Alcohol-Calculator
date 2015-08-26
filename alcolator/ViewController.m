//
//  ViewController.m
//  alcolator
//
//  Created by Vetri Selvi Vairamuthu on 8/25/15.
//  Copyright (c) 2015 Vetri Selvi Vairamuthu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) viewDidAppear:(BOOL)animated{
    [self.beerPercentageTextField becomeFirstResponder];

}
- (IBAction)textFieldDidChange:(UITextField *)sender {
    //[self.beerPercentageTextField becomeFirstResponder];
    NSString *enteredString = sender.text;
    float enteredNumber =[enteredString floatValue];
    if (enteredNumber == 0) {
        sender.text = nil;
    }
    
}
- (IBAction)buttonPressed:(id)sender {
   // [self.beerPercentageTextField resignFirstResponder];
    
    //Alcohol content in Beer
    int numberOfBeers = self.beerCountSlider.value;
    int ouncesInOneBeer = 12;
    float alcoholPercentageOfBeer = [self.beerPercentageTextField.text floatValue]/100;
    float ouncesOfAlcoholPerBeer = ouncesInOneBeer * alcoholPercentageOfBeer;
    float ouncesOfAlcoholTotal = ouncesOfAlcoholPerBeer * numberOfBeers;
    //Equivalent amount of Wine
    float ouncesInOneWineGlass = 5;
    float alcoholPercentageOfWine = 0.13;
    float ouncesOfAlcoholInOneGlassOfWine = ouncesInOneWineGlass * alcoholPercentageOfWine;
    float numberOfWineGlassEquivalentOfAlcohol = ouncesOfAlcoholTotal/ouncesOfAlcoholInOneGlassOfWine;
    
    
    NSString *beerString;
    if (numberOfBeers==1) {
        beerString = NSLocalizedString(@"beer", @"singular beer");
        
    }
    else {
        beerString = NSLocalizedString(@"beers", @"plural beer");
        
    }
    NSString *wineString;
    if (numberOfWineGlassEquivalentOfAlcohol) {
        wineString = NSLocalizedString(@"glass", @"singular wine");
    }
    else{
        wineString = NSLocalizedString(@"glasses", @"plural wine");
    }
    
    NSString *resultString = [NSString stringWithFormat:NSLocalizedString(@"%d %@ (with %.2f%% of alcohol) contains as much alcohol as %.1f %@ of wine ", nil), numberOfBeers,beerString, [self.beerPercentageTextField.text floatValue], numberOfWineGlassEquivalentOfAlcohol,wineString];
    self.resultLabel.text = resultString;
    
}

- (IBAction)sliderValueDidChange:(UISlider *)sender {
    NSLog(@"Slider Value is set to  %f",sender.value);
    //[self.beerPercentageTextField resignFirstResponder];
}

- (IBAction)tabGestureDidFire:(id)sender {
   // [self.beerPercentageTextField resignFirstResponder];
}

@end
