
#include <iostream>
using namespace std;

/** 对象类型的函数参数 和 函数的返回值

 1> 在C++ 中, 使用对象类型作为函数参数 或者 使用对象类型作为函数返回值, 可能造成不必要的中间对象
 2> 如果在C++ 中使用 对象作为函数的参数 或是使用对象作为函数的返回值, 系统没有调用拷贝构造函数产生中间的临时对象,
 那么可能是新的编译器做了优化, 我们可以关闭这个优化
 settings -> compiler -> compiler flag -> other flag -> 写入“-fno-elide-constructors”
 
 关于第一点的补充:
 当传入函数的对象是匿名对象或者函数返回的是一个匿名对象时将不会产生临时的中间对象
 */


class Car{
    int m_price;
public:
    // 构造函数
    Car(int price = 0) : m_price(price){
        cout << "构造 Car , price:" << m_price << "---address: " << this << endl;
    }
    
    // 拷贝构造
    Car (const Car &car) : m_price(car.m_price){
        cout << "拷贝构造 Car , price:" << m_price << "---address: " << this << endl;
    }
    
    // 析构函数
    ~Car(){
        cout << "析构 ~Car Address: " << this << endl;
    }
    
};


// 对象作为函数参数, 产生 中间对象实例
// 相当于 void test(Car car = car), 这里就是拷贝.
// 或者 相当于 void test(Car car = Car(car))
void test(Car car){
    cout << "测试 car" << endl;
}

// 中间对象解决方案, 不要直接使用对象作为函数参数, 而是使用对象的指针或者是对象的引用
void test_p(Car *car){
    cout << "测试 *car" << endl;
}
void test_yy(Car &car){
    cout << "测试 &car" << endl;
}

void test_cs(){
    {
        Car myCar(10);
        test(myCar); // 会产生中间对象
    }
    cout << "----以下是解决方案-------" << endl;
    {
        Car myCar2(20);
        test_p(&myCar2); //对象指针 不会产生中间对象
        test_yy(myCar2); //对象引用 不会产生中间对象
    }
}


// 对象作为函数的返回值, 产生中间对象的示例
Car testCar(){
    Car car(20);
    return car;
}




int main() {
//    test_cs();
    

    // 对象返回值 产生中间对像
    cout <<" ======" << endl;
    {
     Car myCar1 = testCar(); //产生中间对象
    }
    
    cout << "-----------"<< endl;
    {
        Car myCar2;
        myCar2 = testCar(); //产生中间对象
    }
   
    
    
    getchar();
    return 0;
}
