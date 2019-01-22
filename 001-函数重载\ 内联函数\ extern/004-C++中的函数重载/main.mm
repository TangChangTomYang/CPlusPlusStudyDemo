

#include <iostream> //C++ 中导入标准的输入输出流头文件
using namespace std; // 使用标准的命名空间





/** C++ 中的函数重载
 
 1. 在C++ 中是函数名相同, 函数参数个数不同/ 参数类型不同/ 参数顺序不同, 在C++就构成函数重载
 2. 仅仅是函数的返回值类型不同, 不能构成函数重载,有 '二义性', 编译器在变以前不知道要调用哪个函数
 3. 函数参数的 隐士转换可能 引起函数重载的 '二义性'
 4. C++ 中函数的重载使用的是一种 name manging 技术, 就是函数名修饰
 */

//下面4个 函数 构成重载
int sum(int a, int b){
    cout << "int sum(int a, int b)" << endl ;
    
    return a + b;
}

int sum(int a, int b, int c){
    cout << "int sum(int a, int b, int c)" << endl ;
    
    return a + b + b;
}

int sum(double a, int b){
    cout << "int sum(double a, int b)" << endl ;
    
    return a + b;
}

int sum(int  a, double b){
    cout << "int sum(int  a, double b)" << endl ;
    
    return a + b;
}


// 下面2个函数构成函数重载, 但是函数调用参数的隐试 转换 可能引发 函数重载的 '二义性'
void display(long a){
    
    cout << "void display(long a):" << a << endl ;
}


void display(double a){
    
    cout << "void display(double a):" << a << endl ;
}


/** 仅函数返回值类型不同, 不能构成函数重载
 int minus(double a, double b){
 
 return  (int)(a - b);
 }
 
 double minus(double a, double b){
 
 return  (int)(a - b);
 }
 */


/** 函数重载的实现技术
 int sum(int a, int b);
 int sum(double a, int b);
 
 name manging 技术, 上面2个函数,重载后,系统编译的结果可能是
 sum_int_int; 和 sum_double_int;
 */


int main(){
    
    // 这4个函数构成函数重载
//    cout << sum(10, 20) << endl ;
//    cout << sum(5, 7, 8) << endl ;
//    cout << sum(10.1, 2) << endl ;
//    cout << sum(2, 3,5) << endl ;
    
    // 函数参数隐士转换 造成函数重载的二义性
//    display(10); // 系统不知道 10 -> 是转换成double 呢, 还是转换成 long
    
    
    
    return 0;
}
