//
//  SwizzleUitl.m
//
//
//  Created by Consoar on 14-8-18.
//  Copyright (c) 2014年 bos. All rights reserved.
//

#import "SwizzleUitl.h"
#import <objc/runtime.h>

void swizzleMethods(Class cls, SEL originalSel, SEL newSel) {
    Method origMethod = class_getInstanceMethod(cls, originalSel);
    if (!origMethod) {
        NSLog(@"original method %@ not found for instance %@", NSStringFromSelector(originalSel), [cls class]);
        return;
    }
    Method newMethod = class_getInstanceMethod(cls, newSel);
    if (!newMethod) {
        NSLog(@"new method %@ not found for instance %@", NSStringFromSelector(newSel), [cls class]);
        return;
    }
    if(class_addMethod(cls,
                       originalSel,
                       method_getImplementation(newMethod),
                       method_getTypeEncoding(newMethod))) {
        class_replaceMethod(cls,
                            newSel,
                            method_getImplementation(origMethod),
                            method_getTypeEncoding(origMethod));
    } else {
        method_exchangeImplementations(origMethod, newMethod);
    }
}

void swizzleClassMethod(Class cls, SEL originalSel, SEL newSel)
{
    cls = object_getClass((id)cls);
    Method origMethod = class_getClassMethod(cls, originalSel);
    if (!origMethod) {
        NSLog(@"original method %@ not found for class %@", NSStringFromSelector(originalSel), [cls class]);
        return;
    }
    Method newMethod = class_getClassMethod(cls, newSel);
    if (!newMethod) {
        NSLog(@"new method %@ not found for class %@", NSStringFromSelector(newSel), [cls class]);
        return;
    }
    if(class_addMethod(cls,
                       originalSel,
                       method_getImplementation(newMethod),
                       method_getTypeEncoding(newMethod))) {
        class_replaceMethod(cls,
                            newSel,
                            method_getImplementation(origMethod),
                            method_getTypeEncoding(origMethod));
    } else {
        method_exchangeImplementations(origMethod, newMethod);
    }
}
