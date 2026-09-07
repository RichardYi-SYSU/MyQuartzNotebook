# C++ `<iomanip>` 相关函数整理

头文件：`#include <iomanip>`

---

## 一、setprecision —— 设置精度

### 单独使用 —— 控制总有效数字位数

```cpp
double pi = 3.14159;
cout << setprecision(3) << pi;   // 3.14  （共 3 位有效数字）
cout << setprecision(4) << pi;   // 3.142（共 4 位有效数字）
```

### 配合 fixed —— 控制小数位数

```cpp
cout << fixed << setprecision(2) << pi;   // 3.14（小数点后 2 位）
cout << fixed << setprecision(4) << pi;   // 3.1416（小数点后 4 位）
```

> `fixed` 和 `setprecision` 都是**持续性设置**，设定后对之后所有输出生效，直到被修改。

### 典型应用：保留两位小数

```cpp
double a = 3.14159, b = 2.71828;
cout << fixed << setprecision(2) << a << " " << b;
// 3.14 2.72
```

---

## 二、setw —— 设置字段宽度

### 基本用法

```cpp
cout << setw(5) << 123;   // "  123"（宽度 5，默认右对齐）
cout << setw(5) << "hi";  // "   hi"
```

### 一次性生效

`setw` 只对**紧随其后的第一个输出**生效，不累积：

```cpp
cout << setw(5) << 1 << 2;     // "    12"  —— setw 只作用于 1
cout << setw(5) << 1 << setw(5) << 2;  // "    1    2"
```

### 对齐方向：left / right

```cpp
cout << left << setw(5) << 123 << "|";   // "123  |"
cout << right << setw(5) << 123 << "|";  // "  123|"
```

### 填充字符：setfill

```cpp
cout << setfill('0') << setw(5) << 123;   // "00123"
cout << setfill('*') << setw(8) << 12;    // "******12"
```

### 典型应用：对齐表格

```cpp
cout << left << setw(10) << "Name" << setw(10) << "Score" << endl;
cout << left << setw(10) << "Alice" << setw(10) << 95 << endl;
cout << left << setw(10) << "Bob" << setw(10) << 87 << endl;
// Name      Score
// Alice     95
// Bob       87
```

---

## 三、fixed —— 固定小数模式

`fixed` 单独使用几乎没有意义，通常与 `setprecision` 搭配。

### 对比：有/无 fixed 的区别

```cpp
double x = 123.456789;

cout << setprecision(4) << x;             // 123.5    （总共 4 位有效数字）
cout << fixed << setprecision(4) << x;    // 123.4568 （小数点后 4 位）

double y = 0.000012345;
cout << setprecision(4) << y;             // 1.234e-05（科学计数法）
cout << fixed << setprecision(4) << y;    // 0.0000   （小数点后 4 位）
```

> 用了 `fixed` 后 `setprecision` 的含义从"总有效数字"变为"小数位数"，并且强制不使用科学计数法。

---

## 四、setfill —— 设置填充字符

### 配合 setw 使用

```cpp
cout << setfill('0') << setw(4) << 7;     // "0007"
cout << setfill(' ') << setw(4) << 7;     // "   7"（默认就是空格）
```

### 典型应用：时间格式化

```cpp
int h = 8, m = 5, s = 9;
cout << setfill('0') << setw(2) << h << ":"
     << setw(2) << m << ":"
     << setw(2) << s;                     // "08:05:09"
```

---

## 五、各属性覆盖规则总结

| 函数 | 作用范围 | 持续性 |
|------|---------|--------|
| `setw(n)` | 仅下一个输出 | ❌ 一次性 |
| `setprecision(n)` | 所有后续输出 | ✅ 持续 |
| `fixed` | 所有后续输出 | ✅ 持续 |
| `setfill(c)` | 所有后续输出 | ✅ 持续 |
| `left` / `right` | 所有后续输出 | ✅ 持续 |

---

## 六、综合示例 —— 期中考对准星

```cpp
#include <iostream>
#include <iomanip>
using namespace std;

int main() {
    // 场景 1：保留两位小数
    double r = 4.0;
    cout << fixed << setprecision(2) << 3.14 * r * r << endl;  // 50.24

    // 场景 2：补零时间格式
    int h = 23, m = 59, s = 50;
    cout << setfill('0') << setw(2) << h << ":"
         << setw(2) << m << ":"
         << setw(2) << s << endl;                              // 23:59:50

    // 场景 3：表格对齐
    cout << fixed << setprecision(2);
    cout << left << setw(8) << "Apple"  << setw(6) << 3.5 << endl;
    cout << left << setw(8) << "Banana" << setw(6) << 2.0 << endl;
    cout << left << setw(8) << "Cherry" << setw(6) << 5.8 << endl;

    return 0;
}
```
