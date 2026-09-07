# C++ `const` 用法总结

---

## 一、const 修饰变量

### 1.1 常量变量
```cpp
const int MAX = 100;           // MAX 不可修改
MAX = 200;                     // ❌ 编译错误
```

### 1.2 const 在指针中的三种位置
```cpp
// ① 指向常量的指针：不能通过指针改值
const int* p1 = &x;
p1 = &y;           // ✅ 指针本身可以改指向
*p1 = 10;          // ❌ 不能通过 p1 改值

// ② 常量指针：指针本身不能改指向
int* const p2 = &x;
p2 = &y;           // ❌ 指针不能改指向
*p2 = 10;          // ✅ 可以改值

// ③ 两者都 const：指针不能改，值也不能通过指针改
const int* const p3 = &x;
```

> 记忆口诀：**const 在 `*` 左边：不能改值；const 在 `*` 右边：不能改指向。**

### 1.3 const 成员变量
```cpp
class A {
    const int id;       // 必须在初始化列表中初始化
public:
    A(int n) : id(n) {} // 初始化列表是唯一的初始化时机
};
```

### 1.4 constexpr（编译期常量）
```cpp
constexpr double PI = 3.14159;  // 编译期就确定，比 const 更早
```

---

## 二、const 修饰函数参数

### 2.1 值传递 —— const 无意义
```cpp
void f(const int x);    // 多余！形参是副本，改不改不影响外面
void f(int x);          // 等价，const 白写
```

### 2.2 常量引用 —— 最常用！
```cpp
void print(const string& s);     // 避免拷贝，且保护原数据不被修改
void add(const int& a, const int& b);
```

### 2.3 常量指针参数
```cpp
void print(const int* arr, int len);  // 保证不修改数组内容
```

---

## 三、const 修饰成员函数

### 3.1 语法：const 在函数后面
```cpp
class Student {
public:
    int getAge() const { return age; }   // 承诺不修改任何成员变量
    void print() const;                  // 声明和定义都要加 const
private:
    int age;
};

int Student::getAge() const {            // 定义处也要加
    return age;
}
```

### 3.2 const 成员函数的规则
```cpp
class X {
    int a;
    mutable int count;  // mutable 成员可在 const 函数中修改
public:
    void func1() const {
        a = 10;          // ❌ 不能改普通成员
        count++;         // ✅ mutable 不受限制
        func2();         // ❌ 不能调非 const 成员函数
        func3();         // ✅ 可以调 const 成员函数
    }
    void func2() {}
    void func3() const {}
};
```

### 3.3 const 对象只能调 const 成员函数
```cpp
const X obj;
obj.func1();   // ✅ const 对象调 const 函数
obj.func2();   // ❌ const 对象不能调非 const 函数
```

---

## 四、const 修饰返回值

### 4.1 返回常量引用
```cpp
const string& getName() const { return name; }  // 返回引用但不允许外部修改
```

### 4.2 返回常量值（少见）
```cpp
const int func();   // 防止对返回值做 func() = 10 这种奇怪操作
```

---

## 五、const 与重载

### 5.1 const 成员函数重载
同一个函数名，const 和非 const 可以构成重载：

```cpp
class IntArray {
public:
    int& operator[](int i) {               // 非 const 版本：可修改
        cout << "non-const []" << endl;
        return data[i];
    }
    const int& operator[](int i) const {   // const 版本：只读
        cout << "const []" << endl;
        return data[i];
    }
    int data[10];
};

IntArray arr;
arr[0] = 5;           // 调非 const 版本，返回 int&

const IntArray carr;
cout << carr[0];      // 调 const 版本，返回 const int&
```

### 5.2 参数 const 重载
```cpp
void f(int& x);            // 匹配非 const 实参
void f(const int& x);      // 匹配 const 实参
```

---

## 六、典型考题场景

| 场景 | 写法 | 含义 |
|------|------|------|
| 常量引用参数 | `void f(const int& x)` | 不拷贝，不修改 |
| const 成员函数 | `int get() const` | 承诺不修改成员 |
| const 成员变量 | `const int id` | 必须在初始化列表初始化 |
| mutable | `mutable int count` | 突破 const 限制 |
| const 对象 | `const Student s` | 只能调 const 函数 |
| const + 引用返回 | `const int& get() const` | 安全返回内部数据 |

---

## 七、快速决策表

| 我想... | 写法 |
|--------|------|
| 参数不想被修改 | `const Type& x` |
| 函数不修改成员 | 函数后加 `const` |
| 成员不可变 | 声明时加 `const`，初始列表初始化 |
| 某个成员在 const 函数中也能改 | `mutable int x` |
| 返回内部数据但不让外面改 | 返回 `const Type&` |
