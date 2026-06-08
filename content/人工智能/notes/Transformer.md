
# Word2Vec

## SkipGram

[[人工智能/materials/pdfs/深度学习与NLP基础.pdf#page=18|深度学习与NLP基础, 页面 18]]

### 模型在学什么？

> 输入是一个中心词，输出目标是预测它周围的上下文词

例如句子：
$$problems\ turning\ into\ banking\ crises\ as$$
如果窗口大小为 2，中心词是：
$$w_t = into$$

那么训练样本可以拆成多个二元组：
$$(into, problems)$$
$$(into, turning)$$
$$(into, banking)$$
$$(into, crises)$$

也就是：
$$中心词 \rightarrow 上下文词$$
所以 Skip-gram 学的是：

$$P(上下文词 \mid 中心词)$$
也就是：
$$P(w_{t+j}\mid w_t)$$
比如：
$$P(banking \mid into)$$
表示：给定中心词 `into`，模型认为 `banking` 出现在它附近的概率。

### 输入与输出？

输入一个中心词，输出它周围的上下文词概率

例如窗口大小为 2：

$$problems\ turning\ into\ banking\ crises$$
取中心词：

$$w_t = into$$

那么上下文词是：

$$problems,\ turning,\ banking,\ crises$$

Skip-gram 做的事情是：

$$into \rightarrow problems$$

$$into \rightarrow turning$$

$$into \rightarrow banking$$

$$into \rightarrow crises$$

也就是输入中心词 `into`，希望模型输出这些上下文词的概率较高。

更形式化地说：

输入：$w_t$

输出：$P(w_{t+j}\mid w_t)$

其中：
$j=-2,-1,1,2$

**输入不是词本身，而是词的 one-hot 编码**

假设词表中有 5 个词：

V = \{problems, turning, into, banking, crises\}

如果中心词是 `into`，它可能表示为 one-hot 向量：

$$x = \begin{bmatrix} 0\\ 0\\ 1\\ 0\\ 0 \end{bmatrix}$$

这个向量的长度等于词表大小。

所以模型真正的输入是：

$$\text{中心词的 one-hot 向量}$$
**模型内部会把 one-hot 转成词向量**

Skip-gram 有一个输入权重矩阵：

W

当输入 `into` 的 one-hot 向量时，本质上就是从矩阵 W 中取出 `into` 对应的那一行或一列。

这个取出来的向量就是 `into` 的词向量：

$$v_{into}$$

所以可以理解为：

$$one\text{-}hot( into ) \rightarrow v_{into}$$

**输出是什么？**

输出不是直接输出某一个词，而是输出一个概率分布。

比如词表还是：

$$\{problems, turning, into, banking, crises\}$$

那么输入 `into` 后，模型可能输出：

$$\begin{bmatrix} P(problems \mid into)\\ P(turning \mid into)\\ P(into \mid into)\\ P(banking \mid into)\\ P(crises \mid into) \end{bmatrix}$$

也就是对词表中每个词都给一个概率。

理想情况下，对于真实上下文词，概率应该比较高：

$$P(problems \mid into)$$
$$P(turning \mid into)$$
$$P(banking \mid into)$$
$$P(crises \mid into)$$

应该比较大。

**神经网络结构可以理解为**

Skip-gram 的结构大致是：

$$\text{中心词 one-hot} \rightarrow \text{词向量} \rightarrow \text{softmax} \rightarrow \text{上下文词概率分布}$$

也就是：

$$x \rightarrow v_{w_t} \rightarrow P(w_o \mid w_t)$$

其中 w_o 是 outside word，也就是上下文词。

---

## **6. 以一个训练样本为例**

假设训练样本是：

(into, banking)

那么：

输入：

x = one\text{-}hot(into)

正确输出标签：

y = one\text{-}hot(banking)

模型预测：

\hat{y} = \begin{bmatrix} P(problems \mid into)\\ P(turning \mid into)\\ P(into \mid into)\\ P(banking \mid into)\\ P(crises \mid into) \end{bmatrix}

训练目标是让：

P(banking \mid into)

尽可能大。

---

## **7. 所以一句话总结**

Skip-gram 的输入输出可以理解为：

\boxed{ 输入：中心词 }

\boxed{ 输出：整个词表中每个词成为上下文词的概率 }

训练时给它一个正确答案，例如：

into \rightarrow banking

模型就调整参数，使得：

P(banking \mid into)

变大。

最终训练好的不是为了真的预测上下文，而是为了得到中间层的词向量：

v_{word}

这些词向量才是 Word2Vec 最重要的结果。



### 目标

一个窗口的目标是让下面所有概率都尽可能大

$$P(problems \mid into)$$
$$P(turning \mid into)$$
$$P(banking \mid into)$$
$$P(crises \mid into)$$

通常把它们乘起来：

$$P(problems \mid into) P(turning \mid into) P(banking \mid into) P(crises \mid into)$$

也可以写成：

$$\prod_{\substack{-2 \le j \le 2 \\ j \ne 0}} P(w_{t+j}\mid w_t)$$

训练时一般取对数，变成最大化：

$$\sum_{\substack{-2 \le j \le 2 \\ j \ne 0}} \log P(w_{t+j}\mid w_t)$$

## CBOW



# Seq2Seq模型

编码器-解码器模型，包括两个RNN

[[人工智能/materials/pdfs/深度学习与NLP基础.pdf#page=55|深度学习与NLP基础, 页面 55]]

## Encoder

左边红色部分是 **Encoder RNN**。
输入句子是：
$$il,\ m',\ a,\ entarté$$
Encoder 会按顺序一个词一个词读入：

$$il \rightarrow m' \rightarrow a \rightarrow entarté$$
每读入一个词，RNN 都会更新一次隐藏状态：
$$h_1, h_2, h_3, h_4
$$
  
可以理解为：

$$h_1：读完 il 后的理解$$
$$h_2：读完 il\ m' 后的理解$$
$$h_3：读完 il\ m'\ a 后的理解$$
$$h_4：读完整个句子后的理解$$

最后一个隐藏状态 h_4 就被当作整个输入句子的编码：
$$\boxed{ c = h_4 }$$
这里的 c 也常被叫做 **context vector**，即上下文向量、语义向量。

它压缩了整句源语言的信息。

## Decoder

右边绿色部分是 **Decoder RNN**。

Decoder 的任务是根据 Encoder 给出的编码 c，生成目标句子：

$$he,\ hit,\ me,\ with,\ a,\ pie,\ <END>$$

它不是一次性生成整句话，而是一个词一个词生成。

生成过程类似：

```
第 1 步：
输入：<START>,\ 编码c
输出：
P(\text{he}\mid c,\ <START>)
选择概率最大的词，得到：
he
第 2 步：
输入：he
输出：
P(\text{hit}\mid c,\ he)
第 3 步：
输入：hit
输出：
P(\text{me}\mid c,\ he,\ hit)
一直生成到：
/<END/>
说明句子结束。
```

## 瓶颈问题

Encoder中最后的隐藏状态维度是固定的，比如 256 维、512 维、1024 维。无论输入句子有多长，最终都要压缩成这一个向量

句子越长，信息越容易丢失
## 注意力机制

在解码器的每一步，建立直接的连接到编码器，聚焦于源序列的特定部分


# Transformer

## 动机

1. 降低每层的计算复杂度
2. 最小化线互距离
3. 最大化可并行性

## QKV

Transformer 中的 **Query（Q）**、**Key（K）**、**Value（V）** 可以理解为一种“内容检索机制”，其思想来源于数据库查询。

先用一个现实例子理解：

假设一句话：

“The animal didn’t cross the street because **it** was too tired.”

当模型处理单词 **it** 时，需要判断 it 指代谁。

此时：

- it 相当于发出一个查询（Query）
- 句子中的其他单词提供自己的特征（Key）
- 每个单词还携带自身的信息（Value）

模型会计算：

$$\text{Query}_{it} \cdot \text{Key}_{animal}$$
$$\text{Query}_{it} \cdot \text{Key}_{street}$$
谁的匹配度高，就认为 it 更应该关注谁。

**一、Q、K、V从哪里来**

假设输入序列：

$$X= \begin{bmatrix} x_1\\ x_2\\ x_3 \end{bmatrix}$$

每个 x_i 是词向量。

Transformer通过三个可学习矩阵：

$$W_Q,\quad W_K,\quad W_V$$

生成：

$$Q=XW_Q$$

$$K=XW_K$$

$$V=XW_V$$

因此：

$$q_i=x_iW_Q$$

$$k_i=x_iW_K$$

$$v_i=x_iW_V$$
**二、Query是什么**

可以理解成：

当前词想寻找什么信息

例如：

句子：

Tom gave Jerry a book because he liked reading.

处理 “he” 时：

Query中可能包含：

- 找一个男性
- 找一个能执行”喜欢阅读”动作的对象

即：

$$q_{he}$$

表示：

我现在需要什么上下文信息？

**三、Key是什么**

Key可以理解为：

我能够提供什么信息

例如：

Tom的Key可能包含：

- 男性
- 人名

Jerry的Key可能包含：

- 男性
- 人名

book的Key可能包含：

- 物体

因此：

$$k_i$$

表示：

我是什么类型的信息？

**四、Value是什么**

Value是真正被取出的内容。

例如数据库：

|**Key**|**Value**|
|---|---|
|Tom|Tom的信息|
|Jerry|Jerry的信息|
|Book|Book的信息|

匹配时：

Query 与 Key 计算相似度：

$$q_i k_j^T$$

得到权重：

$$\alpha_{ij}$$

然后用权重加权 Value：

$$z_i = \sum_j \alpha_{ij}v_j$$

最终得到：

$$z_i$$

这才是Attention层的输出。

所以：

- Q负责提问
- K负责匹配
- V负责提供内容

**五、Attention计算全过程**

**第一步：计算相关性**

$$QK^T$$

例如：

$$Q= \begin{bmatrix} q_1\\ q_2\\ q_3 \end{bmatrix}$$

$$K= \begin{bmatrix} k_1\\ k_2\\ k_3 \end{bmatrix}$$

得到：

$$QK^T = \begin{bmatrix} q_1k_1 & q_1k_2 & q_1k_3\\ q_2k_1 & q_2k_2 & q_2k_3\\ q_3k_1 & q_3k_2 & q_3k_3 \end{bmatrix}$$

第 i 行表示：

第 i 个词对所有词的关注程度

**第二步：缩放**

$$\frac{QK^T}{\sqrt{d_k}}$$

原因：

维度越高，点积越大，Softmax容易饱和。

**第三步：Softmax**

$$A = \text{Softmax} \left( \frac{QK^T}{\sqrt{d_k}} \right)$$

得到注意力权重矩阵。

例如：

$$A= \begin{bmatrix} 0.1&0.8&0.1\\ 0.3&0.2&0.5\\ 0.4&0.4&0.2 \end{bmatrix}$$

**第四步：加权Value**

$$Z=AV$$

即：
$$\text{Attention}(Q,K,V) = \text{Softmax} \left( \frac{QK^T}{\sqrt{d_k}} \right)V$$

这就是Transformer最核心的公式。

**六、为什么不直接用X，而要拆成Q/K/V？**

如果直接：

$$\text{Attention}(X,X,X)$$
那么：

- 查询特征
- 匹配特征
- 输出特征

都被绑在一起。

模型灵活性很差。

拆开后：
$$Q=XW_Q$$
$$K=XW_K $$
$$V=XW_V$$

模型可以学到：

- 用什么特征寻找信息（Q）
- 用什么特征被寻找（K）
- 输出什么内容（V）

三种表示可以完全不同。

如果没有 Key，直接拿 Value 去匹配，就要求 Value 既要适合被搜索，又要适合输出内容，模型表达能力会下降。

**七、自注意力(Self-Attention)中的QKV**

对于输入：

$$[x_1,x_2,\dots,x_n]$$

每个词同时产生：

$$(q_i,k_i,v_i)$$

例如处理第 i 个词：

$$q_i$$

去和所有：

$$k_1,k_2,\dots,k_n$$

比较。

得到权重后：

$$z_i = \alpha_{i1}v_1 +\alpha_{i2}v_2 +\cdots +\alpha_{in}v_n$$

所以：

每个词都在向整个句子“检索”对自己有帮助的信息。
### **一句话总结**

可以把 Transformer 的 Attention 看成一个数据库查询系统：

|**组件**|**含义**|**类比**|
|---|---|---|
|Query(Q)|我需要什么信息|搜索关键词|
|Key(K)|我能提供什么信息|数据库索引|
|Value(V)|真正的信息内容|数据库记录|
|Q·K|匹配程度|搜索相关度|
|Softmax(QK)|注意力权重|搜索结果排序|
|权重×V|提取信息|返回结果|

因此 Transformer 本质上是在做：

**“每个词根据自己的需求（Q），去整个序列中查找最相关的信息（K），然后把这些信息（V）加权汇总回来。”**

## 自注意力

“自注意力”的“自”指的是：

**自己和自己所在的同一个序列内部进行注意力计算。**

不是自己只关注自己，而是：

**序列内部的词彼此之间互相关注。**

|**类型**|**Q来自哪里**|**K、V来自哪里**|**含义**|
|---|---|---|---|
|自注意力 Self-Attention|当前序列|当前序列|序列内部互相看|
|交叉注意力 Cross-Attention|一个序列|另一个序列|一个序列去看另一个序列|

