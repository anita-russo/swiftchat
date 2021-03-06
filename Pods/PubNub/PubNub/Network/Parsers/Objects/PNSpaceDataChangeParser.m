/**
 * @author Serhii Mamontov
 * @version 4.10.0
 * @since 4.10.0
 * @copyright © 2010-2019 PubNub, Inc.
 */
#import "PNSpaceDataChangeParser.h"


#pragma mark Interface implementation

@implementation PNSpaceDataChangeParser


#pragma mark - Identification

+ (NSArray<NSNumber *> *)operations {
    return @[@(PNCreateSpaceOperation), @(PNUpdateSpaceOperation)];
}

+ (BOOL)requireAdditionalData {
    return NO;
}


#pragma mark - Parsing

+ (NSDictionary<NSString *, id> *)parsedServiceResponse:(id)response {
    NSDictionary<NSString *, id> *processedResponse = nil;
    
    if ([response isKindOfClass:[NSDictionary class]] && response[@"data"] &&
        ((NSNumber *)response[@"status"]).integerValue == 200) {
        
        processedResponse = @{ @"space": response[@"data"] };
    }
    
    return processedResponse;
}

#pragma mark -


@end
