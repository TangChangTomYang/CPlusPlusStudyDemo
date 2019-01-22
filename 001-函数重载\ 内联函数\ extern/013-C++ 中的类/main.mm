
#include <iostream>
using namespace std;

/** C++ 中的类
1. C++ 中可以使用 struct/ class 来定义类
2. struct 和 class的区别?
1> 在C++ 中Struct 和 class 的用法是一样的, 只是在 struct 中, 默认的 成员权限是 public, 而在class 中默认的成员权限是private
 
 */



struct Person {
 
    // 成员变量
    int age;
    // 成员函数
    // 函数不占用对象空间,函数在另外一个地方存储着
    void run(){
        cout << "run() age is " << age << endl;
    }
};


class Student{
public:
    int age;
    int no;
    
    void doHomeWork(){
        cout << "do home work" << "age:" << age << endl;
    }
};

int main(){
    
    //1. 这样就 在栈空间 定义了一个 Person 类型的对象,
    //   在栈空间定义的对象/ 变量 当函数执行完毕后, 系统会自动回收栈空间的内存,程序员不需要关心回收
    //2. 以前我们在概念中,对象都是存储在堆空间的, 但是C++ 中的对象可以存在 栈空间中
    Person pson;
    pson.age = 20;
    pson.run();
    cout << sizeof(pson) << endl;
    
    
    Student stu;
    stu.age = 10;
    stu.no = 10;
    stu.doHomeWork();
    
    
    // 通过指针访问 对象
    Student *stu1 = &stu;
    stu1 -> age = 20;
    stu1 -> doHomeWork();
    
    getchar();
    return 0;
}
