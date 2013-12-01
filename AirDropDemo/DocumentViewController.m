//
//  DocumentViewController.m
//  AirDropDemo
//
//  Created by Simon on 28/10/13.
//  Copyright (c) 2013 Appcoda. All rights reserved.
//

#import "DocumentViewController.h"

@interface DocumentViewController ()

@end

@implementation DocumentViewController

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

    NSURL *url = [self fileToURL:self.documentName];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:urlRequest];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//  fileToURL recibe como parametro el nombre del documento y esta nos retorna la URL del documento
- (NSURL *) fileToURL:(NSString*)filename
{
    NSArray *fileComponents = [filename componentsSeparatedByString:@"."];
    NSString *filePath = [[NSBundle mainBundle] pathForResource:[fileComponents objectAtIndex:0] ofType:[fileComponents objectAtIndex:1]];

    return [NSURL fileURLWithPath:filePath];
}

- (IBAction)share:(id)sender {
    // La propiedad documentName almacena el archivo actual(Ej: giraffe.png) mostrado en el document view
    NSURL *url = [self fileToURL:self.documentName];
    NSArray *objectToShare = @[url];
    
    UIActivityViewController *controller = [[UIActivityViewController alloc] initWithActivityItems:objectToShare applicationActivities:nil];
    
    //Excluimos todas las actividades excepto AirDrop
    NSArray *excludeActivities = @[UIActivityTypePostToFacebook,
                                  UIActivityTypePostToTwitter,
                                  UIActivityTypePostToWeibo,
                                  UIActivityTypePostToVimeo,
                                  UIActivityTypeMessage,
                                  UIActivityTypeMail,
                                  UIActivityTypeCopyToPasteboard,
                                  UIActivityTypePrint,
                                  UIActivityTypeAssignToContact,
                                  UIActivityTypeSaveToCameraRoll,
                                  UIActivityTypeAddToReadingList,
                                  UIActivityTypePostToFlickr,
                                  UIActivityTypePostToTencentWeibo];

    controller.excludedActivityTypes = excludeActivities;
    
    //Presents a view controller as a modal view
    [self presentViewController:controller animated:YES completion:nil];
    
}
@end
