//
//  main.m
//  006-C++ C 语言完全兼容开发
//
//  Created by yangrui on 2019/1/10.
//  Copyright © 2019年 yangrui. All rights reserved.
//

#include <iostream>
using namespace std;

#include "Test_c.h"

int main() {
   
    cout << c_sum(1, 3) << endl;
    cout << c_minus(10, 22) << endl;
     
    getchar();
    return 0;
}
