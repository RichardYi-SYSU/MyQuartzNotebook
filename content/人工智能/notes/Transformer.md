
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


