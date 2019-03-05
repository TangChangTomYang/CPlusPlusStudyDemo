#include <iostream>
using namespace std;


class Person{
    int m_age;
public:
    void run(){
        cout << "void Person::run()" << endl;
    }
};
//**********C++11 新特性**************************
//auto/ decltype/ nullptr/ 快速遍历/ 更加简洁的数组初始化
//**********C++11 新特性**************************



/** auto 关键字
 1. auto 关键字定义变量, 可以从初始化表达式中推断出变量的数据类型, 大大的简化了编程的工作量
 (所有的数据类型都支持: 基本数据类型/ 对象类型/ 指针类型/ 指向函数的指针 等等)
 2. auto 推导数据类型, 属于编译器特性, 不影响最终的机器码质量, 不影响运行效率
 */
void autoDemo(){
    auto i = 10; // int
    auto str = "C++"; // const char *
    auto p = new Person(); // Person *
    p->run();
}


/** decltype  (解密的意思)
可以获取变量的数据类型
 */
void decltypeDemo(){
    int a = 10;
    
    decltype(a) b = 20;
    cout << "a: " << a << ",b: " << b << endl;
    
    // 自动获取变量的类型为 Person *
    auto p = new Person();
    decltype(p) pson = new Person();
    pson->run();
}


/** nullper 空指针(相当于 NULL)
 nullptr 可以用来解决 NULL 的二义性问题
 */
void func(int  a){
    cout << "void func(int " << a << ")"<< endl;
}

void func(int  *p){
    cout << "void func(int *" << p << ")"<< endl;
}
// nullptr 专门用于清空指针 (替代NULL)
// 可以解决 NULL带来的二义性(NULL == 0)问题
void nullptrDemo(){
    
    func(0);
    func(nullptr); // 等价于 int *p = null, 是一个空指针
    //func(NULL);  // 系统不知道是调用哪一个, 有二义性
    
    if (NULL == 0) {
        cout << "NULL == 0, 即NULL完全等价于0" << endl;
    }
}

// 快速遍历新特性
void kuaiSuBianliDemo(){
    int arr[] = {1,2,3,4,5,6,7};
    for (int  item : arr){ // 快速遍历使用的是 : 冒号, 而不是 in 关键字
        cout << "item: "  << item << endl;
    }
    
    // 更加简洁的初始化
    int arr2[]{11,12,3,14,15,16,17}; // 快速初始化, 可以省略 赋值运算符 '='
    for (int item : arr2){
       cout << "---item: "  << item << endl;
    }
}


int main() {
    autoDemo();
    decltypeDemo();
    
    nullptrDemo();
    
    kuaiSuBianliDemo();
    
    
   
    getchar();
    return 0;
}
