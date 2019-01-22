

#include <iostream>
using namespace std;


struct Car {
    double m_price;
    Car(){
        cout << "Car()" << endl;
    }
    ~Car(){
        cout << "~Car()" << endl;
    }
};

struct Person {
    int m_age;
    double m_height;
    
    // 构造函数
    Person(){
        cout << "构造函数 Person()" << endl;
    }
    
    // 析构函数
    // 析构函数不存在函数重载, 也不存在调用, 会被系统自动调用
    ~Person(){
        cout << "析构函数 ~Person() " << endl;
    }
};

class Student{
    int m_age;
    double m_height;
    Car *m_car;
    
    
public: // Class 定义的类, 构造函数和析构函数 必须定义为 Public
    // 构造函数
    Student(){
        cout << "Student()" << endl;
        this -> m_car = new  Car();
    }
    
    // 析构函数,
    // 析构函数是用来回收Student对象内部申请的堆空间对象,比如: this -> m_car = new Car();
    ~Student(){
        cout << "~Student()"<< endl;
        delete  this -> m_car ;
    }
};


int main(){
    
    {
        Person pson;
    }
    
    Person *p = new Person();
    delete p;
    
    Student *stu = new Student();
    delete stu;
    
    getchar();
    return 0;
}
