
#include <iostream>
using namespace std;

/** 引用 类型成员变量
1. 可以在声明的时候直接初始化化
2. 也可以在初始化列表初始化
*/


class Person{
    int m_age;
    int &m_price = m_age; // 定义引用类型的成员变量时,直接初初始化
    int &m_height;
    
public:
    Person(int &age):m_height(age){ // 在构造函数的初始化列表中初始化 引用类型成员变量
        
    }
};

int main( ) {
  
    return 0;
}
