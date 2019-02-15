




#include <iostream>
using namespace std;


namespace test1 { // 多态测试1
    
    class Animal {
        int m_age;
    public:
        void  run(){
            cout << "void  Animal::run()"<< endl;
        }
    };
    
    class Cat : public Animal {
        int m_life;
    public:
        void  run(){
            cout << "void  Cat::run()"<< endl;
        }
    };
    
    class Dog : public Animal {
    public:
        void  run(){
            cout << "void  Dog::run()"<< endl;
        }
    };
    
    
    
    void liu(Animal *animal){
        animal -> run(); // 不论,animal 指向的真实对象类型是什么, 都只会调用 Animal 的 run 方法
    }
    
}





void testDemo1()  {
    using namespace test1;
    
    Animal *animal = new Animal();
    Cat *cat  = new Cat();
    Dog *dog = new Dog();
    
    // 我们想要的是 ,传入什么参数, 就调用对应动物的 run 方法, 想要达到多态的效果
    liu(animal);
    liu(cat);
    liu(dog);
    
    delete  animal;
    delete cat;
    delete dog;
    
    /*
     打印结果: 失望了
     void  Animal::run()
     void  Animal::run()
     void  Animal::run()
     */
    
}

void testDemo2(){
    
    using namespace test1;
    // 为什么会这样呢,没有多态的效果呢? 我们来验证一下
    
    cout <<"--------realCat----------------------------" << endl;
    Cat *realCat = new Cat();
    realCat -> run();
    
    cout <<"--------testAnimal----------------------------" << endl;
    Animal *testAnimal  = (Animal  *)realCat;
    testAnimal -> run();
    
    cout <<"--------testCat----------------------------" << endl;
    Cat *testCat = (Cat  *)realCat;
    testCat -> run();
    cout <<"--------testDog----------------------------" << endl;
    Dog *testDog = (Dog  *)realCat;
    testDog -> run();
    
    
    
    /* 打印结果:
     --------realCat----------------------------
     void  Cat::run()
     --------testAnimal----------------------------
     void  Animal::run()
     --------testCat----------------------------
     void  Cat::run()
     --------testDog----------------------------
     void  Dog::run()*/
    
    // 经过测试验证, 我们发现如下的结论,
    // 1> 默认情况下 函数的调用 与 调用它的指针类型直接相关的,
    // 指针是什么类型, 就会去调用对应类的 对应方法, 而和对象真实类型无关
    // 这个结论就乱套了
    // 其实, C++ 就是这样的,C++ 是静态语言, 怎么写,就怎么调用,写了就定了(编译时就定死了). Objective-c  是动态语言, 在执行的时候才会决定怎么做
    
    
    }


/*
 什么是多态?
 
 1. C++ 默认情况下,编译器只会根据指针的类型调用对应的函数, 不存在多态,
 1> 其实,C++ 是一门静态语言, 怎么写,就怎么调, 在编译的时候就定了
 
 2. 多态是面向对象非常重要的一个特性
 1> 同一个操作, 作用于不同的对象, 可以有不同的解释,产生不同的执行结果.
 2> 在运行时, 可以识别出真正的对象类型,调用对应子类型的函数
 3> 经常用到的,父类指针, 指向子类对象的一个重要作用就是想要实现多态的效果
 
 3. C++ 中多态是通过虚函数(virtual function)来实现的.
 1> 虚函数: 被 virtual 修饰的成员函数, 就是虚函数
 2> 只要在父类中声明为虚函数, 子类中重写的函数也自动变成虚函数(也就是说,子类可以省略 virtual)
 
 3> 什么是函数重写
 1>> 函数重写: 把父类的方法在子类中, 除了函数体其它原封不动的在写一遍.
 2>> 函数重载: 函数名相同, 参数类型/参数个数/参数顺序不同
 3>> 重写是发生在 子类和父类的, 是子类重写父类的方法
 4>> 重载是在当前类中
 
 3. 虚函数的注意点
 1> 在继承的体系中,相同的函数(返回值类型/函数名/参数顺序/参数个数/参数类型 相同的函数), 只要 定义函数时,函数前面家了 virtual,那么 从virtual 开始之后的所有的子类中的这个函数都是虚函数, 定义virtual 之前的函数不是虚函数
 2> 如果,要实现多态, 即 想要使用父类指针访问子类对象中的虚函数,那么子类的继承必须是 public
 
 */




namespace DuoTai {
    class Person{
        int  m_age;
    public:
        virtual void run(){ // virtual 定义虚函数实现多态, 一路虚到底,子类必须使用 public 继承,否则就没有多态
            cout << "void Person::run()" << endl;
        }
    };
    
    
    class Student : public Person{ // 必须使用 public 继承
        int m_no;
    public:
        void run(){
            cout << "void Student::run()" << endl;
        }
    };
    
    class GoodStudent : public Person{ // 必须使用 public 继承
        
    public:
        void run(){
            cout << "void GoodStudent::run()" << endl;
        }
    };
    
}

namespace DuoTai_ZhuYiDian {
    class Person{
        int  m_age;
    public:
        void run(){
            cout << "void Person::run()" << endl;
        }
    };
    
    
    class Student : public Person{
        int m_no;
    public:
        virtual void run(){ // virtual  从哪里定义, 函数就从哪里开始虚函数,从哪里开始多态, 知道protect/ private 继承
            cout << "void Student::run()" << endl;
        }
    };
    
    class GoodStudent : public Student{ // 必须使用 public 继承
    public:
        void run(){
            cout << "void GoodStudent::run()" << endl;
        }
    };
    
    class Worker : protected Person{ // 使用protect 继承后, 父类指针不能在指向子类, 且 子类函数不再有 多态的概念
    public:
        void run(){
            cout << "void Worker::run()" << endl;
        }
    };
    
}

void testDuoTai_ZhuYiDian(){
    
    using namespace DuoTai_ZhuYiDian;
    
    Person  *pson1 = new Person();
    pson1 -> run();
    
    // 虚函数从哪里开始,多态就从哪里开始
    Person  *pson2 = new Student();
    Student  *stu1 = (Student  *)pson2;
    pson2 -> run();
    stu1 -> run();
    
    Person  *pson3 = new GoodStudent();
    Student  *stu2 = (Student  *)pson3;
    stu2 -> run();
    
//    Person  *pson4 = new Worker();  protected / private 的继承, 不能使用父类的指针 指向, 子类不再有多态
    Worker  *pson5 = new Worker();
    pson5 -> run();
    
   
    /** 结果
     void Person::run()
     void Person::run()
     void Student::run()
     void GoodStudent::run()
     void Worker::run()
     */
}

void testDuoTai(){
    using namespace DuoTai;
    
    Person  *pson1 = new Person;
    Person  *pson2 = new Student;
    Person  *pson3 = new GoodStudent;
    pson1 -> run();
    pson2 -> run();
    pson3 -> run();
    
    
}

int main( ) {
    
    testDuoTai();
    
//    testDuoTai_ZhuYiDian();
    
    
    
    
    getchar();
    return 0;
}
