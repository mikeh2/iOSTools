//
//  MyTypes.m
//  iSpell
//
//  Created by mike haberman on 2/10/09.
//  Copyright 2009 3gne. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <CommonCrypto/CommonCryptor.h>

#import "MyTypes.h"

@implementation NSObject (ClassName)

- (NSString *)className {
   return NSStringFromClass([self class]);
}
+ (NSString *)className {
   return NSStringFromClass(self);
}
@end


@implementation NSString (MyTypes) 

+(NSString*) capitalizeFirstLetter: (NSString*) str
{
   return [str stringByReplacingCharactersInRange:NSMakeRange(0,1) 
                                       withString:[[str substringToIndex:1] capitalizedString]];
}


+ (NSString*) stringFromError:(NSError*) error
{
   NSString *message = [NSString stringWithFormat:@"%@ %@",
                        [error localizedDescription],
                        [error localizedFailureReason]];
   return message;
}

- (NSInteger) indexOf: (NSString*) substring
{
   // DebugLog(@"doing subsring on %@", substring);
   if (substring == nil) return -1;
   
   NSRange range = [self rangeOfString:substring];
   if (range.location == NSNotFound) {
      return -1;
   }
   
   return range.location;
}


- (NSString*) trim
{
   return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

-(NSString*) stringByNormalizingCharacterInSet:(NSCharacterSet*)stopSet
                                    withString:(NSString*)replacement
{
   NSMutableString* result = [NSMutableString string];
   NSScanner* scanner =  [NSScanner scannerWithString:self];
   while (![scanner isAtEnd]) {
      
      NSString* stringPart = nil;
      
      // move the scanner forward past any whitespace
      if ([scanner scanUpToCharactersFromSet:stopSet intoString:NULL]) {
         DebugLog(@"appending %@<--", replacement);
      }
      
      // consume those characters
      if ([scanner scanCharactersFromSet:stopSet intoString:&stringPart]) {
         [result appendString:stringPart];
         [result appendString:replacement];
      }
      
   }
   // return [[result copy] autorelease];
   return [result trim];
}
           
-(NSString*) internalTrim
{
   return [self stringByNormalizingCharacterInSet:[NSCharacterSet alphanumericCharacterSet]
                                       withString:@" "];
}


- (NSString*) characterAsStringAtIndex: (NSUInteger) index
{
   if (index >= [self length]) {
      DebugLog(@"ERROR request for character %i", index);
      return @"";
   }    
   
   unichar c = [self characterAtIndex:index];
   NSString* letter = [NSString stringWithFormat:@"%C", c];
   return letter;

}

                    
                    


@end


@implementation UIView (MyTpes)

-(CGPoint) boundsCenter
{
   // calculate my center
   float cx = [self bounds].size.width/2.0  + [self bounds].origin.x;
   float cy = [self bounds].size.height/2.0 + [self bounds].origin.y;

   return CGPointMake(cx,cy);
}
@end



int randomBetweenNegOneAndPosOne(id obj1, id obj2, void *context)
{
   // returns random number -1 0 1
   return (random()%3 - 1);    
}

@implementation NSMutableArray (MyTypes) 
+ (void)load
{
   srandom(time(NULL));
   //srand(time(NULL)); rand();
}



- (void) shuffle
{
   // [self sortUsingFunction:randomSort context:nil];
   
   int count = [self count];
   
   for( int index = 0; index < count; index++ )
   {
      int randomIndex = random() % count;
      [self exchangeObjectAtIndex:index withObjectAtIndex:randomIndex];
   }
}

- (void) swapFrom:(int) fromIdx to:(int) toIdx
{
   // remove the old, but retain it first
   NSObject* fromOrm = [self objectAtIndex:fromIdx];
   [self removeObjectAtIndex:fromIdx];
   
   if (toIdx > [self count]) {
      toIdx = [self count];
   }
   
   [self insertObject:fromOrm  atIndex:toIdx];
}

@end



@implementation NSError (MyTypes) 

- (NSString*) errorToMessage
{
   NSString *reason = [self localizedFailureReason];
   
   if ( [reason indexOf:@"null"] >= 0) {
      reason = @"";
   }
   
   NSString *message =  [NSString stringWithFormat:@"Error! %@ %@",
                        [self localizedDescription], reason ];
   
   return message;
}
@end




