//
//  Car.hpp
//  007-C++ 默认参数
//
//  Created by yangrui on 2019/1/22.
//  Copyright © 2019年 yangrui. All rights reserved.
//

#ifndef Car_hpp
#define Car_hpp

#include <stdio.h>

namespace YR {
    class Car{
        int m_price;
    public:
        //声明和实现分离的化, 默认参数只能写在函数的声明部分
        void setPrice(int  price = 200);
    };
}

#endif /* Car_hpp */
