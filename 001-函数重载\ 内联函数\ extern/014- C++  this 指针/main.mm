
#include <iostream>
using namespace std;

/** this 指针
 1> this 指针是指向当前对象的指针
 
 2> 当对象调用成员函数的时候, 会自动传入当前对象的内存地址
 */


struct Person {
    int m_age;
    int m_no;
   
    void display(){
//        系统默认会传入this 指针, 和下面2句等价
        cout << "m_age = " <<  m_age  << endl;
        cout << "m_no = " <<  m_no << endl;
        
//        cout << "m_age = " << this -> m_age  << endl;
//        cout << "m_no = " << this -> m_no << endl;
    }
};




int main(){
    
    //1. 这样就 在栈空间 定义了一个 Person 类型的对象,
    //   在栈空间定义的对象/ 变量 当函数执行完毕后, 系统会自动回收栈空间的内存,程序员不需要关心回收
    //2. 以前我们在概念中,对象都是存储在堆空间的, 但是C++ 中的对象可以存在 栈空间中
    Person pson;
    pson.m_age = 20;
    pson.m_no = 20;
    pson.display();
    cout << sizeof(pson) << endl;
    
    getchar();
    return 0;
}

