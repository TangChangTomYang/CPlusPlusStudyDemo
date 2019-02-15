

#include  <iostream>
using  namespace std;

class  Person {
    int m_age;
public:
    virtual void run(){
        cout << "void Person::run()" << endl;
    }
    
    // 定义了选函数的类,必须将析构函数定义为, 虚析构函数
    virtual ~Person(){
        cout << "Person::~Person()" << endl;
    }
};


class Student : public Person{
    int m_no;
public:
    void run(){
        cout << "void Student::run()" << endl;
    }
    Student (){
        // 子类调用父类的方法
        // 在java 和 OC 等其他语言中是通过 super 在子类中调用父类的方法的, 但是在C++中是没有这样的说法的
        // C++中调用 父类的方法,是通过 域 运算符 (xxx:: )来说明调用父类的方法的
        Person::Person(); // 子类调用父类的方法
        cout << "Student::Student ()" << endl;
        
    }
};

int main( ) {
    
    Student *stu = new Student();
    stu->run();  // 子类调用子类的方法
    stu-> Person::run(); // 子类调用父类的方法
    /** 执行结果
     Person::~Person() // 先调用父类的构造函数
     Student::Student () // 再调用, 子类的构造函数
     */
    
    getchar();
    return 0;
}
