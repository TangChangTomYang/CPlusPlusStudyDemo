
#include <iostream>
using namespace std;
//1:50

/**
 深拷贝: 有申请新的堆空间
 浅拷贝: 没有申请新的堆空间
 */

/** 拷贝构造函数 (copy Constructor)
 1> 拷贝构造函数是构造函数的一种
 2> 当利用已存在的对象,创建一个新的对象时(类似于拷贝), 就会调用新对象的拷贝构造函数进行初始化
 3> 拷贝构造函数的格式是固定的, 接收一个 const 引用作为参数
 */

class Car{
    int m_price;
public:
    // 构造函数
    Car(int price = 0) : m_price(price){
        
        cout << "Car(int price = 0) " << endl;
    }
    
    //拷贝构造函数, 接收一个 const 引用
//    Car(const Car &car){
//        cout << "Car(const Car &car)" << endl;
//        this->m_price = car.m_price;
//    }
//    拷贝构造函数也可以这样写, 和构造函数一样, 也是可以有初始化列表的
    Car(const Car &car):m_price(car.m_price){ // 其实像这种只包含基本数据类型的拷贝构造函数完全可以不写(默认系统也是这样实现的)
        cout << "Car(const Car &car)" << endl;
    }
    
    
    void display(){
        cout << "price:" << this -> m_price << endl;
        cout << "address: " << this << endl;
    }
};



class Person{
    int m_age;
public:
    int age(){
        return m_age;
    }
    
    // 构造函数
    Person(int age):m_age(age){
        
    }
    // 拷贝构造函数
    Person(const Person &pson):m_age(pson.m_age){
         cout << "Person(const Person &pson)" << endl;
    }
    
    ~Person(){
        cout << "~Person()" << endl;
    }
};

class Student : public Person{
    int m_score;
public:
    int score(){
        return m_score;
    }
    
    // 子类的构造函数, 只能在 初始化列表中调用父类的构造函数
    Student (int age, int score) : Person(age), m_score(score){
        
    }
    
    // 子类的 拷贝构造函数, 需要在 拷贝函数的初始化 列表中调用父类的拷贝构造函数
    Student(const Student &stu): Person(stu), m_score(stu.m_score){
        cout << "Student(const Student &stu)" << endl;
    }
    
    void display(){
        cout << this -> age() << "\n" << this->score() << endl;
    }
    
    ~Student(){
        cout << "~Student()" << endl;
    }
};
void testCar(){
    // 利用构造函数创建对象
    Car zCar1(20) ; // 栈对象
    zCar1.display();
    Car *dCar1 = new Car(10); // 堆对象
    dCar1->display();
    cout << endl;
    
    Car zcCar1 = Car(zCar1); // 栈拷贝
    zcCar1.display();
    Car *dcCar1 = new  Car(zCar1); // 堆拷贝
    dcCar1->display();
    cout << endl;
    
    Car zcCar11 = zCar1; // 栈拷贝 等价于  Car zcCar11 = Car(zCar1);
    zcCar11.display();
    
    // 注意下面这种写法不是拷贝, 是赋值
    Car zCar50(50);
    cout << "---zCar50----" << &zCar50 << endl;
    Car zcCar50;
    cout << "---zcCar50----" << &zcCar50 << endl;
    // 注意, 这里不是拷贝操作是赋值操作,是将zCar50 的空间赋值给zcCar50
    // 拷贝是利用一个已经存在的对象产生一个新对象, 而赋值不会产生新对象
    zcCar50 = zCar50;
    cout << "---zcCar50----" << &zcCar50 << endl;
    cout << endl;
    
    Car zcCar2 = Car(*dCar1); // 栈拷贝
    zcCar2.display();
    Car *dcCar2 = new Car(*dCar1); // 堆拷贝
    dcCar2->display();
}

void testStu(){
    Student stu(19,20);
    stu.display();
    
    Student stu2 = Student(stu);
    stu2.display();
}

void testStr(){
    
    // 字符串1
    char str1[] = {'b','m','w',0};
    cout << str1<< endl;
    cout << strlen(str1) << endl;
    
    
    // 在C 语言中是允许char *str2 = "audi"; 这样定义字符串的
    // 但是因为"audi" 是一个常亮, 在C++是不允许 char *str2 = "audi";, 必须在前面添加 const 修饰
    const char *str2 = "audi";
    cout << str2 << endl;
    cout << strlen(str2) << endl;
}


class Che{
    int m_price;
    // 一般来说, 对象内部牵扯到指针, 那么这个指针的地址最好指向堆空间, 这样比较安全
    // 如果一个对象内的指针, 指向的内存地址是栈空间, 那么很危险, 因为一旦栈空间 pop 后就回收了(野指针)
    char *m_name;
public:
    // 构造函数
    //1. 注意在定义 char * 的函数参数时,必须定义为 const char * , 因为 const char * 可以接收 char * 和 const char* (比如: "bmw")
    //2. Che(int price , const char *name ): m_price(price),m_name(name){ // 错误写法, 不能用一个const char* 初始化一个 char *
    //3. 定义const char *name 是为了接受const char*  和 char *
    Che(int price , const char *name = NULL ) : m_price(price){
        // 像字符串 char * 的成员变量, 一般在构造函数时, 参数设置为 const char *
        
        // 正确的写法
        if (name == NULL )  return;
        // 申请堆空间存储字符串
        this-> m_name = new char[strlen(name) + 1]{}; // {}的作用是初始化为 全0
        // 拷贝字符串内容
        strcpy(this-> m_name, name); // char *__dst 表示的是目标字符串,const char *__src 表示的是源字符串
        
        cout << " Che(int price , const char *name = NULL )" << endl;
    }
    
    // 拷贝构造函数
    Che(const Che &che):m_price(che.m_price){
        
        // 拷贝字符串
        if (che.m_name != NULL) {
            // 申请堆空间存储字符串
            this->m_name = new char[strlen(che.m_name) + 1]{}; //  {} 的作用是初始化为 0
            strcpy(this->m_name, che.m_name);
        }
    }
    
    // 析构函数
    ~Che(){
        
        // 释放堆空间, 要写严谨点
        if(this->m_name != NULL) {
            delete[] m_name; // 因为 new 的时候 char[] 有[], delete 时也要带[]
            m_name = NULL; // 清空指针, 方式释放后再次使用造成野指针
        }
        
        cout << "~Che()" << endl;
        
        
    }
};

int main( ) {
//    testCar();
//    testStu();
//    testStr();
    
//    Che *che = new Che(12, "bmw"); // 构造
//    delete che; // 析构
    
    {
     Student stu(10,20);
    }
    
    

    
    getchar();
    return 0;
}
