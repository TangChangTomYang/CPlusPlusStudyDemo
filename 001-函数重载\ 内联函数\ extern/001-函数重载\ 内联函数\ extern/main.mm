//
//  main.m
//  001-函数重载\ 内联函数\ extern
//
//  Created by yangrui on 2019/1/9.
//  Copyright © 2019年 yangrui. All rights reserved.
//


#include <iostream>
using namespace std;

//C++  中的输出
void testOutput(){
    cout << "C++ 中的输出使用 cout, 要输出的内容, 比须和 << 成对出现" << endl;
    cout << "输出" << endl << "le" ;
}


void testInput(){
    
    int a ;
    cin >> a; // C++ 中的输入,是不需要像C语言中在变量前面加 & 符号的
    cout << "a = " << a << endl;
}


//C++ 中的函数重载(overload)
//1.  C++ 中的函数重载, 主要指的是 函数名相同, 参数的个数不同/ 参数类型不同/ 参数的顺序不同
//2.  在C++ 中仅仅是 函数返回值不同是不允许函数重载的(不构成函数重载)

// 以下几个函数都构成函数重载
int sum(int a, int b){
    cout << "int sum(int a, int b)" << endl;
    return a +b;
}

int sum(double a, int b){ // 参数类型不同构成重载
    cout << "int sum(double a, int b)" << endl;
    return a +b;
}

int sum( int b,double a){ // 参数顺序不同构成重载
    cout << "int sum( int b,double a)" << endl;
    return a +b;
}

int sum(int a, int b, int c){ //参数个数不同构成重载
    cout << "int sum(int a, int b, int c)" << endl;
    return a +b;
}

// 在C++ 中仅函数返回值不同,是不构成函数重载的, 函数重载,必选在调用函数前 去掉 二意性
//int testOverload(){
//    cout << "int testOverload" << endl;
//    return 10;
//}
//
//void testOverload(){
//     cout << "void testOverload" << endl;
//}

// 函数调用参数的隐式转换, 可能导致,函数重载二义性.( overloadBug(10); 系统编译报错)
int overloadBug(double a){
    cout << "int overloadBug(double a)" << endl;
    return a;
}

long overloadBug(long a){
    cout << "int overloadBug(long a)" << endl;
    return a;
}




int main() {

    
    //C++ 函数重载, 参数隐士转换可能导致 函数重载的二义性
    //    overloadBug(10);
    return 0;
}

// C++ 输出
//    testOutput();
// C++输入
//    testInput();

//// C++ 函数重载
//cout << sum(10, 10) << endl;
//cout << sum(10.5, 11) << endl;
//cout << sum(11, 12.5) << endl;
//cout << sum(3, 4, 5) << endl;

// 仅仅是函数返回值类型不同, 是不能构成函数重载的
//    testOverLoad();
//    testOverload();




// C++  是完全兼容C 语言的, 在很久以前C++ 叫做C with classes
