

#include <iostream>
using namespace std;

/*
C++ 中 struct / class 定义类时权限的说明
*/
//**1、class 关键字定义的类:**
//1> class 定义的类, 成员变量的默认访问权限是private
//2> class 定义的类, 默认的继承方式也是private
//如下:

struct Person{
    
};


class Student : Person{
};

//等价于
//class Student : private Person{
//private:
//
//};


//**2、struct 关键字定义的类:**
//1> struct 定义的类, 成员变量的默认访问权限是public
//2> struct 定义的类, 默认的继承方式也是public
//如下:

struct Student : Person{
};
//等价于
//struct Student : public Person{
//public:
//};

