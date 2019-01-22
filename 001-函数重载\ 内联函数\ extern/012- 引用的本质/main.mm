

#include <iostream>
using namespace std;

int main(){
    
    int age = 20;
    const int &rAge = age; // 虽然 rAge 是常引用不能修改, 但是 rAge 仍然指向 age, 如果 age 被改了,那么 rAge 也被改了
    age = 30;
    cout << "age = " << age  << endl;  // 结果30
    cout << "rAge = "<< rAge << endl;  // 结果30
    
    
    
    int age1 = 120;
    const long &rAge1 = age1; // 这里会产生一个临时变量,相当于 int temp = age1, const long &rAge = temp;
    age1 = 130;
    cout << "age1 = " << age1  << endl;  // 结果130
    cout << "rAge1 = "<< rAge1 << endl;  // 结果120
    
    getchar();
    return 0;
}
