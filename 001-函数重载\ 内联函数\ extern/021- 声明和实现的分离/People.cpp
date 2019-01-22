//
//  People.cpp
//  021- 声明和实现的分离
//
//  Created by yangrui on 2019/1/19.
//  Copyright © 2019年 yangrui. All rights reserved.
//

#include "People.hpp"
#include <iostream>
using namespace std;


// .cpp 文件, 实现类的声明
People::People(){
    cout << "People::People()" << endl;
}
People::~People(){
    cout << "People::~People()" << endl;
}

int People::age(){
    cout << "int People::age()" << endl;
    return this -> m_age;
}
void People::setAge(int age){
    cout << "void People::setAge(int age)" << endl;
    this -> m_age = age;
}
double People::height(){
    cout << "double People::height()" << endl;
    return this -> m_height;
}
void People::setHeight(double height){
    cout << "void People::setHeight(double height)" << endl;
    this -> m_height = height;
}

