
#include <iostream>
using namespace std;

/** 仿函数
 1> 将一个对象当作一个函数一样来使用
 2> 仿函数,相较于一般的函数, 多了状态的控制
 */

int sum(int a, int b){
    return  a + b;
}

class Sum{
    int m_age;
public:
    Sum(int age = 0) : m_age(age){}
    // 运算符重载 () 括号
    int operator()(int a, int b){
        cout << "---------" << endl;
        if(this->m_age < 18){ // 方函数的特点就 是带状态的函数, 根据不同的状态 执行 运算符函数
            return a + b;
        }
        return (a + b) * 22;
    }
};

int main( ) {
    cout << sum(10, 20) << endl; // 函数调用
    
    Sum sum;
    cout << sum(20,30) << endl;  //仿函数, 看起来像是函数调用, 其实是对象的 方法调用
    getchar();
    return 0;
}
