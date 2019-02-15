#include <iostream>
using namespace std;

#include "TestCString.h"

class Car {
    int m_price;
    const char *m_name;
public:
    
    // 这个构造函数, 貌似没有问题, 其实问题大了去了
    Car (int price,const char *name ) : m_price(price),m_name(name) {
        
    }
    
    void display(){
        cout << "price:" <<  m_price << "\n" << "name: " << m_name << endl;
    }
};

int main() {
    
    char name[] = {'B','M','W','\0'};
    
    Car *myCar = new Car(100, name);
    myCar->display();
    // 这个代码从语法角度 和 运行情况来看,貌似没有问题, 其实问题大了去了
    // 主要问题如下:
    // 1> name 指向的是一个栈空间的字符数组(字符串), 一旦函数或作用于结束,栈空间自动回收
    // 2> myCar 指向的是一个堆空间, 堆空间不会自动回收, 需要程序员手动回收
    // 3> 堆空间的对象myCar 的成员变量m_name指向的是一个栈空间
    // 4> 后果栈空间(name)先释放, 堆空间(myCar)后释,  通过堆空间(myCar)的成员变量去访问已经释放的栈空间容易造成野指针
    getchar();
    return 0;
}


//int main() {
//    testCString();
//
//    getchar();
//    return 0;
//}

