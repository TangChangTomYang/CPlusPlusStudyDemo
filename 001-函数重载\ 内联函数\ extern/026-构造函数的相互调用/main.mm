#include <iostream>
using namespace std;


// 在C++中 构造函数之间是不能互相调用的
// 在 函数中调用构造函数 会错误的生成 临时对象,而且不允许这样做
// 如果一个构造函数想要调用另一个构造函数, 只能在初始化列表中调用

struct Person{
    int m_age;
    double m_height;
    
    Person() : Person(0,0){  // 正确的写法
//        Person(0,0); 错误写法, 构造函数互相调用只能是 在初始化列表中调用
//        这种错误的写法会 产生一个临时的对象
    }
    
    Person(int age , double height ) : m_age(age), m_height(height){
    }
};




int main() {
    Person *p = new Person();
    delete p;
    
    getchar();
    return 0;
}
