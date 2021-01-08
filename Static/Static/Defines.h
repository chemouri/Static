//
//  Defines.h
//  Static
//
//  Created by evilpenguin
//

#ifndef Defines_h
#define Defines_h


// Weakify and Strongify
#define weakify(var) \
    __weak typeof(var) SWeak_##var = var

#define strongify(var) \
    _Pragma("clang diagnostic push") \
    _Pragma("clang diagnostic ignored \"-Wshadow\"") \
    __strong typeof(var) var = SWeak__##var \
    _Pragma("clang diagnostic pop")

#endif /* Defines_h */
