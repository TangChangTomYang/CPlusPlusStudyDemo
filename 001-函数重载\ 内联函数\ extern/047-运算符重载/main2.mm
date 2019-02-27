#include<iostream>
using namespace std;


#include "Point.hpp" // 运算符重载


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
