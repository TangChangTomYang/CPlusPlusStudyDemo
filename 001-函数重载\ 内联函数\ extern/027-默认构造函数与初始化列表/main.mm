

#include "Student.hpp"
#include <iostream>
using namespace std;


class Person {
    int m_age;
    double m_height;
public:
    // 构造函数,初始化列表和默认参数一起用, 达到多个函数重载的效果
    Person(int age = 0, double height = 1.1) : m_age(age), m_height(height){
        cout << "Person(int age = 0, double height = 1.1) : m_age(age), m_height(height)" << endl;
    }
};

int main() {
    // 构造函数初始化列表与默认参数,达到函数重载的效果
    Person *p1 = new Person();
    Person *p2 = new Person(1);
    Person *p3 = new Person(1,2.0);
    delete p1;
    delete p2;
    delete p3;
    
    using namespace YR ;
    Student *stu1 = new Student();
    Student *stu2 = new Student(10);
    Student *stu3 = new Student(10,30);
    
    delete stu1;
    delete stu2;
    delete stu3;
    
    getchar();
    return 0;
}
