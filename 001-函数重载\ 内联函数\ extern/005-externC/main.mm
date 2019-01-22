



#include <iostream>
using namespace std;


// 方式一:
// 如果需要某个函数按照C语言的方式编译,可以在函数的前天添加  'extern "C" ' 指定为C 语言的方式编译
// C 语言中是不允许函数重载的
// extern "C" void func(){
//    cout << "extern \"C\" void func()" << endl;
// }
//
// extern "C" void func(int a){
//    cout << "extern \"C\" void func()" << endl;
// }

extern "C" void display(int a , int b){ // 使用C语言的方式编译C++ 的代码
    cout << "a = " <<  a << ",b = " << b << endl;
}

// 方式二:
// 如果有一部分内容需要按照C 语言的方式编译, 那么可以使用 extern "C" 的花括号{}括起来
extern "C" { // 或括号{}内的代码都采用C++的方式编译
    
    void displayCPP(int a){
        cout << "displayCPP " << a << endl;
    }
    
    void displayC(int a){
        cout << "displayC " << a << endl;
    }
    
}

// 方式三: 如果申明和实现是分开的,那么 extern "C" , 只需写在声明的部分即可
// 声明
extern "C" { // 如果声明和实现是分开的,那么只需要 在声明部分用 extern "C" 说明
    int minus(int a, int b);
    int print(int b);
}
// 实现
int minus(int a, int b){
    cout << "minus(int a, int b)"<< a-b << endl;
    return a -b ;
}
int print(int b){
    cout << "int print(int b)" << b << endl;
    return b;
}

// C C++ 混编,需要使用extern "C" 说明那些是C语言环境API
extern "C"{  // 在C++ 文件中导入C语言文件,需要使用extern "C" 花括号{} 包裹,说明文件来源于C语言
    #include "Test_extern_C.h"
}

int main(){
    cout << "extern \"C\" " << endl;
    cout << testSum(2, 5) << endl;
}

