

#include <iostream>
using namespace std;

/*
在子类中访问父类成员,取以下2项权限中最下的那个一种权限

- 成员本身的访问权限(成员在父类中的访问权限,公开/ 保护/ 私有)
- 子类继承父类的权限方式(公开/ 保护/ 私有)

如下示例:
 */


struct Person{
public: // 这个就是成员本身的访问权限
    int m_age;
protected:// 这个就是成员本身的访问权限
    double m_height;
private: // 这个就是成员本身的访问权限
    int m_sex;
};

struct Student : protected Person{ // 这个就是子类,继承的权限
    int m_no;
    void study(){
        m_no = 10;
        m_age = 15;
        m_height = 1.88;
        //m_sex = 0; 这个属性访问不了 (private + protected = private)
    }
};

struct GoodStudent : private Student{
    int m_money;
    void doWork(){
        { // 这些属性都访问不了 (private + any = private)
            // m_no = 10;
            //m_age = 15;
            //m_height = 1.88;
            //m_sex = 0;
        }
        m_money = 100;
        cout << "void doWork()"<< endl;
    }
};


//在开发中用的最多的继承方式是 **public**(默认就是), 这样能最大程度地保留父类原来的成员访问权限
