

#include <iostream>
using namespace std;


/** 堆空间内存的分配和回收
(一一对应, 不要写错了)
 malloc --> free
 new --> delete
 new [] --> delete []
 */



// C++ / C 语言中通用的做法
// 向堆空间申请的内存, 有申请就要 释放
void test (){
    // 向堆空间申请(分配)4字节的空间
    int *p = (int *)malloc(4);
    *p = 20; //给堆空间分配的内存赋值
    cout << *p << endl;
    // 释放 堆空间分配的数据
    free(p);
}



//C++ 特有的做法
void test2(){
    int *p = new int ; // 在占空间分配一个 int 的空间\
    
    int *pArr = new int[10]; // 申请10个连续的int 空间
    
    delete p; // 使用完毕, 释放申请的占空间
    
    delete[] pArr; // 在释放时一定要在delete 后加 []
    
}


int main(){
    // C++/C
    test();
    //C++ 
    test2();
    return 0;
}
