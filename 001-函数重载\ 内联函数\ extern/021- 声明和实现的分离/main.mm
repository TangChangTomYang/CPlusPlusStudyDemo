#include "People.hpp"
#include <iostream>
using namespace std;


int main() {
    {
        People *p = new People();
        p -> setAge(18);
        p -> setHeight(1.88);
        
        cout << "age:" << p -> age() << endl;
        cout << "height" << p -> height() << endl;
        
        delete p;
    }
    
    return 0;
}
