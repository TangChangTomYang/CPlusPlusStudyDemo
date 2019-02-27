

#include <iostream>
using namespace std;
#include "String.hpp"



int main( ) {
    {
   
        String str1 = "abc"; // 隐士构造
        String str2 = "bcd";
        String str3 = str1 + str2;
        
        
        cout << ("123" > String("124")) << endl;
        cout << (String("123") > String("124")) << endl;
        cout << (String("123") > "124") << endl;
        
        getchar();
    }
    

//    
    getchar();
    return 0;
    
    
    {
        //隐士构造 会调用单参数构造函数
        String name1 = "zhangsan";
        
        //拷贝构造, 需要重写,否则造成二次 释放堆空间
        String name2 = name1;
        
        //重载字符串,赋值运算符, 否则堆空间会被重复释放2次
        name2 = "lisi";
 
        String name3 = "wangwu";
        // 重写String 赋值运算符 =, 否则造成 name2 堆空间2次释放
        name3 = name2;
        
        
        cout << name3 << endl;
        
        cout << name1 <<  "\n" << name2 << endl;
        // 内存管理, 一个new 对应一个delete
        String *account = new String("123456");
        cout << account << endl;
        delete  account;
        
    }
   
    
    getchar();
    return 0;
}
