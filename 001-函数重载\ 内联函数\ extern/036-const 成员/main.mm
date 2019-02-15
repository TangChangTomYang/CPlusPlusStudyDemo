
#include <iostream>
using namespace std;

class Person{
public:
    // 常量(const)成员变量必须在类里面初始化, 可以在声明时直接赋值
    const int mc_age = 18;
    const int mc_sex;
    
    int m_count;
    
    Person():mc_sex(1){ //const 成员变量可以声明 和 初始化分离
    }
    
    Person(int count ):mc_sex(count){ //const 成员变量可以声明 和 初始化分离
    }
    
    // const 函数 和 非const 函数构成函数重载
    void test(){
        cout << "void test()" << endl;
    }
    
    void test() const{// const 函数, 常量函数
        cout << "void test() const" << endl;
        
        
        //this.m_count = 10; 错误的, 不能在常量函数内部修改当前类的成员变量, 但是可以访问
        //test2(); 错误的, 不能在 常量函数内部调用 非 const 函数
        
        
        cout << this->m_count << endl; // 在const 函数内虽然不能修改 非const 成员变量, 不能调用 非const成员函数, 但是可以访问非const 成员变量, 说明 const 函数内部是有 this 指针
        // 为什么,const 函数内部不能调用 非const函数, 是因为 怕 , 内部调用的 非const函数 修改 非const 成员变量
        
        this->test4(); // const函数内部 访问 const 函数
        this->test6(); // const函数内部 访问 静态函数
        
        // 总结
        // 在const 函数内部不能修改非 const 成员变量, 这时准则
        // 推导出, const 函数不能访问非const 函数 (因非 const 函数内部可以修改非const 成员变量)
        // const 函数,可以调用const 函数
        // const 函数,可以调用静态函数(因为静态函数,内部没有this ,不存在修改非const 成员变量 和调用非const 函数)
        
    }
    
    void test2(){ // 非const函数 内部可以 访问 const函数
        test4();
    }
    
    void test4() const {
        cout << "void test4() const" << endl;
    }
    
    static void test6(){
        cout << "static void test6()" << endl;
    }
    
//   static void test5() const { // const 函数不能使用 static 修饰
//    }
//
    
};


void testConstHanShu(){
    
    //当const 函数和非const 函数构成重载后
    //非const 调用成员函数 优先调用的是 非const 函数
    Person pson;
    pson.test();
    
    // const 对象, 优先调用const 函数
    const Person cPson;
    cPson.test();
}



class Bicycle{
public:
    int m_price;
//    static int ms_age; 静态成员变量必须在类外部初始化, 不占用对象内存
    const int mc_wheelCount = 4; // 常量成员变量, 占用对象内存, 且必须在类内部初识化
    
    
};


void testBicycle(){
    Bicycle bcycle;
    bcycle.m_price = 1000;
   // bcycle.mc_wheelCount = 2; 常量成员变量是不能被修改的
    cout << sizeof(Bicycle) << endl; //8
}


class Motorcycle{
    int m_price;
    // 类似于java 中的final
    // 静态常量 成员变量必须在定义的时候初始化
    static const int msc_wheelCount = 4; // 静态 常量 成员变量, 整个系统只有一份内存, 不占用对象内存
};

int main() {
  
    testConstHanShu();
    
    testBicycle(); // 8
    
    cout << sizeof(Motorcycle) << endl; // 4
    
    
    getchar();
    return 0;
}
