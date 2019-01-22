

#include <iostream>
using namespace std;

/**
构造函数啊(也叫构造器), 在对象创建的时候自动调用, 一般用于完成对象的初始化的工作
 
 特点:
 1> 构造函数与类名相同, 无返回值(void 都不能写),;
 2> 构造函数可以有参数
 3> 构造函数可以重载
 4> 可以有过个构造函数
 
 5> 一旦自定义了构造函数,必须使用其中的一个构造函数来初始化对象
 */

struct Person{
    int m_age;
    double m_height;
    
    //构造函数 必须与类名相同,没有返回值
    Person(int age, double height){
         m_age = age;
         m_height = height;
         cout << "Person(int age, double height)" << endl;
    }
};


int main (){
    
    // 一旦自定义了构造函数, 就必须使用自定义的构造函数初始化对象
//    Person pson1; // 错误, 没有使用自定义构造函数初始化对象
    
    
    Person pson2(19,1.75);  // 使用自定义构造函数初始化对象 ok
    Person *pson3 = new  Person(18,1.75);
    delete pson3;
    
    // malloc 不会调用构造函数
    Person *pson4 = (Person *)malloc(sizeof(Person));
    free(pson4);
    
    getchar();
    return 0;
}
