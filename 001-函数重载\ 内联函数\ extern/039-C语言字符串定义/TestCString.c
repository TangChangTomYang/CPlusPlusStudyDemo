//
//  TestCString.c
//  039-C语言字符串定义
//
//  Created by yangrui on 2019/2/14.
//  Copyright © 2019年 yangrui. All rights reserved.
//

#include "TestCString.h"


void testCString(){
    // C语言中是允许 将一个字符串常亮比如: "bmw" 直接赋值给 char * 的, 但是在C++ 是不允许的
    // 在 C++ 中如果要将 一个字符串常亮赋值给 char * ,必须在char * 前面加上 const 修饰符
    char *name = "bmw";
    printf("name: %s",name);
    
    //C++ 的做法, 前面必须添加 const 修饰
    const char *cppName = "bmw";
    printf("cppName: %s",cppName);
     
    
    printf("\n%p",name);
    printf("\n%p",cppName);
}
