//
//  DocumentViewController.h
//  AirDropDemo
//
//  Este controlador presenta el contenido del documento via Web View

#import <UIKit/UIKit.h>

@interface DocumentViewController : UIViewController
- (IBAction)share:(id)sender;

@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property NSString *documentName;
@end
