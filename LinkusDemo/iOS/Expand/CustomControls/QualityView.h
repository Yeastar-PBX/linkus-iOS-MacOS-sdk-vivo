//
//  QualityView.h
//  Linkus
//
//  Created by 杨桂福 on 2022/12/9.
//  Copyright © 2022 Yeastar Technology Co., Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QualityView : UIView

+ (void)qualityViewData:(NSString *(^)(void))handler showInView:(UIView *)view;

@end
