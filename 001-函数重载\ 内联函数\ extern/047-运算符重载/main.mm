#include<iostream>
using namespace std;


#include "Point.hpp"

/** 运算符重载 (operator overload)
 1> 运算符重载,是C++的一个特点, 很多语言都没有这个特性.
 2> C++里面有些运算符是不允许重载的,如下:
    - 对象成员访问运算符: '.'
    - 域运算符: '::'
    - 三目运算符: '?:'
    - sizeof
 3> 有些运算符只能重载为成员函数,比如:
     - 赋值运算符: '='
     - 下标运算符: '[]'
     - 函数运算符: '()'
     - 指针访问运算符: '->'
 */

class Point{
    friend Point operator+(const Point &p1, const Point &p2); // p + p
    friend ostream &operator<<(ostream &cout, const Point p); // cout << p;
    int m_x;
    int m_y;
public:
    Point(int x, int y) : m_x(x), m_y(y){

    }

    void display(){
        cout <<"(x = " << m_x << ",y = " << m_y << ")" << endl;
    }
    // 重载 '+' 号 运算符
    Point operator+(const Point &p){ // 等价于 Point operator+(const Point &p1, const Point &p2)
        this->m_x += p.m_x;
        this->m_y += p.m_y;
        return Point(this->m_x, this->m_y);
    } // Point p = p1 + p2;


    // 重载 '+=' 号 运算符
    Point &operator+=(const Point &p){
        this->m_x += p.m_x;
        this->m_y += p.m_y;
        return *this; // 返回的是引用, 避免产生临时中间对象
    }// (p1 += p2) = p3



    // 重载 -P
    Point operator-(){
        return Point(-(this->m_x), -(this->m_y));
    } // Point p = -p1

    // 重载 '++p' 号 运算符
    Point &operator++(){
        this->m_x += 1;
        this->m_y += 1;
        return *this; // 返回的是引用, 避免产生临时中间对象
    }

    // 重载 'p++' 号 运算符
    void  operator++(int ){ // int 是语法糖固定写法
        this->m_x += 1;
        this->m_y += 1;

    }

};

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

// 如果函数的参数是一个对象类型, 那么最好定义为 const 引用, 因为const 引用可以接收const 和 非const 的实参, 且不会产生一个临时的中间变量.

int main() {
    
    Point p1(10,10);
    Point p2(20,20);
 
    Point p3 = p1 + p2; // 等价于 operator+(p1,p2);
    p3.display();
    
    
    Point p4(40,40);
    (++p4).display(); // 前++ 运算符重载

    Point p5(50,50);
    (p5++);
    p5.display();
    
    
    cout << p5 << endl;
    getchar();
    return 0;
}
