

#include <iostream>
using namespace std;


/** C++ 中数组的实现
 参数1:
 参数2:
 参数3:
 参数4:
 */
class Array{
    friend ostream &operator<<(ostream &cout ,const Array &array);
    int m_size = 0; // 存储当前有几个成员
    int m_capacity = 0; // 标记当前数组的容量, 数组变大会扩容
    int *m_data = NULL;  // 指向数组的首地址 (m_data+index 偏移 得到元素的值)
    
public:
    // 根据容量来申请数组
    Array(int capacity){
        if(capacity > 0){
            this->m_capacity = capacity;
            this->m_data = new int[capacity]{};
        }
    }
    
    ~Array(){
        if (this->m_data) {
            delete [] this->m_data;
            this->m_data = NULL ;
        }
    }
    
    
    void add(int value){
        
        if(this->m_size >= this->m_capacity ){
            // 扩容
            // ... ...
        }
        else{
            this->m_data[this->m_size] = value;
            this->m_size++;
        }
        
    }
    
    int get(int index){
        if (this->m_size > 0 &&  index >= 0  && index < this->m_size) {
            return this->m_data[index];
        }
        return 0;
    }
};


ostream &operator<<(ostream &cout ,const Array &array){
    cout << "[" ;
    for (int i = 0 ; i < array.m_size ; i ++){
        cout << array.m_data[i] ;
        if (i != array.m_size -1 && array.m_size > 1) {
            cout << ",";
        }
    }
   return  cout << "]" << endl;
}

int main( ) {
    
    
    Array arr(5);
    arr.add(1);
    arr.add(2);
    arr.add(3);
    
    cout << arr << endl;
    
    return 0;
}
