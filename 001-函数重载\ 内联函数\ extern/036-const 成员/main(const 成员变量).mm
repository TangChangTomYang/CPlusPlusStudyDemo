


/** const 成员变量
 
1、被const 修饰的 成员变量 和 非静态成员函数(static 函数), 我们就称之为 const 成员(const 成员函数 和 const 成员函数)
 
2、const 成员变量(2种)
 1> 一种是 静态的const 成员变量(eg: static const int msc_age)
 2> 另一种是非静态成const 成员变量(eg: const int mc_height)
 
3、const 成员变量的初始化
 1> 静态const成员变量(eg: static const int msc_age), 因为整个程序只有一个,因此必须在类外边初始化
 2> 非静态 const成员可以在声明变量时初始化, 也可以在构造函数内初始化, 反正必须在类内部初始化
 */



#include <iostream>
using namespace std;

//非静态 const成员 和 静态const成员 的初始化
class Person {
    const int mc_height = 18;
    const int mc_age;
    static const int msc_sex;
    
public:
    Person():mc_age(1){
        
    }
    void display(){
        cout << "age: " << mc_age << ", height: " << mc_height << ", sex: " << msc_sex<< endl;
    }
    
    void test(){
        cout << "void test()" << endl;
    }
    
    void  test() const{
        cout << "void  test() const" << endl;
    }
};
const int Person::msc_sex = 1;


int main(){
    Person p; // 千万不要写成Person p();  ,这个是函数声明
    p.display();
    p.test();
   
    getchar();
    return 0;
}
