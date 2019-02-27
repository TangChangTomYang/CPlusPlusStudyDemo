
#include <iostream>
using namespace std;


/** 调用父类的运算符重载函数
 
 */

class Person{
    int m_age;
public:
    Person(int age):m_age(age){
      cout << "Person构造: age: " << age  << endl ;
    }
    // 重载 对象的赋值 P1 = p2;
    Person &operator=(const Person &pson){
        this->m_age = pson.m_age;
        return *this;
    }
};

    
class Student : public Person{
    int m_score;
public:
    Student(int age, int score):Person(age), m_score(score){
        cout << "student构造: age: " << age << ", score:" << score << endl;
    }
    // 重载 对象的赋值 P1 = p2;
    Student &operator=(const Student &stu){
        // 子类的 运算符重载 要调用父类的运算符重载
        Person::operator=(stu);
        this->m_score = stu.m_score;
        return *this;
    }
};



int main( ) {
 
    Person p1(20);
    Person p2(30);
    p1 = p2;
    Student stu(18,99);
    
    getchar();
    return 0;
}
