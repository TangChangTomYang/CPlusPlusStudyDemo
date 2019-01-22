

#include <iostream>
using namespace std;

/**
 C++ 中的对象(数据结构)可以存在的位置分为3个
 1> 全局区
 2> 栈空间
 3> 堆空间
 
 其它,高级语言,比如 Objective-C  对象只能放堆空间.
 
 */

struct Person{
    int m_age;
    double m_height;
    
    Person(){
        cout << "Person()" << endl;
    }
    
    Person(int age, double height){
        m_age  = age;
        m_height = height;
        cout << "Person(int age, double height)" << endl;
    }
};

// 全局区 对象
Person g_pson; // 全局区的对象,会调用默认的构造函数, 等价于g_pson();
Person g_pson1(); // 这个 函数声明
Person g_pson2(18,1.67); // 全局区的对象,会调用有参的构造函数
int main (){
    
//    cout << "g_pson.m_age =" << g_pson2.m_age << endl;
//    cout << "g_pson.m_height =" << g_pson2.m_height << endl;
    
    // 栈空间1 对象
    Person ppson(); // 这个也是函数声明 
    Person pson;
    pson.m_age = 20;
    pson.m_height = 1.88;
    
    // 栈空间2 对象
    Person pson1(16,1.88);
    pson1.m_age = 20;
    pson1.m_height = 1.88;

    // 堆空间 对象
    // new Person(); 这部分返回的是一个地址,因此只能使用一个指针来存储
    Person *pson2 = new Person();
    pson2 -> m_age = 20;
    pson2 -> m_height = 1.33;
    delete pson2;

    // 堆空间的对象也可以这样来获取
    Person *pson3 = (Person *)malloc(sizeof(Person)); // c++ 中不推荐这样做, 不会调用默认构造函数
    pson3 -> m_age = 30;
    pson3 -> m_height = 1.43;
    free(pson3);
    
    
    getchar();
    return 0;
}
