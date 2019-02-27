//
//  Point.hpp
//  047-运算符重载
//
//  Created by yangrui on 2019/2/18.
//  Copyright © 2019年 yangrui. All rights reserved.
//

#ifndef Point_hpp
#define Point_hpp


#include<iostream>
using namespace std;

/** 运算符重载 (operator overload)
 1> 运算符重载,是C++的一个特点, 很多语言都没有这个特性.
 2> C++里面有些运算符是不允许重载的
 */

// 类的声明
class Point{
    friend Point operator+(const Point &p1, const Point &p2); // p + p
    friend ostream &operator<<(ostream &cout, const Point p); // cout << p;
    friend istream operator<<(ostream cout, const Point p); // cin >>p;
    int m_x;
    int m_y;
public:
    Point(int x, int y) ;
    
    void display();
    // 重载 '+' 号 运算符
    Point operator+(const Point &p);
    
    // 重载 '+=' 号 运算符
    Point &operator+=(const Point &p);
    
    // 重载 -P
    Point operator-();
    
    // 重载 '++p' 号 运算符
    Point &operator++();
    
    // 重载 'p++' 号 运算符
    void  operator++(int );
    
};


/*******下面的是全局函数****************************************/
// Point p = p1 + p2; 我们要实现 '+' 号的运算符重载
Point operator+(const Point &p1, const Point &p2);

/** 重载 << 打印point
 cout 是 ostream 类型的一个对象 output stream
 */
ostream &operator<<(ostream &cout, const Point p);

/** 重载 >> 输入 point
 cin  是 istream 类型的一个对象 inout stream
 */
istream operator<<(ostream cout, const Point p);
#endif /* Point_hpp */
