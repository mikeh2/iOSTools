//
//  UIKitAdditions.m
//  iOSTools
//
//  Created by mike haberman on 2/10/09.
//  Copyright 2009 3gne. All rights reserved.
//

#import "UIKitAdditions.h"


@implementation UIView (MEHTypes)

-(CGPoint) boundsCenter
{
   // calculate my center
   float cx = [self bounds].size.width/2.0  + [self bounds].origin.x;
   float cy = [self bounds].size.height/2.0 + [self bounds].origin.y;
   
   return CGPointMake(cx,cy);
}
@end

