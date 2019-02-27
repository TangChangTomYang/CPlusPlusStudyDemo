//
//  Point.cpp
//  047-运算符重载
//
//  Created by yangrui on 2019/2/18.
//  Copyright © 2019年 yangrui. All rights reserved.
//

#include "Point.hpp"
 
/** 运算符重载 (operator overload)
 1> 运算符重载,是C++的一个特点, 很多语言都没有这个特性.
 2> C++里面有些运算符是不允许重载的
 */


Point::Point(int x, int y) : m_x(x), m_y(y){}
    
void Point::display(){
    cout <<"(x = " << m_x << ",y = " << m_y << ")" << endl;
}
// 重载 '+' 号 运算符
Point Point::operator+(const Point &p){ // 等价于 Point operator+(const Point &p1, const Point &p2)
    this->m_x += p.m_x;
    this->m_y += p.m_y;
    return Point(this->m_x, this->m_y);
} // Point p = p1 + p2;


// 重载 '+=' 号 运算符
Point &Point::operator+=(const Point &p){
    this->m_x += p.m_x;
    this->m_y += p.m_y;
    return *this; // 返回的是引用, 避免产生临时中间对象
}// (p1 += p2) = p3



// 重载 -P
Point Point::operator-(){
    return Point(-(this->m_x), -(this->m_y));
} // Point p = -p1

// 重载 '++p' 号 运算符
Point &Point::operator++(){
    this->m_x += 1;
    this->m_y += 1;
    return *this; // 返回的是引用, 避免产生临时中间对象
}

// 重载 'p++' 号 运算符
void  Point::operator++(int ){ // int 是语法糖固定写法
    this->m_x += 1;
    this->m_y += 1;
    
}


/*******下面的是全局函数****************************************/
// Point p = p1 + p2; 我们要实现 '+' 号的运算符重载
Point operator+(const Point &p1, const Point &p2){ // 为了便于操作, 我们将这个方法定义为 Point 的友元函数
    
    return  Point(p1.m_x + p2.m_x, p1.m_y + p2.m_y); // 返回匿名对象, 避免中间对象的产生
}


/** 重载 << 打印point
 cout 是 ostream 类型的一个对象
 */
ostream &operator<<(ostream &cout, const Point p){ // 将这个重载运算符函数定义为Point的友元函数
    return  cout <<"(x = " << p.m_x << ",y = " << p.m_y << ")" << endl;
}


/** 重载 >> 输入 point
 cin  是 istream 类型的一个对象 inout stream
 */
istream operator<<(ostream cout, const Point p){
    return  cin >> p.m_x >> p.m_y;
}
