#include <iostream>
using namespace std;



/** C++ 中的单例的使用
 1. 将 构造函数私有化, 不允许外部访问
 2. 定义一个 静态的 私有的 当前类指针
 3. 提供一个静态的成员函数公共的接口访问 这个静态的 私有的 当前类指针
 4. 如果有 销毁单例的要求, 需要再写一个 静态成员方法给外部访问 删除单例
 */

/** 作为单例 需要禁止一些行为
 1> 构造函数 拷贝构造函数 需要私有化
 2> 拷贝行为
 3> 赋值行为
 4> 禁止 *tool1 = tool2;
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
    
    ~TcpTool(){
        cout << "析构 ~TcpTool()" << endl;
    }
private:
    //1. 构造函数私有化, 不允许外部访问
    TcpTool(){
        cout << "构造 TcpTool()" << endl;
    }
    //1. 拷贝构造函数私有化, 不允许外部访问
    TcpTool(const TcpTool &tool){
        cout << "拷贝构造 TcpTool()" << endl;
    }
    // *p = *p1;
    // 赋值运算私有化
    TcpTool &operator=(const TcpTool &tool){
        return *this ;
    }
};
TcpTool *TcpTool::ms_tool = NULL ; // 静态成员初始化

int main() {
    {
        TcpTool *tool = TcpTool::shareTool();
        
        // 禁用拷贝构造
//        TcpTool tool2(*tool);

        TcpTool *tool2 = TcpTool::shareTool();
        
        // *tool = *tool2;
        
        
        tool->removeshareTool();
        
        
    }
    
    
    getchar();
    return 0;
}
