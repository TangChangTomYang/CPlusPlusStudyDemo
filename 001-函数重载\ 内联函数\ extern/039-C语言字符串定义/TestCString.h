//
//  TestCString.h
//  039-C语言字符串定义
//
//  Created by yangrui on 2019/2/14.
//  Copyright © 2019年 yangrui. All rights reserved.
//

#ifndef TestCString_h
#define TestCString_h

#include <stdio.h>



#ifdef __cplusplus //C++ 环境环境,条件编译
extern "C" {
#endif //__cplusplus
    
    // 在C语言环境中编写的,今后需要在C++环境中使用的函数,在此声明
    void testCString();
    
#ifdef __cplusplus
}
#endif //__cplusplus

#endif /* TestCString_h */
