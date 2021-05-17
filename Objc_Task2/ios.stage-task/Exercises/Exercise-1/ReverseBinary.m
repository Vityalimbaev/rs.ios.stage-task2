#import "ReverseBinary.h"

UInt8 ReverseInteger(UInt8 n) {
    UInt8 result = 0;
    for (int i = 7, j=0; i >= 0; i--, j++) {
        result |= ((n >> j) & 1) << i;
    }
    return result;
}
