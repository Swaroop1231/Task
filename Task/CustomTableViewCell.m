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
        

        //********* Title label *********//
        self.titleLabel  = [[UILabel alloc] init];
        self.titleLabel .numberOfLines = 0;
        self.titleLabel .lineBreakMode = NSLineBreakByWordWrapping;
        self.titleLabel .preferredMaxLayoutWidth = 1000;
        
        [self.titleLabel  setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
        [self.titleLabel  setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
        [self.titleLabel  setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self.contentView addSubview:self.titleLabel ];
        
        //********* Image View *********//
        
        
        
        self.displayImageView  = [[UIImageView alloc] init];
        [self.displayImageView  setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
        [self.displayImageView  setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
        [self.displayImageView  setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self.contentView addSubview:self.displayImageView ];
        
        //********* Description label *********//
        
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
    if (!self.didSetupConstraints) {
        self.didSetupConstraints = YES;
        
        //********* Consrtraints for Title label *********//
        
        
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.titleLabel
                                                                     attribute:NSLayoutAttributeTrailing
                                                                     relatedBy:NSLayoutRelationEqual
                                                                        toItem:self.contentView
                                                                     attribute:NSLayoutAttributeTrailing
                                                                    multiplier:1
                                                                      constant:-25]];
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.titleLabel
                                                                     attribute:NSLayoutAttributeTop
                                                                     relatedBy:NSLayoutRelationEqual
                                                                        toItem:self.contentView
                                                                     attribute:NSLayoutAttributeTop
                                                                    multiplier:1
                                                                      constant:15]];
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.titleLabel
                                                                     attribute:NSLayoutAttributeLeading
                                                                     relatedBy:NSLayoutRelationEqual
                                                                        toItem:self.contentView
                                                                     attribute:NSLayoutAttributeLeading
                                                                    multiplier:1
                                                                      constant:15]];
        
        
        
        
        
        //********* Consrtraints for ImageView *********//
        
        
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.displayImageView
                                                                     attribute:NSLayoutAttributeTop
                                                                     relatedBy:NSLayoutRelationEqual
                                                                        toItem:self.titleLabel
                                                                     attribute:NSLayoutAttributeTop
                                                                    multiplier:1
                                                                      constant:50]];
        
        
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.displayImageView
                                                                     attribute:NSLayoutAttributeCenterX
                                                                     relatedBy:NSLayoutRelationEqual
                                                                        toItem:self.contentView
                                                                     attribute:NSLayoutAttributeCenterX
                                                                    multiplier:1
                                                                      constant:0]];
        
        
        
        [self.displayImageView addConstraint:[NSLayoutConstraint constraintWithItem:self.displayImageView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:0 multiplier:1 constant:200]];
        
        [self.displayImageView addConstraint:[NSLayoutConstraint constraintWithItem:self.displayImageView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:0 multiplier:1 constant:200]];
        
        
        
        //********* Consrtraints for Description Label *********//
        
        
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.descriptionLabel
                                                                     attribute:NSLayoutAttributeTrailing
                                                                     relatedBy:NSLayoutRelationEqual
                                                                        toItem:self.contentView
                                                                     attribute:NSLayoutAttributeTrailing
                                                                    multiplier:1
                                                                      constant:-15]];
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.descriptionLabel
                                                                     attribute:NSLayoutAttributeLeading
                                                                     relatedBy:NSLayoutRelationEqual
                                                                        toItem:self.contentView
                                                                     attribute:NSLayoutAttributeLeading
                                                                    multiplier:1
                                                                      constant:15]];
        
        
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.descriptionLabel
                                                                     attribute:NSLayoutAttributeTop
                                                                     relatedBy:NSLayoutRelationEqual
                                                                        toItem:self.displayImageView
                                                                     attribute:NSLayoutAttributeTop
                                                                    multiplier:1
                                                                      constant:280]];
        
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.descriptionLabel
                                                                     attribute:NSLayoutAttributeBottom
                                                                     relatedBy:NSLayoutRelationEqual
                                                                        toItem:self.contentView
                                                                     attribute:NSLayoutAttributeBottom
                                                                    multiplier:1
                                                                      constant:-15]];
        
        
        
        
        
        
        
        
    }
    
    [super updateConstraints];
}

@end
