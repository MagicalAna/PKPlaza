//
//  PKPlazaViewControllerCell.m
//  PKPlaza
//
//  Created by Yuan Ana on 2018/8/6.
//  Copyright © 2018 Yuan Ana. All rights reserved.
//

#import "PKPlazaViewControllerCell.h"

@interface PKPlazaViewControllerCell ()

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) UIColor *nameColor;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) NSString *content;
@property (nonatomic, strong) NSString *reason;
@property (nonatomic, strong) NSString *date;

@property (nonatomic, strong) UILabel *labelWordName;
@property (nonatomic, strong) UILabel *labelType;
@property (nonatomic, strong) UILabel *labelContent;
@property (nonatomic, strong) UILabel *labelReason;
@property (nonatomic, strong) UILabel *labelDate;

@end

@implementation PKPlazaViewControllerCell

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setData];
    self.view.frame = [[UIScreen mainScreen] bounds];
    NSDictionary *attrs = @{NSFontAttributeName : [UIFont systemFontOfSize:17]};
    //name
    CGSize sizeLabelWordName = [_name sizeWithAttributes:attrs];
    _labelWordName = [[UILabel alloc] initWithFrame:(CGRect){{10, 15}, sizeLabelWordName}];
    _labelWordName.text = _name;
    _labelWordName.textColor = _nameColor;
    //result
    
    //type
    if (_type) {
        _labelType = [[UILabel alloc] initWithFrame:CGRectMake(10, _labelWordName.frame.origin.y + _labelWordName.frame.size.height +10, 50, 20)];
        _labelType.text = _type;
    } else {
        _labelType = [[UILabel alloc] initWithFrame:CGRectMake(10, _labelWordName.frame.origin.y + _labelWordName.frame.size.height, 0, 0)];
    }
    //content
    CGSize sizePKContent = CGSizeMake(self.view.frame.size.width - 20, MAXFLOAT);
    CGRect rectPKContent = [_content boundingRectWithSize:sizePKContent options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil];
    CGFloat heightPKContent = rectPKContent.size.height;
    _labelContent = [[UILabel alloc] initWithFrame:CGRectMake(10, _labelType.frame.origin.y + _labelType.frame.size.height + 10, sizePKContent.width, heightPKContent)];
    _labelContent.text = _content;
    _labelContent.numberOfLines = 0;
    //reason
    if(_reason) {
        NSString *stringPKReason = [NSString stringWithFormat:@"PK理由：%@", _reason];
        CGSize sizePKReason = CGSizeMake(self.view.frame.size.width - 20, MAXFLOAT);
        CGRect rectPKReason = [stringPKReason boundingRectWithSize:sizePKReason options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil];
        CGFloat heightPKReason = rectPKReason.size.height;
        _labelReason = [[UILabel alloc] initWithFrame:CGRectMake(10, _labelContent.frame.origin.y + _labelContent.frame.size.height +10, sizePKReason.width, heightPKReason)];
        _labelReason.text = stringPKReason;
        _labelReason.numberOfLines = 0;
    } else {
        _labelReason = [[UILabel alloc] initWithFrame:CGRectMake(10, _labelContent.frame.origin.y + _labelContent.frame.size.height, 0, 0)];
    }
    //date
    if (_date) {
        _labelDate = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width / 2 + 1, _labelReason.frame.origin.y + _labelReason.frame.size.height + 10, self.view.frame.size.width / 2, 17)];
        _labelDate.text = _date;
    } else {
        _labelDate = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width / 2 + 1, _labelReason.frame.origin.y + _labelReason.frame.size.height, 0, 0)];
    }
    //设置view长度
    CGRect rect = self.view.frame;
    rect.size.height = _labelDate.frame.origin.y + _labelDate.frame.size.height + 10;
    self.view.frame = rect;
    [self.view addSubview:_labelWordName];
    [self.view addSubview:_labelType];
    [self.view addSubview:_labelContent];
    [self.view addSubview:_labelReason];
    [self.view addSubview:_labelDate];
}

- (void)setData {
    _name = [_dictionary objectForKey:@"name"];
    _nameColor = [_dictionary objectForKey:@"name_color"];
    _type = [_dictionary objectForKey:@"type"];
    _content = [_dictionary objectForKey:@"content"];
    _reason = [_dictionary objectForKey:@"reason"];
    _date = [_dictionary objectForKey:@"date"];
}

@end
