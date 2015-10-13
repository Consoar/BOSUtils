//
//  SwizzleUitl.h
//  
//
//  Created by Consoar on 14-8-18.
//  Copyright (c) 2014年 bos. All rights reserved.
//
#import <Foundation/Foundation.h>

/**
 * Swap the two method implementations on the given class.
 * Uses method_exchangeImplementations to accomplish this.
 */
void swizzleMethods(Class cls, SEL originalSel, SEL newSel);

void swizzleClassMethod(Class cls, SEL originalSel, SEL newSel);