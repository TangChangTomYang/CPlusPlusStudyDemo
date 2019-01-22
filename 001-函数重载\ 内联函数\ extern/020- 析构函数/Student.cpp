
#include <iostream>
using namespace std;

/* 类的声明和实现分离
 
 */

// 类的声明和实现
//方式1:
//使用域(::)来实现类已经声明的接口函数


/*********以下是类的声明部分*****************************************/
class Student{
    int m_age;
    double m_height;
public:
    // 声明构造函数和析构函数
    Student();
    ~Student();
    
    // 声明 对外的属性接口
    int age();
    void setAge(int age);
    double height();
    void setHeight(double height);
};


/*********以下是类的实现部分*****************************************/
// 类分离和实现分开时, 域(::)直接写在析构函数和构造函数的前面做限定即可
Student::Student(){
    cout << "Student :: Student()" << endl;
}

Student::~Student(){
    cout << "Student :: ~Student()" << endl;
}


// 类分离和实现分开是, 域(::) 需要写在函数返回值的类型后面,在类提供的接口函数名前面做限定
int  Student::age(){
    return this -> m_age;
}

void Student::setAge(int age){
    this -> m_age = age;
}

double Student::height(){
    return this -> m_height;
}

void Student::setHeight(double height){
    this -> m_height = height;
}
