

#include <iostream>
using namespace std;


class Array{
    
    int m_size = 0; // 存储当前有几个成员
    int m_capacity = 0; // 标记当前数组的容量, 数组变大会扩容
    int *m_data = NULL;  // 指向数组的首地址 (m_data+index 偏移 得到元素的值)
    
public:
    Array(int capacity){
        if(capacity > 0){
            this->m_capacity = capacity;
            this->m_data = new int[capacity];
        }
    }
};



int main( ) {
    
    return 0;
}
