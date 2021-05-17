#import "IPFormatConverter.h"

@implementation IPFormatConverter

- (NSString *)ipFormatConverter:(NSArray *)numbersArray {
    
    if([numbersArray count] < 1) {
        return [NSString stringWithFormat:@"%s",""];
    }
    
    NSMutableArray *stringArr = [NSMutableArray new];
    
    for(int i = 0; i < 4; i++) {
        
        int num = 0;
        
        if( i < [numbersArray count]) {
            num = [numbersArray[i] intValue];
        }
       
        if(num < 0){
            return @"Negative numbers are not valid for input.";
        }
        if(num > 255){
            return @"The numbers in the input array can be in the range from 0 to 255.";
        }
        
        [stringArr addObject:[NSString stringWithFormat:@"%d", num]];
    }

    
    return [stringArr componentsJoinedByString:@"."] ;
}

@end
