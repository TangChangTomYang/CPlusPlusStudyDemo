#include <iostream>
using namespace std;

/** 类型转换,一般有2种风格:
 
 1. C语言风格类型转换(2种), 一般用于基本数据类型
 (type)expression // C语言/ C++中都可以用
 type(expression) // C++ 中可以这样写
 

 2. C++风格类型转换(4种), 一般用于对象数据类型
 static_cast
 dynaminc_cast
 reinterpret_cast
 const_cast
 */


void  testCType(){ // 一般用于基本数据类型的转换
    int  a = 10;
    double b1 = (double)a; // C/ C++
    double b2 = double(a); // C++
}



class Person{
public:
    int m_age;
    Person(int  age):m_age(age){
        
    }
    virtual void run(){
        
    }
    
    ~Person(){}
};

class Student : public Person{
public:
    Student(int age): Person(age){
        
    }
};

class Car{
    virtual void run(){
        
    }
};


// const_cast 将const 强制转换陈 非 const
void testConstCast(){
    // const_cast, 将const的对象转换成非const 的对象
    const Person *p1 = new Person(10);
    // p1->m_age = 30; const 对象是不能被修改的
    cout << "p1->m_age: " << p1->m_age<< endl;
    
    // Person *p2 = p1;  非const 对象指针是不能直接指向 const 对象指针的
    Person *p2 = const_cast<Person *>(p1); // const_cast可以将const 强制转换成非const
    p2->m_age = 40;
    cout << "p2->m_age: " << p2->m_age<< endl;
    
    //(Person *)p1 与 const_cast<Person *>(p1) 等价, 只是看起来更专业些
    Person *p3 = (Person *)p1;
    p3->m_age = 50;
    cout << "p3->m_age: " << p3->m_age<< endl;
}




// 一般用于多态类型的转换, 有运行时安全监测
// dynamic_cast<Student *>(p1) 相较于 (Student *)p1 更安全, 不会出现野指针错误
// dynamic_cast<type >(expression); 中的对象,必须有多态, 否则不能使用 dynamic_cast 类型转换
void testDynamicCast(){
    
    Person *p1 = new Person(10);
    Person *p2 = new Student(20);
    
    Student *stu1 = dynamic_cast<Student *>(p1); // NULL
    Student *stu2 = dynamic_cast<Student *>(p2);
    Car *car = dynamic_cast<Car *>(p1); // NULL
}


// static_cast 和 dynamic_cast 差不多
// static_cast 内有dynamic_cast运行时动态检测, 数据不安全
// static 只能用于同一继承体系下的 转换
void testStaticcast(){
    
    Person *p1 = new Person(10);
    Person *p2 = new Student(20);
    
    Student *stu1 = static_cast<Student *>(p1); // 不安全
    Student *stu2 = static_cast<Student *>(p2);
//    Car *car = static_cast<Car *>(p1); // 只有同一继承体系才可以
    
    // 常用于基本数据类型的转换 和 非const 转成const
    int a = 0;
    double b = static_cast<double>(a);
    const Person *p3 = static_cast<Person *>(p1);
}

int main() {
    
    testConstCast();
    
    
    getchar();
    return 0;
}
