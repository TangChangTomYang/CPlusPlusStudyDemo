
#include <iostream>
using namespace std;


struct Person {
private:
    int m_age;
    
public:
    void setAge(int age){
        m_ge = age;
        // 也可以这样写(等价的)
//        this -> m_age = age;
    }
    
    int age(){
        return m_age;
        // 也可以这样写(等价的)
//        return this -> m_age;
    }
}

int main(){
    Person pson;
    pson.setAge(10);
    cout << pson.age() << endl;
    
    getchar();
    return 0;
}
