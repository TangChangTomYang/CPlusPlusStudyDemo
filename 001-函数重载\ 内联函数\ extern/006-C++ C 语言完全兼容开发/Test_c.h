//
//  Test_c.h
//  006-C++ C 语言完全兼容开发
//
//  Created by yangrui on 2019/1/10.
//  Copyright © 2019年 yangrui. All rights reserved.
//  C 语言完全兼容C++ 开发的写法

#ifndef Test_c_h
#define Test_c_h
#include <stdio.h>

#ifdef __cplusplus //C++ 环境环境,条件编译
extern "C" {
#endif //__cplusplus

// 在C语言环境中编写的,今后需要在C++环境中使用的函数,在此声明
int c_sum(int a, int b);
int c_minus(int a, int b);
    
#ifdef __cplusplus
}
#endif //__cplusplus

#endif /* Test_c_h */
