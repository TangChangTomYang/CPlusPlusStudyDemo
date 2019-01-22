

//#ifndef abc_h
//#define abc_h
//
//// 头文件那方法声明,全部放在这里
//int sum(int a, int b);
//
//#endif /* abc_h */


// 和上面的条件编译效果是一样的,可以防止文件被包含多次
// 不论外面 写多少次 #include "abc.h" (同一文件), 都只导入一次

#pragma once
int sum(int a, int b);

/** 条件编译和#pragma once的区别
 1. #ifndeg/ #define/ #endif 是受C/C++ 标准的支持,不受编译器的任何限制
 2. 有些编译器不支持 #pragma once (较老的编译器不支持, 如: GCC3.4之前版本),兼容性不够好
 3. #ifndeg/ #define/ #endif 可以针对一个文件中的部分代码(比如: 某一句), 而 #pragma once 只能针对整个文件
 */







