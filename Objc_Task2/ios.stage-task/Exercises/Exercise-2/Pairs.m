#import "Pairs.h"

@implementation Pairs

- (NSInteger)countPairs:(NSArray <NSNumber *> *)array number:(NSNumber *)number {
    
    
    int result = 0;
    for( int index = 0; index < [array count]-1; index++) {
        int obj = [array[index]intValue] + [number intValue];
        if( [array containsObject:[NSNumber numberWithInt:obj]]) {
            result++;
        }
    }
    
    return (NSInteger)result;
}

@end
