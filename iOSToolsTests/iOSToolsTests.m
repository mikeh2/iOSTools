//
//  iOSToolsTests.m
//  iOSToolsTests
//
//  Created by mike haberman on 3/9/12.
//  Copyright (c) 2012 Ncsa. All rights reserved.
//

#import "iOSToolsTests.h"

@implementation iOSToolsTests

-(NSString*) description
{
   return @"testing";
}
- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void)testExample
{
   DetailLog(@"here we got DEBUG: %d", DEBUG);
   //STFail(@"Unit tests are not implemented yet in iOSToolsTests");
}

@end
