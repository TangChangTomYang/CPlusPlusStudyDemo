


#include <iostream>
using namespace std;



// 指针
void testPointer(){
    
    int age = 10;
    int *pAge = &age;
    cout << "age = " << age << endl;
    cout << "*pAge = " << *pAge << endl;
    
    cout << "================" << endl;
    
    *pAge = 20; // 等价于 age = 220
    cout << "age = " << age << endl;
    cout << "*pAge = " << *pAge << endl;
}








// 引用
/** 引用
 1. 引用相当于是变量的别名(基本数据类型/ 枚举/ 结构体/ 类/ 指针/ 数组等 都可以有引用 )
 别名(可以理解为 给引用赋值 就和原来变量赋值是一样的)
 
 2. 对引用做计算,其实就是对引用指向的变量做计算
 
 3. 引用在定义的时候就必须初始化,一旦引用指向了某个变量就不能改变了, 引用从一而中
 int age = 10;
 int weight = 120;
 int &rAge1 = age;
 int &rAge2 ;  //(错误写法) 引用在定义时必须初始化
 &rAge = &weight; // (错误写法) 一旦引用定义了就不能在指向其它变量了
 
 4. 可以利用引用初始化另外一个引用, 相当于是原来的变量有多个别名
 int age = 10;
 int &rAge1 = age;
 int &rAge2 = rAge1;  // 相当于 int &rAge2 = age
 
 5. 不存在 引用的引用
 int age = 10;
 int *p = &age;  // 指针
 int **PP = &p;  // 指向指针的指针
 int &rAge1 = age;    // 引用
 int &&rAge2 = rAge1; //(错误写法) 没有引用的引用
 
 6. 不存在指向引用的指针
 int age = 10;
 int &rAge = age;
 int *p = &age; // 指向 int 的指针
 int *pp = &rAge; //(相当于 int *pp = &age; ) 指向 int 的指针
 int &*pp = &rAge; //(错误写法)不存在指向引用的指针
 
 7. 不存在引用数组
 int age  = 10;
 int array1[4] = {1,2};
 int *array2[4]; // 指针数组
 int &array[4];  // 不存在引用数组
 
 
 8. 引用的价值, 比指针更安全, 函数的返回值可以被赋值
 
 // 这种写法没意义
 int &func1(){
    int a = 10; // 这种局部变量是没价值的
    return a;
 }
 
 func() = 20;
 
 int age = 10;
 int &func2(){
    // 比如, 这里对age 做了很多操作
    return age;
 }
 func() = 30;
 
 
  8. 引用的价值, 交换2个整数的值, 更简单
 // 交换a b 的值
 // 方式一, 使用指针交换2个数
 void swapInt(int *a,int *b){
 int *temp = a;
 a = b;
 b = temp;
 }
 // 方式二, 使用引用交换2个值
 void swapInt2(int &a, int &b){
 int temp = a;
 a = b ;
 b = temp;
 }

 
 
 引用
 
 '&' 在定义引用变量的时候 '&' 表示的是引用, 在其它时候 '&'表示的是 '取地址'
 */
void jiShuJuLeiXingYinYong (){
    
    int weight = 120;
    // 定义一个引用, rWeight 就是一个引用
    int &rWeight = weight; // 引用就相当于是 原来变量的一个别名
    
    
    cout << "变量weight 的地址" << &weight << endl;
    cout << "引用rWeight 内的值" << &rWeight << endl;
    
    rWeight = 130;
    cout << weight << endl;
}


enum Season{
    Spring,
    Summer,
    Fall,
    Winter
};

// 枚举 引用
void meijuYinYong(){
    Season season = Winter;
    Season &rSeason = season;
    
    cout << season << endl;
    cout << "季节: " << rSeason << endl;
}


// 结构体的引用

struct Student{
    int age;
    int weight;
};

// 结构体引用
void  jieGouTiYinYong(){
    
    Student stu;
    Student &rStu = stu;
    
    rStu.age = 18;
    cout << "stu.age = " << stu.age << endl;
}

// 指针引用
void zhiZhenYinYong(){
    int a = 10;
    int b = 20;
    int *p = &a;
    int *rP = p;
    
    cout << "a = " <<  a << ", *p = " << *p << ", *rP = " << *rP << endl;
    
    rP = &b; // 修改 rP 就相当于是修改 p 的值
    cout << "a = " <<  a << ", *p = " << *p << ", *rP = " << *rP << endl;
    
}

// 指向数组的指针 和 指针数组
int *a[4] ; // 指针数组, 数组里面可以放4个(int)指针
int (*b)[4]; // 指向数组的指针, 数组里面可以放4个(int)


//数组 的 引用
void shuZuYinYong(){
    int array[] = {1,2,3};
    // 错误写法 (是不存在引用数组这种说法的, 数组里面是不能放引用的)
//    int &rArray[] = array;
    
    int (&rArray)[3] = array;
    
    for (int i = 0 ; i < 3 ; i++){
        cout << "array[" << i << "]= " << array[i] << endl;
        cout << "rArray[" << i << "]= " << rArray[i] << endl;
    }
    
}


// 这种写法没意义
int &func1(){
    int a = 10; // 这种局部变量是没价值的
    return a;
}

int age = 10;
int &func2(){
    // 比如, 这里对age 做了很多操作
    return age;
}


// 引用作为函数的参数和函数的返回值的价值
// 参考040-对象类型参数和返回值-中间对象
//settings -> compiler -> compiler flag -> other flag -> 写入“-fno-elide-constructors”

class BigMan{
    int  m_age;
public:
    BigMan(int age):m_age(age){
        cout << "构造:BigMan(int age):" << this << endl;
    }
    
    BigMan(const BigMan &bigMan): m_age(bigMan.m_age){
         cout << "拷贝构造:BigMan(int age):" << this << endl;
    }
    
    ~BigMan(){
        cout << "~BigMan()" << endl;
    }
}

void  testBigMan(BigMan bigMan){//  对象类型 作为函数参数, 产生临时中间对象
}
BigMan createBigMan(){ // 返回对象类型 产生临时中间对象
    BigMan bgman(20);
    return bgman;
}

void  testBigMan2(BigMan &bigMan){ // 引用避免临时中间对象产生
}
BigMan &createBigMan(){// 引用避免临时中间对象产生
    BigMan bgman(20);
    return bgman;
}


// 引用的价值之一, 函数返回引用类型
class Point{
    int m_x;
    int m_y;
public:
    Point(int x, int y):m_x(x), m_y(y){
        
    }
    
    void display(){
        cout << "(x= " << this->m_x << ", y= " << this->m_y << ")" << endl;
    }
    
    // 运算符 重载 ++a
    Point &operator++(){
        this->m_x += 1;
        this->m_y += 1;
        return *this;
    }
    
    
    Point operator+(Point p){
        this->m_x += p.m_x;
        this->m_y += p.m_y;
        return  Point(this->m_x, this->m_y);
        
    }
    
    
    // 测试引用的价值
    static void test(){
        Point p(10,20);
        p.display();
        
        (++p).display();
        
        (++p + Point(20,30)).display();
        
    }
};


int main(){
    func1() = 20;
    func2() = 30;
    
    // 指针
    testPointer();
    
    // 基本数据类型 引用
    jiShuJuLeiXingYinYong();
    
    // 枚举类型的引用
    meijuYinYong();
    
    // 结构体引用
    jieGouTiYinYong();
    
    // 指针引用
    zhiZhenYinYong();
    
    // 数组的引用
    shuZuYinYong();
    
    
    
    // 测试引用的价值
    Point::test(){
        
    
    getchar();
    return 0;
}
