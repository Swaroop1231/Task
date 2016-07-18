//
//  CustomTableViewCell.m
//  Task
//
//  Created by Satya Swaroop Basangi on 16/07/16.
//  Copyright © 2016 Satya Swaroop. All rights reserved.
//

#import "CustomTableViewCell.h"




@implementation CustomTableViewCell
@synthesize titleLabel,descriptionLabel,displayImageView;
- (void)awakeFromNib
{
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
   
        self.titleLabel = [[UILabel alloc] init];
        [self.titleLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self.titleLabel setFont:[UIFont boldSystemFontOfSize:17]];

        [self.titleLabel setLineBreakMode:NSLineBreakByWordWrapping];
        [self.titleLabel setNumberOfLines:1];
        [self.titleLabel setTextAlignment:NSTextAlignmentLeft];
        [self.titleLabel setBackgroundColor:[UIColor clearColor]];
        [self.contentView addSubview:self.titleLabel];
        
        
        
        self.displayImageView = [[UIImageView alloc] init];

        [self.displayImageView setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self.contentView addSubview:self.displayImageView];

        
        
        
        // Add this label to the button
        self.descriptionLabel = [[UILabel alloc] init];
        [self.descriptionLabel setFont:[UIFont systemFontOfSize:15]];

        [self.descriptionLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self.descriptionLabel setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
        [self.descriptionLabel setLineBreakMode:NSLineBreakByWordWrapping];
        [self.descriptionLabel setNumberOfLines:0];
        [self.descriptionLabel setTextAlignment:NSTextAlignmentLeft];
        //[self.descriptionLabel setTextColor:[UIColor darkGrayColor]];
        [self.descriptionLabel setBackgroundColor:[UIColor clearColor]];
        [self.contentView addSubview:self.descriptionLabel];
        
    }
    return self;
}


- (void)updateConstraints
{
    [super updateConstraints];

    
    //////Consrtraints for title label

    [self.titleLabel addConstraint:[NSLayoutConstraint constraintWithItem:self.titleLabel attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:0 multiplier:1 constant:self.contentView.frame.size.width-10]];
    
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.titleLabel attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeLeading multiplier:1 constant:10]];
    
    
    
    //////Consrtraints for ImageView
    
    
    
    [self.displayImageView addConstraint:[NSLayoutConstraint constraintWithItem:self.displayImageView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:0 multiplier:1 constant:200]];
    [self.displayImageView addConstraint:[NSLayoutConstraint constraintWithItem:self.displayImageView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:0 multiplier:1 constant:200]];
    
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.displayImageView
                                                                 attribute:NSLayoutAttributeTop
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.titleLabel
                                                                 attribute: NSLayoutAttributeBottom
                                                                multiplier:1
                                                                  constant:15]];
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.displayImageView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeCenterX multiplier:1 constant:0]];

    
    
    
    
    
    
    
    
    //////Consrtraints for Description label
    
    
    
    [self.descriptionLabel addConstraint:[NSLayoutConstraint constraintWithItem:self.descriptionLabel attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:0 multiplier:1 constant:self.contentView.frame.size.width-10]];
    
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.descriptionLabel
                                                          attribute:NSLayoutAttributeTop
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.displayImageView
                                                          attribute: NSLayoutAttributeBottom
                                                         multiplier:1
                                                           constant:15]];
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.descriptionLabel attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeLeading multiplier:1 constant:10]];

    
    
}

@end
