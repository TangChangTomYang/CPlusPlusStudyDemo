//
//  main.m
//  008-指向函数的指针
//
//  Created by yangrui on 2019/1/11.
//  Copyright © 2019年 yangrui. All rights reserved.
//


#include <iostream>
using namespace std;

void display(){
    cout << "void display()" << endl;
}

// 指向函数的指针作为函数的参数
void test(int a, void(*func)()){
    cout << "int test(int a, void(*func)())" << endl;
    cout << "a = " << a << endl;
    func();
}

int main(){
    
    // 调用带有指向函数指针的函数
    test(10, display);
    
    // 定义带有指向函数的指针 作为参数的 指向函数的指针
    void (*pp)(int a, void(*fun)()) = test;
    pp(30, display);
   
    
    getchar();
    return 0;
}




int sum(int a, int b = 20){ // 有一个默认参数
    cout << "a = " << a << endl;
    return a + b;
}

void display(){
    cout << "void display()" << endl;
}


// 指向函数的指针作为函数的参数
void test(int a, void(*func)()){
    cout << "int test(int a, void(*func)())" << endl;
    cout << "a = " << a << endl;
    func();
}

int main(){

    // 调用带有指向函数指针的函数
    test(10, display);

    void (*pp)(int a, void(*fun)()) = test;
    pp(30, display);

    // 定义指向有参函数的指针
    int (*psum)(int a, int b) = sum;
    // 调用指向有参函数的指针
    psum(15,40);

    // 定义指向无参函数的指针
    void (*pdis)() = display;
    // 调用指向无参函数的指针
    pdis();

    getchar();
    return 0;
}

