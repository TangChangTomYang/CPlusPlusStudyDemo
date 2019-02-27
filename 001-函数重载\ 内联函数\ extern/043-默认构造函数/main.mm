#include <iostream>
using namespace std;

/** 编译器自动生成的构造函数

 1. C++的编译器在某些特定的情况下, 会给类自动生成无参的构造函数,比如: (只要有下面任何一种情况默认编译器会自动生成无参构造函数)
 1> 成员变量在声明同时进行了初始化
 2> 有生成虚函数 virtual 函数
 3> 虚继承了其他类
 4> 包含了对象类型(指针类型不算)的成员, 且这个成员有构造函数(不论是编译器自动生成的还是重写的,凡是有就算)
 5> 父类有构造函数(不论是编译器自动生成的还是重写的,凡是有就算)
 
 结论:
 对象创建后,需要做一些额外的操作(比如:内存操作/ 函数调用), 编译器一般会自动为其生成无参的构造函数
 */




// 编译器不会为Animal类生成无参的构造函数
class Animal{
    int m_type;
};

// 编译器会为Person类, 自动生成无参的构造函数
class Person : public Animal{//1> 成员变量在声明同时进行了初始化
    int m_age = 0;
};
  
// 编译器会为Car类, 自动生成无参的构造函数
class Car{
    int m_price;
public:
    virtual void run(){ // 2> 有生成虚函数 virtual 函数(多态)
        
    }
};
    
// 编译器会为Student类, 自动生成无参的构造函数
class Student : virtual public Animal{//虚继承了其他类
    int m_score;
    
};
   
// 编译器 不会为Dog类, 自动生成无参的构造函数
class Dog : public Animal{
    int m_age;
};

// 编译器 不会为Girl类, 自动生成无参的构造函数
class Girl : public Animal{ // 编译器 不会为Girl类生成无参的构造函数
    Dog dog;
};
    
// 编译器会为Worker类, 自动生成无参的构造函数
class Worker : public Animal{ // 编译器会自动为Worker自动生成无参的构造函数, 因为有对象类型成员car,且car有构造函数
    Car car;
};
 
    

    
    
int main() {
   
    return 0;
}
