
#include <iostream>
using namespace std;


/** 泛型, 是一种将类型参数化以达到代码复用的技术, C++ 中使用模板来实现泛型
 1> 模板的使用格式:
 template <typename T>
 或者
 template <class T>
 typename  和 class 是等价的
 
 2> 模板没有被使用, 是不会被实例化出来的
 3> 模板的声明和实现如果分离到 .cpp 和 .hpp中, 会导致连接错误.
 4> 解决函数摸吧 文件分离的办法, 就是把声明和实现 都写在 .hpp 文件中
 (一般来说, 我们的 .h 文件只能是声明不能包含实现.但是C++ 中的 .hpp 文件就可以既有声明又有实现, 也可以只有声明)
 
 */


// 使用template <class T>  来定义一个类型, 这个类型在具体 函数调用时在确定
// 泛型定义的数据类型可以是任何类型, 只要泛型函数内部不报错即可(比如: int double Person String 等等)
template <class T> void swapValues(T &v1, T &v2){
    T temp = v1;
    v1 = v2;
    v2 = temp;
}



int main( ) {
    
    
    int a = 10;
    int b = 20;
    swapValues<int>(a, b); // 说明在调用函数时, 实际是int数据类型的参数
    
    double c = 11.1;
    double d = 22.3;
    swapValues<double>(c, d);// 说明在调用函数时, 实际是double数据类型的参数
    
    float e = 1.1;
    float f = 2.3;
    swapValues (e, f);// 类型也可以省略, 系统会根据传入参数, 自动识别
    
    
    return 0;
}
