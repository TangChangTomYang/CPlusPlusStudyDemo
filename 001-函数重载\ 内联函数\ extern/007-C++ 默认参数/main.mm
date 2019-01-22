//
//  main.m
//  007-C++ 默认参数
//
//  Created by yangrui on 2019/1/10.
//  Copyright © 2019年 yangrui. All rights reserved.
//


#include <iostream>
using namespace std;


void func(int a = 5){ // 默认参数10
    cout << a << endl;
}

// 默认参数,可能和函数重载 构成二义性  (错误写法, 和上面的默认参数构成二义性)
//void func(){
//    cout << "没有参数" << endl;
//}



// 默认参数注意点:
// 如果函数有多个参数, 其中有参数要设置默认参数, 只能从有道做
void display (int a, int b = 5){
    cout << "a =" << a << "b =" << b << endl;
}

// 默认参数只能从右到左 (错误写法)
//void display (int a = 3, int b = 5){
//    cout << "a =" << a << "b =" << b << endl;
//}

// 注意点: 如果函数有声明和实现,那么默认参数必须写在函数的声明文件中


//默认参数值 可以是常亮/ 全局符号(全局变量/ 函数名)

void display(){
    cout << "void display()" << endl;
}

void abc(){
    cout << "void abc()" << endl;
}


void read(int a, void(*func)() = display){
    cout << "a = " << a << endl;
    cout << "void read(int a, void(*func)())" << endl ;
    // 通过指向函数的指针, 调用函数
    func();
}

int main(){
    
    read(10,abc);
    read(20);
    
 
    cout << "\n\n\n" ;
    
    // 定义指向无参函数的指针
    void ( *p)() = display;
    // 通过指向函数的指针,调用函数
    p();
  
    // 定义指向有参函数的指针
    void (*dp)(int a, int b ) = display ;
    dp(2,4);
    
    
    getchar();
    return 0;
}
