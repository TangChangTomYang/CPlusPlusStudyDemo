//
//  String.hpp
//  048-运算符重载(String)
//
//  Created by yangrui on 2019/2/18.
//  Copyright © 2019年 yangrui. All rights reserved.
//


// 关于无符号和有符号的一个问题
// 比如定义了一个变量 unsigned int num;
// 如果 用户在传参是 故意将一个 负数(比如: -100), 传过来, 此时的 num 不是0 而是 -100 转成的一个整数
// 因此在定义变量时, 如果希望
#ifndef String_hpp
#define String_hpp

#include <iostream>
using namespace std;

class String{
    friend ostream &operator<<(ostream &cout, const String &str);
    friend bool operator>(const char *cstring1, const String &str);
    // 这个是安全处理
    char *m_cstring = NULL; // Xcode C++ char* 成员变量有个特点, 默认会置为 "", 没搞懂
public:
    /******构造函数**********************************/
    String(const char *csting = "");
    /******拷贝构造函数**********************************/
    String(const String &str);
    /******析构函数**********************************/
    ~String();
    
    
    unsigned long length();
    
    /******运算符重载函数**********************************/
    // ="cstring" 运算符重载(避免产生 String str = "abc"; 时产生隐式构造)
    String &operator=(const char *cstring);
    // = String 运算符重载
    String &operator=(const String &str);
    
    // +"cstring" 运算符重载
    String operator+(const char *cstring);
    // +String 运算符重载
    String operator+(const String &str);
    
    // +="cstring" 运算符重载
    String &operator+=(const char *cstring);
    // +="String" 运算符重载
    String &operator+=(const String &str);
    // [] 运算符重载, str[1]
    char operator[](long index);
    // >"cstring" 运算符重载
    bool operator>(const char *cstring);
    // >"String" 运算符重载
    bool operator>(const String &str);
    
    
private:
    /******私有成员函数**********************************/
    String &assign(const char *cstring);
    char *join(const char *cstring1, const char *cstring2);
};

/******全局函数**********************************/
// 重载String 的 << 运算符
ostream &operator<<(ostream &cout, const String &str);
// 重载char* > String的 > 运算符
bool operator>(const char *cstring1, const String &str);
#endif /* String_hpp */
