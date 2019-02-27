
#include <iostream>
using namespace std;


class Person {
public:
    static int ms_age;
};

int  Person::ms_age = 0;
class Student : public Person{
    
};


/** C++ 中的单例的使用
 1. 将 构造函数私有化, 不允许外部访问
 2. 定义一个 静态的 私有的 当前类指针
 3. 提供一个静态的成员函数公共的接口访问 这个静态的 私有的 当前类指针
 4. 如果有 销毁单例的要求, 需要再写一个 静态成员方法给外部访问 删除单例
 */
class TcpTool{

private:
    static TcpTool *ms_tool ; // 2. 定义一个私有的 静态的 当前类对象指针
public:
    static TcpTool *shareTool(){ // 提供对外的 当前类指针接口
        if (ms_tool == NULL ) {
            ms_tool = new  TcpTool();
        }
        return ms_tool;
    }
    
    static void removeshareTool(){ // 提供对外的 当前类指针接口
        if (ms_tool == NULL ) {
            return;
        }
        
        delete ms_tool;
        ms_tool = NULL;
    }
    TcpTool(){ //1. 构造函数私有化, 不允许外部访问
        cout << "TcpTool()" << endl;
    }
    
    ~TcpTool(){
        cout << "~TcpTool()" << endl;
    }
};
TcpTool *TcpTool::ms_tool = NULL ; // 静态成员初始化


int main( ) {
  
    cout << Person::ms_age << endl; //0
    
    Person pson;
    pson.ms_age = 10;
    cout << pson.ms_age << endl; //10
    
    Student stu;
    stu.ms_age = 20;
    cout << stu.ms_age << endl; // 20
    
    TcpTool *tool = TcpTool::shareTool();
    TcpTool::removeshareTool();
    TcpTool *tool2 = TcpTool::shareTool();
    TcpTool::removeshareTool();
    TcpTool *tool3 = TcpTool::shareTool();
    TcpTool::removeshareTool();
    TcpTool *tool4 = TcpTool::shareTool();
    TcpTool::removeshareTool();
    
    getchar();
    return 0;
}




