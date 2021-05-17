#import "TwoDimensionalArraySorter.h"

@implementation TwoDimensionalArraySorter

- (NSArray *)twoDimensionalSort:(NSArray<NSArray *> *)array {
    
    NSString *stringKey = @"string";
    NSString *intKey = @"integer";
    
    NSMutableDictionary *dictionary = [NSMutableDictionary new];
    
    if(array == nil) {
        return @[];
    }
    
    for(id obj in array) {
        if(![obj isKindOfClass:[NSArray class]]) {
            return  @[];
        }
        
        NSArray *arr = obj;
        if([arr count] < 1) {
            continue;
        }
        
        if([arr[0] isKindOfClass:[NSNumber class]]) {
            [self addToDictionary:dictionary key:intKey array:[arr mutableCopy]];
        }
        
        if([arr[0] isKindOfClass:[NSString class]]) {
            [self addToDictionary:dictionary key:stringKey array:[arr mutableCopy]];
        }
    }
    
    
    if([dictionary count] != 1) {
        NSMutableArray<NSArray *> *res = [NSMutableArray new];
        NSArray *intArr = [[self sortArray:[dictionary valueForKey:intKey] order:@"ASC"] copy];
        NSArray *stringArr = [[self sortArray:[dictionary valueForKey:stringKey] order:@"DESC"] copy];
        
        
        [res addObject:intArr];
        [res addObject:stringArr];
        return [res copy];
    }else{
        return [[self sortArray:[dictionary valueForKey:[dictionary valueForKey:intKey] != nil ? intKey : stringKey] order:@"ASC"] copy];
    }
    
    return @[];
}

- (void)addToDictionary:(NSMutableDictionary *) dictionary key:(NSString *)key array:(NSMutableArray *)data {
    if ([dictionary valueForKey:key] != nil) {
        [[dictionary valueForKey:key] addObjectsFromArray:data];
    } else {
        [dictionary setValue:data forKey:key];
    }
}

- (NSArray *)sortArray:(NSMutableArray *) array order:(NSString *)orderBy {
    NSSortDescriptor *descriptor = [NSSortDescriptor sortDescriptorWithKey:@"self" ascending:[orderBy isEqual:@"ASC"]];
    [array sortUsingDescriptors:[NSArray arrayWithObject:descriptor]];
    return array;
}

@end
