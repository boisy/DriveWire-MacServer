//
//  NetworkWindowController.m
//  DriveWire
//
//  Created by Boisy Pitre on 4/19/15.
//
//

#import "NetworkWindowController.h"
#import "NetworkConnectionViewController.h"

@interface NetworkWindowController ()

@property (strong) NSArray *virtualChannels;

@end

@implementation NetworkWindowController

- (id)initWithChannels:(NSArray *)channels;
{
    if (self = [super initWithWindowNibName:@"NetworkWindowController"])
    {
        self.virtualChannels = channels;
    }
    
    return self;
}

- (void)windowDidLoad;
{
    [super windowDidLoad];

    NSUInteger totalHeight = 0;
    self.viewControllers = [NSMutableArray array];
    for (int i = 0; i < 15; i++)
    {
        NetworkConnectionViewController *vc = [[NetworkConnectionViewController alloc] initWithChannel:[self.virtualChannels objectAtIndex:15 - i]];
        [self.viewControllers addObject:vc];
        NSRect frame = vc.view.frame;
        frame.origin.y = frame.size.height * i;
        totalHeight += frame.size.height;
        vc.view.frame = frame;
        [self.scrollView.contentView addSubview:vc.view];
    }

    NSSize scrollContentSize = self.scrollView.documentView.frame.size;
    scrollContentSize.height = totalHeight;
    [self.scrollView.documentView setFrameSize:scrollContentSize];

    // TODO: determine how to scroll view up to top
}

@end
