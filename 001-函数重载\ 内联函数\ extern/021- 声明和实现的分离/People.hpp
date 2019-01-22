//
//  People.hpp
//  021- 声明和实现的分离
//
//  Created by yangrui on 2019/1/19.
//  Copyright © 2019年 yangrui. All rights reserved.
//

#ifndef People_hpp
#define People_hpp
 
// 在.hpp 文件中 声明一个People类
class People {
    int m_age;
    double m_height;
    
public:
    People();
    ~People();
    
    int age();
    void setAge(int age);
    double height();
    void setHeight(double height);
    
};

#endif /* People_hpp */
