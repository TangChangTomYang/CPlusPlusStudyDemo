
#include <iostream>
using namespace std;

class Cls{
    static int ms_age;
};




class Car{

public:  // 静态成员可以使用 public/ protected/ privated 修饰访问权限
    static int m_price; // 静态成员变量
    int m_wheelCout; // 非静态成员变量
    
public: // 静态成员可以使用 public/ protected/ privated 修饰访问权限
   static void run(){ // 静态成员函数
       cout << "static void run()" << endl;
    }
    
    void display(){ // 非静态成员函数
        cout << "void display()" << endl;
    }
    
};

// 必须在类外面初始化,静态成员变量
int  Car::m_price = 20;


/**
 1. 为什么静态成员变量 在使用前必须初始化呢?
因为, 静态成员变量和全局变量类似, 都是在数据段(全局区), 整个程序运行过程中只有一份. 如果不初始化就使用, 那么当其他地方访问静态成员变量的时候,取出的数据 不确定,很危险
 
 2. 为什么,静态成员变量不能在类内部初始化, 必须在类外面初始化呢?
 1> 因为静态成员变量可以被多种方式访问(通过对象 对象的指针 类名), 且静态成员变量在整个程序的运行过程中只有一份, 如果我们在类里或者类的成员函数里初始化类的静态成员变量, 那么将会出现严重的问题, 比如: 当a 正在访问静态成员变量, b 在成员方法里把静态成员变量初始化了, 那 a 访问的数据就变了,这样程序的数据就乱了, ggl
 
 */


int g_age; // 全局变量, 编译器默认会在前面添加 static  修饰, 相当于 static int g_age;
void test(){ // 全局函数,编译器默认会在前面添加 static  修饰
    
}


//静态成员变量的使用场景
class Person{
private:
    static int m_PersonCount; // 统计现有有多少人
    
public:
    
    static int currentPersonCount(){
        return m_PersonCount;
    }
    
    Person(){ // 统计当前有多少人,出生一个就多一个
        m_PersonCount ++;
    }
    
    ~Person(){ // 死亡一个就少一个
        m_PersonCount --;
    }
    
};
int Person::m_PersonCount = 0 ;

int main( ) {
  
    
    cout << sizeof(Cls) << endl;
    
    Person pson1;
    Person *pson2 = new Person();
    cout << "当前有: "<< Person::currentPersonCount() <<"人" << endl;
    
    
    //1. 通过对象访问 静态成员变量
    Car car1;
    car1.m_price = 30;
    cout << "car1.m_price: " <<  car1.m_price << endl;
    
    //2. 通过对象指针,访问静态成员
    Car *car2 = new Car();
    car2->m_price = 40;
    cout << "car2->m_price: " <<  car2->m_price << endl;
    
    //3. 通过类名访问 静态成员变量
    Car::m_price = 50;
    cout << "Car::m_price: " <<  Car::m_price << endl;
    
    /** 打印结果
     car1.m_price: 30
     car2->m_price: 40
     Car::m_price: 50
     */
    
    
    getchar();
    return 0;
}



