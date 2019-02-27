#include <iostream>
using namespace std;

/** 内部类(在Java里面也有内部类)
 如果将类A 定义在类C 的内部, 那么类A 就是一个内部类(嵌套类)
 
 
 内部类(嵌套类)特点:
 1> 内部类(嵌套类)支持 public/ private/ protected 访问权限的限制
 2> 内部类(嵌套类)的成员函数可以直接访问其外部类对象的所有成员(有点像友元的意思)
 3> 内部类(嵌套类)的成员函数里面可以直接不带类名/ 对象名访问其外部类的 static 成员
 4> 内部类(嵌套类)不会影响外部类的内存的布局
 5> 可以在外部里面声明内部类(嵌套类), 在外部类外面进行定义实现
 
 说明:
 内部类和普通的类是一样的只是访问权限不一样而已, 每次在构建外部类的对象时,内存只会和外部类相关, 与内部类没有半毛钱关系
 */

 //内部类
class Person{
    char *m_name = (char *)"zhangsan";
    static int m_age;

public: // 内部类, 支持public/ protected/ private 权限
    void display(){
        cout << "name: " << m_name << endl;
    }
    
    static void staticDispla(){
        cout << "static staticDispla()" << endl;
    }

public:
    void face_Display(Person &pson){
        display(); // 内部类的成员函数,可以直接访问外部类的成员方法
        cout << "Person Name: " <<  m_name << endl;// 内部类的成员函数,可以直接访问外部类的成员属性
        staticDispla(); // 内部类的成员函数,可以直接访问外部类的 静态方法
        m_age = 25; // 内部类的成员函数,可以直接访问外部类的 静态属性
    };

private:
    class Leg{
        int m_count;
    };
};

int Person::m_age = 18;



class Cat{
    int m_age;
public:
    class Leg{
    public:
        int m_count;
        Leg():m_count(10){
            
        }
        void display(){
            cout << m_count << endl;
        }
    };
};


// 内部类 声明和实现分离

// 情景1
class Point{
    class Math{
        void test();
    };
};
void Point::Math::test(){
    cout << "void Point::Math::test()" << endl;
}

// 情景2
class Point2{
    class Math2;
};

class Point2::Math2{
    void test(){
        cout << "void Point2::Math2::test()"<< endl;
    }
};


// 情景3
class Point3 {
    class Math3;
};

class Point3::Math3{
    void test();
};

void Point3::Math3::test(){
    cout << "void Point3::Math3::test()" << endl;
}



int main( ) {
    
    Cat::Leg *lg = new Cat::Leg();
    
    lg->display();
    
    getchar();
    return 0;
}
