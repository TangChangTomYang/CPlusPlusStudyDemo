//
//  main.m
//  002-C++ 程序的入口
//
//  Created by yangrui on 2019/1/10.
//  Copyright © 2019年 yangrui. All rights reserved.
//



/**java中的方法(函数)
1.在java中必须先有类, 再有方法, 方法必须写在类里面
2.java中 可以有多个 main 函数(比如: a类中一个mian 函数, b类中一个mian函数,C类 ...), 具体哪个main 函数作为程序的入口,在程序启动前选择即可

 package com.RG.test;
 public class test{
     public static  void main(string[] args){
 System.out.println("hello java");
     }
 }
 */



//C++ 中的程序如口
#include <iostream>
using namespace std;

void test(){
    cout << "C++ 中可以没有类" << endl;
    cout << "C++ 中函数可以直接写在类外面, 也可以写在类里面" << endl;
    cout << "C++ 中 有且只有一个main 函数作为程序的入口" << endl;
}

int main(){
    test();
}












