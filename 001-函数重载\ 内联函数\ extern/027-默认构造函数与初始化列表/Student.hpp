//
//  Student.hpp
//  027-默认构造函数与初始化列表
//
//  Created by yangrui on 2019/1/22.
//  Copyright © 2019年 yangrui. All rights reserved.
//

#ifndef Student_hpp
#define Student_hpp

#include <stdio.h>

namespace YR  {
    class Student{
        int m_age;
        double m_height;
    public:
        Student(int age = 10, double height = 1.88); // 默认参数只能写在函数的声明
        
    };
}


#endif /* Student_hpp */
