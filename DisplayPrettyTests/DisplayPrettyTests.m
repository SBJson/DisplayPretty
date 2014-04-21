//
//  DisplayPrettyTests.m
//  DisplayPrettyTests
//
//  Created by Stig Brautaset on 21/04/2014.
//  Copyright (c) 2014 Stig Brautaset. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface DisplayPrettyTests : XCTestCase

@end

@implementation DisplayPrettyTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample
{
    XCTFail(@"No implementation for \"%s\"", __PRETTY_FUNCTION__);
}

@end
