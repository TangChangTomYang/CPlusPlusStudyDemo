
//C++ 中的输入输出
#include <iostream>
using namespace std;

void testOutput(){
    cout << "C++ 中使用 cout 做为函数输出,类似于C语言中的printf 或者 OC 中的NSLog" << endl;
    cout << "C++ 中, 要输出的内容必须和 '<<' 成对出现,且 '内容' 跟在 '<<' 后面 即可 " << endl;
    cout << "C++ 中要在输出换行是可以使用 '<< endl', 相当与 '\\n' , 只是 'endl' 不能字符串,仅仅表示换行而已" << endl;
    
}


void testInput(){
    cout << "C++ 中的 输入使用 cin ,类似C语言中的 scanf() ,getChar() 等 " << endl;
    cout << "输入的目标必须和 '>>' 成对出现" << endl ;
    cout << "输出的目标前面 不需要加 & , (C 语言中需要加&符号)"<< endl ;
    cout  << endl ;
    
    cout << "请输入一个数字:" << endl ;
    int aa;
    cin >> aa ;
    cout << "输入的aa 是: " << aa << endl ;
}

int main(){
    testOutput();
    testInput();
    
}

