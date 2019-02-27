
#include <iostream>
using namespace std;

/** 局部类

 1> 在一个函数内部定义的类称为局部类
 
 局部类的特点:
 1> 局部类的作用域仅限于函数体内部.
 2> 局部类的声明和实现不能分离
 3> 局部类的成员必须在局部类内部定义, 局部类里面不能定义 static 成员变量 (因为局部类声明与实现不允许分离)
 4> 局部类的成员函数不能直接访问函数的局部变量(static 变量除外)
 */

int g_age = 0;
// 虽然 局部类在函数体内定义, 但是 局部类与函数没人任何关系, 只是局部类只能在函数内不使用
// 虽然局部类在函数体内定义, 但是局部类除了访问权限与普通类不同, 其他的都一样
void test(){
    static int s_age2 = 0;
    int age3 = 0;
    
    class Point { //局部类, 只能使用这种 声明和实现一体式
        int m_x;
        int m_y;
    public:
        
        static void pointTest(){
            g_age = 10;
            s_age2 = 20;
            // age3 = 30; 不能访问
        }
        
    };
    
    Point::pointTest();
}



int main( ) {
    
    
    
    getchar();
    return 0;
}
