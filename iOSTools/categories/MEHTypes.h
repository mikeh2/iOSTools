//
//  MEHTypes.h
//
//  Created by mike haberman on 2/10/09.
//  Copyright 2009 3gne. All rights reserved.
//

#import <Foundation/Foundation.h>


int randomBetweenNegOneAndPosOne(id obj1, id obj2, void *context);

@interface NSString (MEHTypes) 

- (NSInteger) indexOf: (NSString*) substring;
- (NSString*) trim;
- (NSString*) internalTrim;
- (NSString*) characterAsStringAtIndex: (NSUInteger) index;
+ (NSString*) stringFromError:(NSError*) error;
+ (NSString*) capitalizeFirstLetter: (NSString*) str;
@end


@interface NSMutableArray (MEHTypes) 

- (void) shuffle;
- (void) swapFrom:(int) fromIdx to:(int) toIdx;
@end

@interface  NSError (MEHTypes) 
- (NSString*) errorToMessage;
@end


@interface NSObject (MEHTypes)

- (NSString *)className;
+ (NSString *)className;

@end





