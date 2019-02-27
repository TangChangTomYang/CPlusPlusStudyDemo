



/** const 成员函数
 1. const 关键放在函数参数列表的最后面的函数是 const 函数,
 如: void test() const{
    cout << "const 成员函数" << endl;
 }
 2. const 函数内部只能通过this指针访问成员变量, 不能修改成员变量(static 成员变量除外)
 3. const 函数内部不能调用 非const函数, 只能调用static 函数和 const 函数
 4. const 函数和非const 函数构成函数重载, 且const对象只能调用const 函数和静态函数,  非const对象可以调用 非const函数/ const函数 和 静态函数
 
 
 
 */



#include <iostream>
using namespace std;

//const 成员函数
class Person {
    int m_age;
    static int age;
    
public:
    Person():m_age(1){
        
    }
    void display(){ // 非const 函数
        cout << "age: " << m_age << endl;
    }
    
    void test(){  // 非const 函数
        cout << "void test()" << endl;
    }
    
    void  test() const{ // const 函数
        
        //1. const 函数内部可以访问成员变量
        cout << "m_age: " << this->m_age << endl;
        //2. const 函数内部不能修改成员变量
        //this->m_age = 10;
        //3. const 函数内部可以访问和修改静态成员变量
        this->age = 3;
        
        //4. const 函数内部只能访问const函数, 不能访问非const 函数
        test2();
        //5. const 函数内部可以访问 静态函数
        staticTest();
    }
    void  test2() const{
        cout << "void  test() const" << endl;
    }
    
    static void staticTest(){
        cout << "static staticTest()" << endl;
    }
};

int Person::age = 2;
int main(){
   
    // 非const 对象
    Person p;
    p.display(); // 非const 对象访问非const 函数
    p.test() ;    // 非const 对象优先访问非const 对象
    p.test2(); // 非const 对象访问 const函数
    
    // const 对象
    const Person cp ;
    cp.test2(); // const 对象访问const 函数
    cp.staticTest(); // const 对象访问静态函数
    
    getchar();
    return 0;
}
