//
//  Array.hpp
//  053-模板类
//
//  Created by yangrui on 2019/2/27.
//  Copyright © 2019年 yangrui. All rights reserved.
//

#ifndef Array_hpp
#define Array_hpp

#include <iostream>
using namespace  std;
/*
 使用类模板, 定义一个Array 数组, 用于存储各种数据*/

template <class Item>
class Array{
    int m_size;
    int m_capacity;
    Item *m_data = NULL;
public:
    Array(int capacity){
        if (capacity > 0) {
            this->m_data = new Item[capacity]{};
            this->m_capacity = capacity;
        }
    }
    
    ~Array(){
        if(this->m_data){
            delete[] this->m_data;
            this->m_data = NULL ;
        } 
    }
    
};

#endif /* Array_hpp */
