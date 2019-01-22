//
//  Student.cpp
//  027-默认构造函数与初始化列表
//
//  Created by yangrui on 2019/1/22.
//  Copyright © 2019年 yangrui. All rights reserved.
//

#include "Student.hpp"
#include <iostream>
using namespace std;

namespace YR  {
    // 初始化列表只能写在函数的实现部分
    Student::Student(int age , double height ) : m_age(age), m_height(height){
        
    }
}

