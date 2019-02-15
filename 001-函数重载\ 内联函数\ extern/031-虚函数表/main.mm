
#include <iostream>
using namespace std;

struct Person{
    int m_age;
    virtual void run(){
        cout << "void Person::run()" << endl;
    }
};


struct Student :Person{
    int m_age;
private:
    void run(){
       cout << "void Student::run()" << endl;
    }
};

struct GoodStudent : Student{
    int m_age;
private:
    void run(){
        cout << "void GoodStudent::run()" << endl;
    }
};

int main( ) {
    
    // 定义了 虚函数的类的对象, 其对象的前4(或者8)个字节存储的是虚表的地址, 也就是说
    // 定义了虚函数的对象,其大小会比无虚函数的对象大4(或者8)个字节
    
    // 凡事,定义过虚函数的类, 其对象里面都会存储一张虚表
    // 相同类型的对象使用的是同一张虚表, 不同类型的对象存储的是不同的虚表
    // 不管子类有没有重写父类的虚函数, 子类的虚表和父类的虚表都不是同一张表, 只是如果子类没有重写父类的虚函数的话, 子类的虚表内容和父类的虚表内容是一样的而已,但是绝对不是同一张表
    cout << sizeof(Person) << endl;
    cout << sizeof(Student) << endl;
    
    
    // 多态, 父类指针执行子类对象,
    Person *pson1 = new Person;
    pson1->run();
    
    Person *pson2 = new Student() ;
    pson2->run();
    
    Person *pson3 = new GoodStudent() ;
    pson3->run();
    
    getchar();
    
    return 0;
}
