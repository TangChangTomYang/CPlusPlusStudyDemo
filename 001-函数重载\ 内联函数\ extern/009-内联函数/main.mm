

/** 内联函数 (inline function)
1. 使用 'inline' 修饰函数声明或者函数实现,可以使其变成内联函数
 建议声明和实现都增加inline 修饰
 
 特点:
 1. 编译器会将函数调用直接展开为函数体代码
 2. 可以减少函数调用的开销 (内联函数真实执行时,不再像普通函数调用需要开辟一段占空间,而是直接将函数体展开执行)
 
 缺点:
 会增加代码的实际体积
 
 注意点;
 1.尽量不要内联超过10行代码的函数
 2. 有些函数即使 被声明为 'inline' , 也不一定会被编译器内联,比如递归函数
 ( 也就是在, 在函数前面加 inline,仅仅是建议编译器把对应的函数编译为内联, 但实际是不是内联不一定)
 
 
 什么情况下建议使用内联
 1. 函数代码比较少
 2. 函数调用频率高(函数调用 会入栈和出栈,频率高消耗栈空间)
 */


#include <iostream>
using namespace std;

// 内联函数
// (内联函数真实执行时,不再像普通函数调用需要开辟一段占空间,而是直接将函数体展开执行)
inline int sum(int a, int b){
    return  a + b;
}

// 内联函数
inline  void display(){
    cout << "display" << endl;
}

// 内联函数
//int main(){
//    display(); // 调用这个内联函数是, 相当于执行 'cout << "display" << endl;' 这一句
//
//    cout << sum(10, 29) << endl;
//
//    getchar();
//    return 0;
//}



/** 内联函数和宏定义的相同点和区别?
1. 内联函数和宏定义都可以减少 函数调用的开销(不存在函数调用的 入栈 和 出栈)
2. 内联函数相较于宏定义而言, 多了函数的语法特性(语法检查) 和函数特性, 而宏定义是直接替换
 */
inline int twice(int a){
    return a + a;
}
#define define_twice(a) ((a) + (a))

int main(){
    
    // 这个就是函数特性
    int b = 1;
    int c = twice(b++); // 相当于 twice(1); 结果是2 ,
    cout << "内联函数的 '函数特性' " << "c = " << c << endl;
    
    int de_b = 1;
    int de_c = define_twice(de_b++); // 相当于 ((de_b++) + (de_b++)) , 结果为3
    cout << "宏定义的 '直接替换' "<< "de_c = " << de_c << endl;
    
    
    getchar();
    return 0;
}



