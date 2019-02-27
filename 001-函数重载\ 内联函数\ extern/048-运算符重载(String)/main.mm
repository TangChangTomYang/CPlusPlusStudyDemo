

#include <iostream>
using namespace std;


// 在C++中其实是由string类的, 只是string 的s 是小写的


// 模仿C++系统的string 写一个自己的String

class String{
    //  运算符重载String 的 <<
    friend ostream &operator<<(ostream &cout, const String &str);
    friend ostream &operator<<(ostream &cout, String *str);
    char *m_cstring;
public:
    
    
    
    // 构造函数
    String(const char *cstring){
        cout << "构造 String: " << cstring << endl;
        if(cstring == NULL) return;
        this->m_cstring = new char[strlen(cstring)+1]{};
        strcpy(this->m_cstring, cstring);
 
    }
    
    String(const String &str) : String(str.m_cstring){

    }
    
 
    
    //析构函数
    ~String(){
//        cout << "析构 String: " << this->m_cstring <<  endl;
        
//        if(this->m_cstring == NULL) return;
//        delete[] this->m_cstring;
//        this->m_cstring = NULL ;
        // 等价
        // *this = NULL;
        // 或者
        operator=(NULL);
    }
    
    
    // 重写赋值运算符 = String
    String &operator=(const String &str){
        
        //return  *this = str.m_cstring;
        // 或者
        //return this->operator=(str.m_cstring);
        //或者
        return operator=(str.m_cstring);
        
        
    }
    
    // 重写 赋值运算符 = "string"
    String &operator=(const char *cstring){
        
        // 避免出现 str = str; 这种错误 (指向同一个堆空间, 就直接返回)
        if(this->m_cstring == cstring) return *this;
        
        // 释放旧的 char *
        if(this->m_cstring){
            cout << "释放旧的char *: " << this->m_cstring << endl;
            delete[] this->m_cstring;
            this->m_cstring = NULL;
           
        }
        
        // 拷贝新的 char *
        if(cstring != NULL){
            cout << "拷贝新的char *: " << cstring << endl;
            this->m_cstring = new char[strlen(cstring) + 1]{};
            strcpy(this->m_cstring, cstring);
        }
        return *this;
    }
};

    
    
    
ostream &operator<<(ostream &cout, const String &str){
    if(str.m_cstring == NULL) return cout;
    return  cout << str.m_cstring ;
}

ostream &operator<<(ostream &cout, String *str){
     if(str->m_cstring == NULL) return cout;
    return  cout << str->m_cstring ;
}


int main( ) {
    
    {
        //隐士构造 会调用单参数构造函数
        String name1 = "zhangsan";
        
        // 这样做相当于String("lisi"), 系统会隐私构造(调用单参数构造函数)
        //"lisi" 堆空间会被重复释放2次, 造成错误
        name1 = "lisi";// 解决方案 重载 '='运算符,String &operator=(const char *cstring)


        cout << "---------" << endl;
        String name2 = "wangwu";
        // 必须重载, 如果不重载会导致 "wangwu" 堆空间重复释放2次
        name1 = name2;
        
         //需要重写 拷贝构造, 否则造成二次 释放堆空间
        String name3 = name1;
        
        
//        // 内存管理, 一个new 对应一个delete
//        String *account = new String("123456");
//        cout << account << endl;
//        delete  account;
        
    }
   
    
    getchar();
    return 0;
}
