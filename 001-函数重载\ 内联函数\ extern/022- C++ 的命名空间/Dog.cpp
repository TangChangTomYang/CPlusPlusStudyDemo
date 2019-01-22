//
//  Dog.cpp
//  022- C++ 的命名空间
//
//  Created by yangrui on 2019/1/19.
//  Copyright © 2019年 yangrui. All rights reserved.
//

#include "Dog.hpp"
#include <iostream>
using namespace std;

namespace YR {
        Dog::Dog(){ // Dog:: 这个是用来限定 够高函数的
            cout << "YR::Dog()" << endl;
        }
        Dog::~Dog(){
            cout << "YR::~Dog()" << endl;
        }

}
