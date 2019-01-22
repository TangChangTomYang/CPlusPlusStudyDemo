
// 命名空间可以避免 命名冲突
#include <iostream>
using namespace std; // 表示从词句开始,后面没有明确说明的话,都使用 std 这个命名空间




// 使用情景1:
// 在不同的命令空间,定义相同名字的类
class Student { // 等价于 ::class Student, 默认情况下就是无名(::)命名空间
public:
    int m_age;
    
    Student(){
        cout << "std::Student()" << endl;
    }
};

namespace YR { // 定义一个叫 YR 的命名空间
    class Student {
    public:
        int m_height;
        Student(){
            cout << "YR::Student()" << endl;
        }
    };
}

int main( ) {
    
    // 使用的是 标准命名空间的Student 类
    Student *stu1 = new Student(); //::Student *stu1 = new ::Student(); (默认就是:: 无名命名空间)
    stu1 -> m_age = 10;
    
    
    // 指定 命名空间
    YR::Student *stu2 = new YR::Student();
    stu2 -> m_height = 1.88;
    
    getchar();
    return 0;
}
