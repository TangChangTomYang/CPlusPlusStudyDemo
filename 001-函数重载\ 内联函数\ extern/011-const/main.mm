
#include <iostream>
using namespace std;

/** const
 
 1. const 常量是不能被修改的
 2. const 常量,在初识化时必须赋值
 3. const 常量 结构体/ 类/结构体指针/ 类指针 是不能被修改的, 其内部的成员变量也是不能被修改的
 4. const 常量, 只能调用const 函数和 static 函数 (因为const 函数和static 函数内部不允许修改成员变量)
 */

struct Student{
    int age;
    int weight;
};


// const 结构体
void test(){
//    Student stu1;
//    stu1.age = 20;
//
//    const stu3 = {23,50};
//    stu3.age = 10; // 常亮的结构体是不能被赋值的
//    stu3 = stu1;   // 常亮的结构体是不能被赋值的
}

// const 结构体体指针
void test2(){
    
//    Student  stu = {20, 30};
//    Student *pStu = &stu;
//    pStu -> age = 30;
//
//    const Student *pStu1 = &stu;
//    pStu1 -> age = 40; // 指向结构体的常量指针 不能被修改
}

//int main(){
//    //1. 常量是不能被修改的
////    const  int age = 10;
////    age = 20;
////
//    //2. 常亮在初始化的时候必须被赋值
////    const int weight ; // 必须初始化
////    weight =120;
//
//    test();
//    test2();
//
//
//    // 以下5个指针分别是什么含义?
//    int age = 10;
//    const int *p0 = &age; // *p0 不能改, po 可以改
//    int const *p1 = &age; // *p1 不能改, p1 可以改
//    int  * const p2 = &age; // p2 不能改, *p2 可以改
//    const int * const p3 = &age ; // *p3 不能改, p3 不能改
//    int const * const p4 = &age; // *p4 不能改, p4 不能改
//
//
//    // 结论 const 修饰的其右边的内容
//
//
//
//    // 常引用的特点
//    //1.不能修改引用指向的内容
//    int weight = 10;
//    int & const rWeight = weight; // 等价于int &rWeight = weight;
//    int const &rWeight2 = weight; // 类似于 int const *rWeight2 = &weight; , *rWeight2 内容不能改
//    rWeight = 30; // 常引用不能修改值
//
//    //2. 常引用可以指向常亮
////    int age = 10;
////    int &rAge = age;
////
////    int &rAge1 = 10;// 错误, 引用不能指向常亮.
////    int const &rAge2 = 20; // 常引用可以指向常亮
//
//    //3. 常医用可以指向表达式
////    int a = 10;
////    int b = 20;
////    int &rAge = a + b ; // 引用不能指向表达式
////    int const &rAge1 = a + b ;// 常引用可以指向表达式
//
//    //4.常引用可以指向不同的数据类型
////    int age = 20;
////    double &rAge = age; // 将4个字节的数据存按照8个字节来存储,还有4个字节是不确定的很危险,不允许
////    double const &rAge2 = age ; // 常引用可以存储不同的数据类型的值
////
////
//
//    return 0;
//}



// 引用作为参数时, const 引用参数可以接收const的实参和非const实现
// 引用作为参数时, 非const 引用作为参数时, 只能接收非const 实参
int sum(int &a, int &b){ // 只能接收 非const 的参数
    return a + b;
}

// 可以接收 const he 非 const 的参数
int sum1( const int &a, const int &b){
    return a + b;
}

int main (){
    
    int a = 10;
    int b = 20;
    sum(a, b); // 非const的引用参数, 只能接收非const 的实参
    
    const int a1 = 11;
    const int b1 = 22;
//    sum(a1, b1); //错误!!!  非const的引用参数, 只能接收非const 的实参
    sum1(a1, b1);  // const 的引用做为参数, 可以接收const的实参和非const的实参
    sum1(a,b);
    
    return 0;
}




// const 的引用作为函数参数可以和非const 的引用作为参数 构成重载

// 以下2个方法可以构成重载
void display(int  const &a ){
    cout << "void display(int  const &a )" << endl;
}

void display(int &a ){
    cout << "void display(int  const &a )" << endl;
}





// const char * 可以接收 const char * 和 非 const char *
// 在C++ 中,当一个函数接收一个字符串类型的参数时, 通常都是定义为 const char * , 这样可以接收所有的字符串
class CosntChar{
    char *m_name;
public:
    
    CosntChar(const char *name){
        if (name == NULL)  return;
        this->m_name = new char[strlen(name) + 1]{};
        strcpy(this->m_name, name);
    }
    
    void display(){
        cout << "name: " << this->m_name <<  endl;
    }
    
    static void testCosntChar(){
        // 在C++ 中 "zhangsan" 是常量, 只能使用cosnt char * 接收
        
        CosntChar constChar("zhangsan"); // 接收 字符串常量
        constChar.display();
        
        char name[] = {'b','m', 'w' ,'\0'};
        CosntChar constChar2(name); // 接收 非字符串常量
        constChar2.display();
    }
};




















