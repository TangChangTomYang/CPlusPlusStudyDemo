
#include <iostream>
using namespace std;



/** C++ 中的隐式构造
 在C++ 中, 某些情况下会调用单参数的构造函数.
 
 explicit 禁用隐士构造
 
 */
class Person{
    int m_age;
    int m_price;
public:
    Person(): m_age(0){
        cout << "Person()" << endl;
    }
    
    Person(int age, int price = 0) : m_age(age) , m_price(price){
        cout << "Person(int age)" << endl;
    }
    
    Person (const Person &pson): m_age(pson.m_age){
        cout << "Person (const Person &pson)" << endl;
    }
    
    ~Person(){
        cout << "~Person()" << endl;
    }
    
    void display(){
        cout << "age: " << m_age << ", Address: " << this << endl;
    }
};

void testPerson1(Person pson){
    pson.display();
}

Person testPerson2(){
    return 50;
}

class Car{
    char *m_name;
public:
    void setName(const char *name){
        
        this->m_name = new char[strlen(name) + 1]{};
        strcpy(this->m_name, name);
    }
    
    Car(){
        this->setName("default");
        cout << "Car()" << endl;
    }
    
    Car(const char *name){
        this->setName(name);
        cout << "Car(const char *name)" << endl;
    }
    
    Car(const Car &car){
        
        this->setName(car.m_name);
        cout << "Car(const Car &car)" << endl;
    }
    
    
    ~Car(){
        cout << "~Car()" << endl;
    }
    
    
    void display(){
        cout << "name: " << m_name << ", Address: " << this << endl;
    }
};

void testCar1(Car car){
    car.display();
}

Car testCar2(){
    return "现代";
}


class Student {
    int m_age ;
public:
    // 禁用隐士构造
    explicit Student (int age) : m_age(age){
        cout << "Student (int age)" << endl;
    }
};

int main() {
    { // 隐士构造 string
        
        Car car1 = "宝马"; // 会调用隐式构造
        car1.display();
        
        Car car2("奥迪");
        car2.display();
        car2 = "奥拓"; // 会调用隐式构造
        car2.display();
        
        testCar1("福特"); // 会调用隐式构造
        
        testCar2().display(); // 会调用隐式构造
    }
    
    cout << "================" << endl;
    { // 隐式构造 int
        
        Person pson = 20; //此处会调用隐式构造(单参数的构造函数); 相当于Person pson = Person(20);
        pson.display();
        
        
        Person ps(15);
        ps.display();
        ps = 30; // 此处会调用隐式构造(单参数的构造函数) 相当于ps = Person(30);, 注意,此处ps地址不会变,只是里面存的内容变了
        ps.display();
        
        testPerson1(40); // 此处会调用隐式构造(单参数的构造函数)
        
        testPerson2().display(); // 此处会调用隐式构造(单参数的构造函数)
    }
    
    Student stu(20);
//    Student stu2 = 30; 不允许隐士构造
    
    getchar();
    return 0;
}


