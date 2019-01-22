

#include <iostream>
using namespace std;


/* 初始化列表
 1> 初始化列表是一种便捷的初始化成员变量的方式.
 2> 初始化列表只能用在构造函数中
 3> 初始化顺序, 只跟成员变量的声明顺序有关
 */

struct Person{
    
    int m_age;
    double m_height;
    
    // 构造函数一般写法
//    Person(int age, double height){
//        this -> m_age = age;
//        this -> m_height = height;
//    }
    
    
    //构造函数, 初始化列表写法
   
    Person (int age, double height) : m_age(age), m_height(height){ // ':'后面开始的就是初始化列表的写法
     
        //初始化列表中 m_age(age)的写法, 相当于this -> m_age = age;
        //初始化列表中 m_height(height)的写法, 相当于this -> m_height = height;
        
        /*
         初始化列表的理解, 当用户调用 Person(10,1.88) 构造函数时,相当于将参数 10传给age,将1.88传2给height
         系统在调用构造函数时,发现构造函数有初始化列表, 因此将 使用初始化列表来初始化对象,相当于 m_age(10), m_height(1.88)
         */
    }
    
    void display(){
        cout << "age is " << m_age << endl;
        cout << "height is " << m_height << endl;
    }
    
};



// 初始化列表,构造函数实际初始化流程
struct Student {
    int m_no;
    int m_age;
    
    Student(int no, int age) : m_no(20), m_age(15){
        
    }
    
    void display(){
        cout << "m_no is " << m_no << endl;
        cout << "m_age is " << m_age << endl;
    }
};


// 初始化列表可以 使用的参数值类型
//1> 构造函数的形参
//2> 全局的变量
//3> 函数调用
//3> 表达式

int g_age = 18;
struct GoodStudent {
    int m_no;
    int m_age;
    int m_money;
    int m_score;

    int getMoney(){
        return 10086;
    }
//
    GoodStudent(int no, int age, int money, int score) : m_no(no), m_age(g_age), m_money(getMoney()), m_score(10 +20) {

    }
//
//    void display(){
//        cout << "m_no is " << m_no << endl;
//        cout << "m_age is " << m_age << endl;
//        cout << "m_money is " << m_money << endl;
//        cout << "m_score is " << m_score << endl;
//    }
};

int main(){
    
    Person *p = new Person(10,1.88);
    p -> display();
    
    Student *stu = new Student(100, 300);
    stu -> display();
    // 打印结果为 20,15  . 而非100和300
    //分析:
    // 当调用构造函数Student(100, 300)后,形参no=100,实参age=300, 但是构造函数使用的是初始化列表,因此实际初始化时
    // 使用的是20和15, 结果为220,15, 实际的形参没用
    
    getchar();
    return 0;
    
}
