# 深度学习与NLP基础

# Deep Learning and Natural Language Processing

![](images/fec68caa9f18bda4ad586d76e407fee78c010be3adc9a2c33e3da2567c87e257.jpg)


![](images/e0c775352e0cdb541fdea74d3c5de548bc1702af7b5a2d433ded5997b45aa89a.jpg)


授课对象：计算机科学与技术专业 二年级

课程名称：人工智能（专业必修）

课程学分：3学分

# 什么是自然语言处理(NLP)

自然语言处理技术（NLP）是文本生成的基础。N L P 探索计算机和人类（自然）语言之间相互作用，研究实现人与计算机之间用自然语言进行有效通信的各种理论和方法。最早的自然语言处理研究工作是机器翻译，后逐渐向文本摘要、分类、校对、信息抽取、语音合成、语音识别等方面深入

⚫ 从基于规则的经验主义到基于统计的理性主义，再到基于深度学习的方法，NLP在70年历程中逐渐发展进步。受益于预训练语言模型的突破发展，Transformer等底层架构不断精进，NLP取得跨越式提升

# 自然语言处理

用计算机对字、词、句、篇章等自然语言的输入、输出、识别、分析、理解、生成等的操作和加工，实现人机间的信息交流

②构成：

# 自然语言处理

![](images/85e158d14f24acdf8d95953dba2d2266b338775e6a4c94acf3461cf614b951ce.jpg)


# 自然语言

人类社会约定俗成的，区别于如程序设计的人工语言

![](images/e0282eecd8150a6fef5176805610f011f551115bf85ee6371ef6ba9b83549397.jpg)


# 处理

输入、输出、识别、分析、理解、生成等计算机操作过程

![](images/f30d80196f706a8fa2dac99bcb7f9c14f3a099bf8c2636c22e478c5113fe167c.jpg)


# 自然语言理解

让机器具备正常人的语言理解能力（识别人讲的话）

# 自然语言产生

将非语言格式的数据转换成人类可以理解的语言格式（输出为人讲的话

1950s-1970s

# 采用基于规则的方法

√1950年，“图灵测试”被提出，自然语言处理思想诞生

√认为自然语言处理过程和人类学习认知一门语言类似，NLP停留在经验主义思潮阶段

√只能基于手写规则，处理少量数据

1970s-2000s

√从数学统计的角度预测下个词的出现概率，代表模型如N-Gram等，推理过程非常直观，但是推理结果非常受数据集的影响，容易出现数据稀疏（即空值）等问题

2000-至今

![](images/2575daf5e687703f8699d2ddc7fa6dbb64e0d5369956e65c39f4d2fb339512f7.jpg)


# 采用基于神经网络的方法

√模型开始像人脑一样学习，2017年以前主要是小模型阶段，2017年Transformer发布之后，模型开始尝试大量数据的训练学习，进入大语言模型阶段，在加入人工干预的反馈基础上，模型效果攀上新的台阶

# NLP基础：Word Embedding 词嵌入/词表征

# 我们如何表示单词的意思？

定义: 含义（meaning） (韦氏词典)

• 由单词、短语等表示的思想

• 一个人想通过使用文字、符号等来表达的想法

• 在写作、艺术作品等作品中表达的思想

 Commonest linguistic way of thinking of meaning:

 signifier (symbol) $\Longleftrightarrow$  signified (idea or thing)

 = denotational semantics

tree ⇔{ 福 T，..

# WordNet

# 如何在计算机建立可用的词义？

先前NLP的常用解决方案：例如WordNet，包含同义词集（synonym sets）和上位词列表（hypernyms）的同义词库（“is a”关系）

 e.g., synonym sets containing "good":

```python
from nltk.corpus import wordnet as wn  
poses = {'n': 'noun', 'v': 'verb', 's': 'adj (s)', 'a': 'adj', 'r': 'adv'}  
for synset in wn.synsets("good"):  
    print("\{:}):".format(poses[synset(pos()), "", ".join([l.name() for l in synset.lemmas())])
```

```txt
noun: good  
noun: good, goodness  
noun: good, goodness  
noun: commodity, trade_good, good  
adj: good  
adj (sat): full, good  
adj: good  
adj (sat): estimable, good, honorable, respectable  
adj (sat): beneficial, good  
adj (sat): good  
adj (sat): good, just, upright  
...  
adverb: well, good  
adverb: thoroughly, soundly, good
```

 e.g.,hypernyms of "panda":

```python
from nltk.corpus import wordnet as wn  
panda = wn.synset("panda.n.01")  
hyper = lambda s: s.hypernyms()  
list(panda.closure(hyper))
```

```txt
[Synset('procyonid.n.01'),  
Synset('carnivore.n.01'),  
Synset('placental.n.01'),  
Synset('mammal.n.01'),  
Synset('vertebrate.n.01'),  
Synset('chordate.n.01'),  
Synset('animal.n.01'),  
Synset('organism.n.01'),  
Synset('living Thing.n.01'),  
Synset('whole.n.02'),  
Synset('object.n.01'),  
Synset('physical_entity.n.01'),  
Synset('entity.n.01')]
```

# WordNet

# WordNet等语言资源的问题

• 资源可用，但缺少细微差别:

例如，“proficient 精通” 被列为“good”的同义词这只在某些语境中是正确的

• 缺少某些新的含义:

• 例如，闪电五连鞭, 坤坤, 蕉绿, wicked, badass, nifty, wizard, genius, ninja

基本不可能保持最新！

• 主观性

• 需要人工来创建和调整

• 不能用于准确计算单词相似度（后面介绍）

# 将单词表示为离散符号

自然语言处理系统把单词作为离散的原子符号

·'cat' is encoded as ld537

· 'dog' is encoded as Id143

.

![](images/38c562d8d2d79331be7368ecb2d3ab4926e1cf0a21379647781bd2058d40ad26.jpg)



Audio Spectrogram


DENSE

Items in adictionary...

![](images/7e6723c9071bedc76b14bdf56954356cdce88f454c0f4f8c5807c9d07e5c48ba.jpg)



Image pixels


DENSE

A document becomesa Bag of Words

<table><tr><td>0</td><td>0</td><td>0</td><td>0.2</td><td>0</td><td>0.7</td><td>0</td><td>0</td><td>0</td><td>...</td><td>...</td></tr></table>

and highnal->Curseof Dimensionality!

 Word, context, ordocument vectors

SPARSE

# 将单词表示为离散符号

在传统的 NLP 中，我们将单词视为离散符号：

hotel, conference, motel – 局部主义（localist）表示

 Means one 1, the rest Os

这样的单词符号可以用 one-hot 向量来表示:

$$
\mathsf {m o t e l} = [ 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 ]
$$

$$
h o t e l = [ 0 0 0 0 0 0 0 1 0 0 0 0 0 0 ]
$$

向量维度大小 $=$ 词典中单词的数量(比如说500,000+)

# 将单词表示为离散符号

# 会有什么问题？

例子：在网络搜索中，如果用户搜索“Seattle motel”，需要匹配包含 “Seattle hotel”的文档但是:

$$
\begin{array}{l} \mathsf {m o t e l} = [ 0 0 0 0 0 0 0 0 0 1 0 0 0 0 ] \\ h o t e l = [ 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 ] \\ \end{array}
$$

这两个向量是正交的，也就没有了它们在自然概念上的相似性(similarity)!

# 解决方案:

• 可否尝试依靠 WordNet 的同义词列表来获得相似性？

但已知因为意义不完整等问题，似乎不可行

• 反之：学习对向量本身的相似性进行编码

# 利用上下文语境表示单词

# 分布语义学: 单词的含义由经常出现在附近的单词给出

• “You shall know a word by the company it keeps” (J. R. Firth 1957: 11)

是现代统计 NLP 最成功的想法之一！

• 当单词 w 出现在文本中时，其上下文（context） 是出现在附近的单词集(在一个固定大小的窗口内).

• 我们利用w的丰富上下文来构建w的表示

...governmentdebt problems turning into banking crisesashappened in 2009...

...saying that Europeneedsunified banking regulationtoreplace thehodgepodge...

...India has just given its banking systema shot in the arm...

![](images/578363714cbc746fdc51804645192fec9d282355bfacd2640a08ea0e2359c0c1.jpg)


# 词向量

# 简短但密集的实数向量，大概50-300维

为每个单词构建一个密集向量，使其类似于出现在相似上下文中的单词向量，使用点(数量)积衡量相似性

$$
b a n k i n g =
$$

$$
0. 2 8 6
$$

$$
0. 7 9 2
$$

$$
- 0. 1 7 7
$$

$$
- 0. 1 0 7
$$

$$
0. 1 0 9
$$

$$
- 0. 5 4 2
$$

$$
0. 3 4 9
$$

$$
0. 2 7 1
$$

$$
m o n e t a r y =
$$

$$
0. 4 1 3
$$

$$
0. 5 8 2
$$

$$
- 0. 0 0 7
$$

$$
0. 2 4 7
$$

$$
0. 2 1 6
$$

$$
- 0. 7 1 8
$$

$$
0. 1 4 7
$$

$$
0. 0 5 1
$$

# 词向量

# 为什么要用简短而密集的实数向量？

短向量更容易作为ML系统的特征使用

密集向量可能相比存储显式的计数更泛用

• 更容易捕捉到同义：

• w1同现为“car”，w2同现为“automobile”

• 获得密集向量的不同方法：

• 奇异值分解（SVD）

Word2Vec及其相关方法：“学习”这样的向量

SVD

![](images/129f1c20f2ccca47931702b94925861c7048664393cb255c77ac75c928a56730.jpg)


# 词嵌入的SVD：共现作为特征

• 行向量描述单词在文本语料库中的使用情况

可以看作是在n维欧氏空间中的点的坐标

太高维了！

<table><tr><td></td><td>get</td><td>see</td><td>use</td><td>hear</td><td>eat</td><td>kill</td></tr><tr><td>knife</td><td>51</td><td>20</td><td>84</td><td>0</td><td>3</td><td>0</td></tr><tr><td>cat</td><td>52</td><td>58</td><td>4</td><td>4</td><td>6</td><td>26</td></tr><tr><td>dog</td><td>115</td><td>83</td><td>10</td><td>42</td><td>33</td><td>17</td></tr><tr><td>boat</td><td>59</td><td>39</td><td>23</td><td>4</td><td>0</td><td>0</td></tr><tr><td>cup</td><td>98</td><td>14</td><td>6</td><td>2</td><td>1</td><td>0</td></tr><tr><td>pig</td><td>12</td><td>17</td><td>3</td><td>2</td><td>9</td><td>27</td></tr><tr><td>banana</td><td>11</td><td>2</td><td>2</td><td>0</td><td>18</td><td>0</td></tr></table>

同现矩阵（Co-occurrence Matrix）

# 词嵌入的SVD：共现作为特征

# SVD用于降维

![](images/78acbc08fc7156c3c1f72c7b3cc38dd1b6d99da35ab9fce02109a6683e338519.jpg)


![](images/28b6f67cb79b35a178474c9c9e47d3f25310d263c1f5aa00247bbb512e6a354b.jpg)


# 词嵌入的SVD：共现作为特征

我们也可以用其他方法，例如LLE：

![](images/896f23b5ed32d2d0ff69e004072671ebe64dbeae4c3fbbcf0baa9b042dbfecbf.jpg)



Nonlinear dimensionalityreduction by locall linear embedding.Sam Roweis& Lawrence Saul. Science,v.290,2000


# 词嵌入的SVD：问题

# SVD的问题：

在一个?? × ??矩阵上的计算开销是??(????2)，其中?? < ??

使其几乎不可能用在有大量单词的词典或文档中

• 难以合并样本外的新单词或文档

# 神经化词向量

# 使用神经化词向量表示词义 – 可视化

![](images/972654ac54e9e61968c33d8e6447e4d4278fffcf298dbe783ca2fc1d667ac290.jpg)


![](images/ffe61db993e6ffabe8dc49057c5670200df6b096cdfad137e5aa6d8b4f6fe124.jpg)


# Word2Vec概述

Word2vec是一个学习词向量的框架(Mikolov et al. 2013)

思想:

• 我们有一个很大的文本语料库(“正文”)：一长串单词

固定词汇表中的每个单词都由一个vector表示

• 遍历文本中的每个位置t，其中包含一个中心词c和上下文（“外部”）词 o

• 使用c和o的词向量相似性来计算给定c时，o的概率（反之亦然）

• 不断调整单词向量来最大化此概率

![](images/3d1d30de6fb23d79480969a8b8132ae8d0800ae799d3e4713b9a508c5501f7fd.jpg)



Skip-gram model



(Mikolov et al. 2013)


# Word2Vec概述

以一个窗口为例，计算 $P ( w _ { t + j } | w _ { t } )$ 的过程：

![](images/461ee7f280602ade9b426fb5ad9ce5203ecccfd003b6caa464fb7fe8edc96c58.jpg)


# Word2Vec概述

以一个窗口为例，计算 $P ( w _ { t + j } | w _ { t } )$ 的过程：

![](images/b1c968fa636e3bd789b026125513ffd41bd5de84be8a8bd25b3321d5e44f5a24.jpg)


# Word2Vec目标函数

对每个位置?? = 1, … , ??，在固定大小为??的窗口内预测上下文的单词。

给定中心词 $w _ { t }$ ，数据的似然：

![](images/d5672ef3c147fb55c03bc8f5d886dfd5fb3f0d6526456d197aec19827d1577e7.jpg)


$$
J(\theta) = -\frac{1}{T}\log L(\theta) = -\frac{1}{T}\sum_{t = 1}^{T}\sum_{\substack{-m\leq j\leq m\\ j\neq 0}}\log P\big(w_{t + j}\mid w_{t};\theta \big)
$$

最小化目标函数 $\Longleftrightarrow$ 最大化预测准确率

# Word2Vec目标函数

• 我们要最小化下面的目标函数：

$$
J(\theta) = -\frac{1}{T}\sum_{t = 1}^{T}\sum_{\substack{-m\leq j\leq m\\ j\neq 0}}\log P\big(w_{t + j}\mid w_{t};\theta \big)
$$

• 问题：如何计算 $P ( w _ { t + j } | w _ { t } ; \theta )$

• 答案：对每个单词w，使用两个向量：

• ????：当w为中心词时

• ????：当w为上下文词时

这两个向量都是所有参数??确定的更大向量的子部分

• 然后对中心词c和上下文单词o：

$$
P (o | c) = \frac {\exp \left(u _ {o} ^ {T} v _ {c}\right)}{\sum_ {w \in V} \exp \left(u _ {w} ^ {T} v _ {c}\right)}
$$

# Word2Vec预测函数

![](images/b565068d77046a5d008722b199d36f9519d9e7bbfe6cd26e000bd09bec703cb5.jpg)


给出概率分布

• 这是个softmax损失函数的例子( $\mathbf { \mathbb { R } } ^ { n } \to ( 0 , 1 ) ^ { n } )$ 开放区域

$$
\operatorname {s o f t m a x} (x _ {i}) = \frac {\exp (x _ {i})}{\sum_ {j = 1} ^ {n} \exp (x _ {j})} = p _ {i}
$$

• 这个softmax函数把任意????映射为概率分布????

“max”是因为它放大了最大的????的概率

•“soft”是因为它仍然为较小的????赋予了一些概率

在深度学习中频繁用到

但还是比较奇怪的叫法，因为它返回的是个分布

# Word2Vec其他细节

为什么是两个向量？ → 更易优化，最后两者均取平均值

但是可以实现每个单词只有一个向量的算法

# 两种变体:

1. Skip-grams (SG)

预测给定中心词的上下文（“外部”）词（与位置无关）

2. Continuous Bag of Words (CBOW)

从上下文词（袋）预测中心词

# 训练损失函数:

1. 朴素的(naïve)softmax（简单，但输出类别特别多时，计算开销大）

2. 使用如分层 softmax等优化的变体

3. 负采样

到目前为止，我们解释了朴素softmax

# Word2Vec：Skip-grams和CBOW

![](images/38332810bb174b7e7d4e420cb280cb8ef222369af9b531dea601d8ece8a78b12.jpg)



CBOW


![](images/410d6b45df4d5eaf4289be4f79b56dc204a54ccb764d656ce8f078250f2db146.jpg)



Skip-qram


⚫ Continuous Bag of Words (CBOW)：使用窗口中的上下文单词来预测中心词

Skip-grams: 使用中心词来预测窗口中的上下文单词

# CBOW：Continuous Bag of Words

[ Mikolov et al., 2013 ]

例子: “The cat sat on floor” (窗口大小为2)

![](images/5189b43f416d55e6afcfd7235397584de4e4aa2f59c7f529c5000aedbbfe566e.jpg)


# CBOW：Continuous Bag of Words

[ Mikolov et al., 2013 ]

![](images/7a4bc91dd37b6b03d8c51c3655fbcbaed123bd7de926779d2129afeb6a188664.jpg)


# CBOW：Continuous Bag of Words

[ Mikolov et al., 2013 ]

![](images/a7978dd97dab85e71a80386ed6f81c40fcb57ef6224490ed42c97e53db960a81.jpg)


# CBOW：Continuous Bag of Words

[ Mikolov et al., 2013 ]

![](images/73c47837eec99b12ca87a813773f84e013d3abce76e7c5c5d1e29ee601662bad.jpg)


# CBOW：Continuous Bag of Words

[ Mikolov et al., 2013 ]

Input l

![](images/c1861f139a97c7db58ac38dc89bcaaa558efd6eefe5be6661d0fc40ef4faee64.jpg)


# CBOW：Continuous Bag of Words

[ Mikolov et al., 2013 ]


Input l


![](images/285e59bfb329ad16dd4817055ab9c5522ab6648676bfd7256b08a22172406637.jpg)


# CBOW：Continuous Bag of Words

[ Mikolov et al., 2013 ]


Input l


![](images/51129eaa505a760695cd61f07ab124a01832b4e2d70065c6dfbb0c7885481403.jpg)


![](images/822b8ffe29639532d41065b5f50291e8c7bdd7e5c4e3f5167826f2eb3111f915.jpg)


# CBOW：Continuous Bag of Words

[ Mikolov et al., 2013 ]


Input l


![](images/1a42fd8f5015c925587afe1248fc145796b269ff2ad24c33ad6408c2a86ee02f.jpg)


![](images/a93e8d6782237f918222961c88cb441e0f264eb0a50ffd2fc6a84f08613c6210.jpg)


# CBOW：Continuous Bag of Words

[ Mikolov et al., 2013 ]

Input l

![](images/3744973900efc2e63e2b90306b2f0b4685691262e242d2e7c65aabbb6606fb66.jpg)


# CBOW：Continuous Bag of Words

[ Mikolov et al., 2013 ]

Input l

![](images/1299ffc12033e71fd372fa85e7a1fee776734b29eb5221a4364b5a077d838c2d.jpg)


# CBOW：Continuous Bag of Words

[ Mikolov et al., 2013 ]

Input l

![](images/68f159159468217396e70a8b51aef3787790b76e3659d2aaf41ac5cfd0501e62.jpg)


# CBOW：Continuous Bag of Words

[ Mikolov et al., 2013 ]


Input l


![](images/17c738ca80acd73c11a2f0124b0865cd8400680be1808d37c03aa3a9ced24c03.jpg)


# put layer

<table><tr><td>0</td><td>ˆy = softmax(z)</td></tr><tr><td>0</td><td>ˆy^sat</td></tr><tr><td>0</td><td></td></tr><tr><td>0</td><td></td></tr><tr><td>0</td><td></td></tr><tr><td>1</td><td>ˆy ∈ R|v|</td></tr><tr><td>...</td><td></td></tr><tr><td>0</td><td></td></tr></table>

<table><tr><td>0.01</td></tr><tr><td>0.02</td></tr><tr><td>0.00</td></tr><tr><td>0.02</td></tr><tr><td>0.01</td></tr><tr><td>0.02</td></tr><tr><td>0.01</td></tr><tr><td>0.7</td></tr><tr><td>…</td></tr><tr><td>0.00</td></tr></table>

# CBOW：Continuous Bag of Words

[ Mikolov et al., 2013 ]

Input l

![](images/8e5974746545a24add45a44e86870902d12bb9389dde1efeabb684d29b880432.jpg)


# CBOW：目标函数

![](images/5ad2a0f5c91a94f7236f3966caf0ecaf07aa465df867676af8755e7b8e40df56.jpg)


$$
L (\theta) = \prod_ {t = 1} ^ {T} P \left(w _ {t} \mid \{w _ {t + j} \}, - m \leq j \leq m, j \neq 0\right)
$$

$$
\bar {\mathbf {v}} _ {t} = \frac {1}{2 m} \sum_ {- m \leq j \leq m, j \neq 0} \mathbf {v} _ {t + j}
$$

$$
P (w _ {t} \mid \{w _ {t + j} \}) = \frac {\exp (\mathbf {u} _ {w _ {t}} \cdot \bar {\mathbf {v}} _ {t})}{\sum_ {k \in V} \exp (\mathbf {u} _ {k} \cdot \bar {\mathbf {v}} _ {t})}
$$

⚫ Continuous Bag of Words (CBOW)：使用窗口中的上下文单词来预测中心词

# Skip-Gram模型

[ Mikolov et al., 2013 ]

![](images/a1a651a1ac9e9f60128b0619c839c2d8c6575fd5c37ce000c451018178882c96.jpg)


# CBOW和Skip-Gram比较

CBOW不适用于稀有单词，且通常需要较少的数据来训练

— Skip-gram更适用于稀有单词，但需要更多数据来训练模型

<table><tr><td>Model</td><td>Vector Dimensionality</td><td>Training words</td><td colspan="3">Accuracy [%]</td></tr><tr><td></td><td></td><td></td><td>Semantic</td><td>Syntactic</td><td>Total</td></tr><tr><td>Collobert-Weston NNLM</td><td>50</td><td>660M</td><td>9.3</td><td>12.3</td><td>11.0</td></tr><tr><td>Turian NNLM</td><td>50</td><td>37M</td><td>1.4</td><td>2.6</td><td>2.1</td></tr><tr><td>Turian NNLM</td><td>200</td><td>37M</td><td>1.4</td><td>2.2</td><td>1.8</td></tr><tr><td>Mnih NNLM</td><td>50</td><td>37M</td><td>1.8</td><td>9.1</td><td>5.8</td></tr><tr><td>Mnih NNLM</td><td>100</td><td>37M</td><td>3.3</td><td>13.2</td><td>8.8</td></tr><tr><td>Mikolov RNNLM</td><td>80</td><td>320M</td><td>4.9</td><td>18.4</td><td>12.7</td></tr><tr><td>Mikolov RNNLM</td><td>640</td><td>320M</td><td>8.6</td><td>36.5</td><td>24.6</td></tr><tr><td>Huang NNLM</td><td>50</td><td>990M</td><td>13.3</td><td>11.6</td><td>12.3</td></tr><tr><td>Our NNLM</td><td>20</td><td>6B</td><td>12.9</td><td>26.4</td><td>20.3</td></tr><tr><td>Our NNLM</td><td>50</td><td>6B</td><td>27.9</td><td>55.8</td><td>43.2</td></tr><tr><td>Our NNLM</td><td>100</td><td>6B</td><td>34.2</td><td>64.5</td><td>50.8</td></tr><tr><td>CBOW</td><td>300</td><td>783M</td><td>15.5</td><td>53.1</td><td>36.1</td></tr><tr><td>Skip-gram</td><td>300</td><td>783M</td><td>50.0</td><td>55.9</td><td>53.3</td></tr></table>

# Interesting Result：词语类比

Mikolov et al. (2014)对线性关系进行测试：

a:b : c:?

![](images/f4e068f109d79c211f1156424ef7bfe3c67da88e0be12efdf195382add3873d7.jpg)


$$
d = \arg \max _ {x} \frac {\left(w _ {b} - w _ {a} + w _ {c}\right) ^ {T} w _ {x}}{\left| \left| w _ {b} - w _ {a} + w _ {c} \right| \right|}
$$

 man:woman :: king:?

+king[0.300.70]

- man[0.200.20]

+ woman [0.600.30]

queen

[ 0.70 0.80]

![](images/f24ebeb796dd05644f9fb01b476f96a4124614df68005a1ab6a03e0e1adb748c.jpg)


# Interesting Result： 词语类比

# 这是单词“king”的词嵌入 (在Wiki百科上训练的GloVe vector):

[ 0.50451 , 0.68607 , -0.59517 , -0.022801, 0.60046 , -0.13498 , -0.08813 , 0.47377 , -0.61798-0.31012 , -0.076666, 1.493 , -0.034189, -0.98173 , 0.68229 , 0.81722 , -0.51874 , -0.31503 ,0.55809 , 0.66421 , 0.1961 , -0.13495 , -0.11476 , -0.30344 , 0.41177 , -2.223 , -1.0756 , -1.0783 , -0.34354 , 0.33505 , 1.9927 , -0.04234 , -0.64319 , 0.71125 , 0.49159 , 0.16754 ,0.34344 , -0.25663 , -0.8523 , 0.1661 , 0.40102 , 1.1685 , -1.0137 , -0.21585 , -0.15155 ,0.78321 , -0.91241 , -1.6106 , -0.64426 , -0.51042 ]

![](images/d338b1cbaa956cbf3b893bb5300789c4bc5057e127ffe549053e5973e042004e.jpg)


# Interesting Result： 词语类比

![](images/bad7fadddbe2a24e6f96011c962fb46c0d017931fd3f8ecaf9678b1cdb8d1c6b.jpg)


![](images/e56fcfa82077050da57a8a1f0911aff99966f2e0ddf03da2169d2ec32584e0c4.jpg)


# Interesting Result： 词语类比

![](images/a27a320ddacd8deb3f96a8b47a9a23882f003f27e682178db1c9a31cb1218e7c.jpg)


# 其他模型

Word2vec 词向量模型是将文字依照语言惯例转换成对应的向量，其训练出来的词向量会有盲点：

在同性质文件中出现，但是文句距离太远的字无法训练到

有类似字首 / 字尾的词向量，无法在词向量中表示出来

因此有了Glove 与 FastText 两种词向量方式依序解决以上问题。

![](images/e720062a32b151121d7a014534d70b3ad122b4cb760bdbf939fe04dddf65faf3.jpg)


![](images/c50e76a69108138f26661ff549df4848d681aaea4d8ef718fe3e574d88a4c965.jpg)



Figure1:Model architecture offastText fora sentencewith$\mathcal { N }$ ngram features $x _ { 1 } , \ldots , x _ { N } .$ The features are embedded andaveraged to form the hiddenvariable.


# Glove

GloVe(Global Vectors forWord Representation全局向量的词嵌入)是一个全局对数双线性回归模型。

目标：得到单词的词向量，让其尽可能的包含语义与语法信息。输入是语料库(没错，不需要去构建训练集)，输出是词向量。GloVe模型的思路是：从语料库中统计共现矩阵，然后根据共现矩阵与GloVe模型来学习词向量。

# GloVe: Global Vectors

· Let's take the global co-occurrence statistics: $X _ { i , j }$

$$
J = \sum_ {i, j = 1} ^ {V} f (X _ {i j}) (w _ {i} ^ {T} \tilde {w} _ {j} + b _ {i} + \tilde {b} _ {j} - \log X _ {i j}) ^ {2}
$$

· Training faster

· Scalable to very large corpora

![](images/823999fa560f98c50f3570f6c97d326c77e515674012c01641221d9d237e0465.jpg)


![](images/85fe66652cad3e140a89740ad16de7f8576dc1615cf8ff60b8cff888381b0ede.jpg)


# Glove

GloVe(Global Vectors forWord Representation全局向量的词嵌入)是一个全局对数双线性回归模型。

目标：得到单词的词向量，让其尽可能的包含语义与语法信息。输入是语料库(没错，不需要去构建训练集)，输出是词向量。

GloVe模型的思路是：从语料库中统计共现矩阵，然后根据共现矩阵与GloVe模型来学习词向量。

# GloVe: Global Vectors

Nearest words to

1. frogs

2. toad

3.litoria

4.leptodactylidae

5.rana

6. lizard

7. eleutherodactylus

![](images/360d79ad6ff153d4ed94e589cfe97dd767efa8e5e9f6ee2b3a056f81f3c648f3.jpg)



litoria


![](images/9c494de9fe7eef0ebe8536f647902bce8399e834dd96e6cdf31bdb7f76482b0f.jpg)



leptodactylidae


![](images/13693713017ca8b8f0af06a178b2601fe660cab2558be4146936078c7393843e.jpg)



rana


![](images/d94b8f000f104b8d02b52dad677786ae0ea059751976eeb297a27468902cc110.jpg)



eleutherodactylus



(Pennington et al, 2o14): GloVe: Global Vectors forWordRepresentation


# FastText

FastText是Facebook在2016年所提出的方法。其实，整个模型架构并没有特别创新的地方，和CBOW模型非常地像。其创新的地方在于：子词嵌入的引入。

# FastText: Sub-Word Embeddings

 · Similar as Skip-gram, but break words into n-grams with $\mathrm { n } = 3$ to 6

 where:3-grams: <wh,whe,her,ere,re>

 4-grams: <whe, wher,here, ere>

 5-grams: <wher, where, here>

 6-grams: <where, where>

Replace Ui · Vj by∑ uq  gEn-grams(wi)

· More to come! Contextualized word embeddings

![](images/3f63610d9747c664a99c49058b822609dc2a0af42a8f79334469f24ea791b14e.jpg)


# Take-Away

# Trained word embeddings available

· word2vec: https://code.google.com/archive/p/word2vec/

· GloVe: https://nlp.stanford.edu/projects/glove/

· FastText: https://fasttext.cc/

# Download pre-trained word vectors

 Differ in algorithms, text corpora, dimensions, cased/uncased...

# 机器翻译（Machine Translation）

机器翻译(MT) 任务：将一种语言(源语言)中的句子x翻译为另一种语言(目标语言)中的句子y

x: L'homme est né libre, et partout il est dans les fers

 y:Man is born free, but everywhere he is in chains

# 机器翻译（Machine Translation）

# 翻译中所要做的事，对模型来说并不简单

![](images/009efc4615b24a56198f70ee2339b1983817c010f0f584c654f747fb649766cc.jpg)


1519年600名西班牙人在墨西哥登陆，去征服几百万人口的阿兹特克帝国，初次交锋他们损兵三分之二。

In 1519, six hundred Spaniards landed in Mexico to conquer the Aztec Empire with apopulation of a few million. They lost two thirds of their soldiers in the first clash.

translate.google.com (2009): 1519 600 Spaniards landed in Mexico, millions of people toconquer the Aztec empire, the first two-thirds of soldiers against their loss.

translate.google.com (2013): 1519 600 Spaniards landed in Mexico to conquer the Aztecempire, hundreds of millions of people, the initial confrontation loss of soldiers two-thirds.

translate.google.com (2015): 1519 600 Spaniards landed in Mexico, millions of people toconquer the Aztec empire, the first two-thirds of the loss of soldiers they clash.

# 机器翻译（Machine Translation）

# 1990s–2010s: 统计机器翻译 (Statistical Machine Translation)

• SMT曾经是庞大的研究领域

• 最优秀的系统及其复杂

有数百个重要细节

• 系统中具有相当多单独设计的子组件

需要大量的特征工程

• 需要设计大量特征来捕获特定的语言现象

需要翻译和维护额外的资源

• 比如：等价短语(equivalent phrases)表

需要大量人力维护

• 对每两个语言都进行重复的工作

# 机器翻译 （Machine Translation）

2014

(dramatic reenactment)

# 从SMT到NMT

• 神经机器翻译(Neural Machine Translation, NMT) 是一种用单个端到端神经网络进行机器翻译的方式

• 这种神经网络架构称为序列到序列模型 (即seq2seq)，其包括2个RNN

# 神经机器翻译NMT

![](images/865ebd21d8a63b1daa316ef2099b56b4dc2136840fedde28fadf0be52a89fbff.jpg)


# Seq2Seq模型的通用性

• 这里的一般概念是个编码器-解码器(encoder-decoder)模型

• 一个神经网络接受输入并生成神经表征

• 另一个神经网络根据该神经表示生成输出

• 如果输入和输出是序列，我们称其为 seq2seq 模型

• Seq2Seq不止是在MT上好用

• 许多 NLP 任务可以表述为sequence-to-sequence:

• 文本总结 (长文本→ 短文本)

• 对话 (先前的话语 → 接下来的话语)

• 解析 (输入文本 → 以序列的形式输出解析)

• 代码生成 (自然语言 → Python 代码)

# Seq2Seq模型的通用性

# 代码生成 (Nl2Sql 大模型)

8请帮我写一个SQL，查询出课程表中每一个学生的平均成绩

![](images/1452f0cb481fad9963e1d830a9afca29be7e2e28ab03476ccfb0cfec5f483b44.jpg)


当然可以！以下是一个例子：

```sql
SELECT student_id, AVG(score) AS avg_score  
FROM students  
GROUP BY student_id;
```

![](images/ad9e8b213d89d7d876614b6c4912dd5a83e6857ead002892a5ae558b3e4feb46.jpg)


这个SQL语句将返回每个学生的平均分数。student_id是课程表中的主键，avg_score为每个学生的平均分数。我们使用了AVG（）函数来计算总分除以人数得到的平均分数。注意：上面的例子中假设students包含一个列名为score的学生成绩列。如果实际表中有多个成绩列，则需要修改语句中的相应部分以适应您的实际情况。

<table><tr><td>数据集</td><td>公开年份</td><td>Query数量</td><td>数据库数</td><td>涉及链接</td><td>单轮/多轮</td><td>注释</td></tr><tr><td>ATIS</td><td>1994</td><td>6280</td><td>1</td><td>单链路</td><td>单轮</td><td>英文</td></tr><tr><td>GeoQuery</td><td>2001</td><td>877</td><td>1</td><td>单链路</td><td>单轮</td><td>英文</td></tr><tr><td>Pertunations</td><td>2003</td><td>370</td><td>1</td><td>单链路</td><td>单轮</td><td>英文</td></tr><tr><td>Academic</td><td>2014</td><td>198</td><td>1</td><td>单链路</td><td>单轮</td><td>英文</td></tr><tr><td>Scholar</td><td>2017</td><td>817</td><td>1</td><td>单链路</td><td>单轮</td><td>英文</td></tr><tr><td>IMDB</td><td>2017</td><td>131</td><td>1</td><td>单链路</td><td>单轮</td><td>英文</td></tr><tr><td>Yelp</td><td>2017</td><td>128</td><td>1</td><td>单链路</td><td>单轮</td><td>英文</td></tr><tr><td>Wikipedia</td><td>2017</td><td>90957</td><td>26521</td><td>多链路</td><td>单轮</td><td>英文</td></tr><tr><td>Advising</td><td>2018</td><td>3998</td><td>1</td><td>单链路</td><td>单轮</td><td>英文</td></tr><tr><td>Spider</td><td>2018</td><td>10181</td><td>250</td><td>多链路</td><td>单轮</td><td>英文</td></tr><tr><td>N.2000</td><td>2019</td><td>49974</td><td>5201</td><td>多链路</td><td>单轮</td><td>中文</td></tr><tr><td>CSpider</td><td>2019</td><td>9931</td><td>165</td><td>多链路</td><td>单轮</td><td>中文</td></tr><tr><td>SPartC</td><td>2019</td><td>4288</td><td>200</td><td>多链路</td><td>多轮</td><td>英文</td></tr><tr><td>CusSQL</td><td>2019</td><td>2007</td><td>200</td><td>多链路</td><td>多轮</td><td>英文</td></tr><tr><td>DOSQL</td><td>2020</td><td>23797</td><td>200</td><td>多链路</td><td>单轮</td><td>中文</td></tr><tr><td>CHASE</td><td>2021</td><td>17940</td><td>260</td><td>多链路</td><td>多轮</td><td>中文</td></tr></table>

![](images/3f29d7a6570db499f4c3e962a75c7f3b795ab68f37a9665e3b4cc9ec72d7d0fd.jpg)


![](images/dd2a61e88f912810d08474237db7c7863101139f873f229eaee466079bcc3040.jpg)


# 条件语言模型

• Seq2Seq模型是条件语言模型的一个例子

• 语言模型：因为解码器预测目标句子 $y$ 的下一个单词

• 条件：因为它的预测也以源句子 $x$ 为条件

· NMT directly calculates $P ( \boldsymbol { y } | \boldsymbol { x } )$

$$
P (y | x) = P \left(y _ {1} | x\right) P \left(y _ {2} | y _ {1}, x\right) P \left(y _ {3} | y _ {1}, y _ {2}, x\right) \dots P \left(y _ {T} | y _ {1}, \dots , y _ {T - 1}, x\right)
$$

• 问题：如何训练NMT系统?

（简单的）答案：获取一个大的并行语料库...

• 但现在在“无监督 NMT”、数据增强等方面已经有了很好的工作

# NMT

![](images/1686c64d28995d621e3c0ca65e9cf4be192ce5ffda16d1e6b31eb8c47f4d37a6.jpg)


# 多层深度编码器-解码器机器翻译网络

[Sutskever et al. 2014; Luong et al. 2015]

![](images/2a21f0cbb5f5af0736fb6a4c948ecd3120fe3e7de8e6d33db6076dd76ecaaae4.jpg)


Conditioning Bottleneck

# 神经机器翻译NMT的成功

# NMT：NLP深度学习的首个巨大成功

# NMT从2014年的边缘研究to变成2016年的领先标准方法

• 2014: 第一篇seq2seq论文发表 [Sutskever et al. 2014]

• 2016: 谷歌翻译从SMT转而采用NMT – 且到2018年已全面替代

• https://www.nytimes.com/2016/12/14/magazine/the-great-ai-awakening.html

![](images/e85983d38fca5d2be38c9b89d83409867a62fb4484b8233b6e0e56eba368189d.jpg)


Microsoft

![](images/43880e2d913e15c7ee6cbc87005a19a2dd5a536b21af53ba8032479814781a4b.jpg)


SYSTRAN

beyond language

![](images/c7827bf1bdd0c0b8d71ed4fc865cb1e9e0a49710153259372979bd3f17ea2f50.jpg)


facebook

![](images/50290bc99a0596fe8b9bffed2e42a5799af90778923f5e52926ebab3da415b7c.jpg)


![](images/f4d3d5f23fac81da6832293323bd97bd951af257d65cb1d317228e226536bc0b.jpg)


Tencent腾讯

![](images/d2f479d2c53fd3438785ce60a90db34721f816cb28ed08ea33f45e773749f9f8.jpg)


搜狗搜索

• Amazing!

• 由上百工程师数年构建的SMT系统，被由 工程师小组仅花费数月构建的NMT系统超越

# Seq2Seq的瓶颈问题

![](images/39d5d5c74ad327e645ed11e5a92e945de9e3bf5cfd29722ae16c1bffc36c5c15.jpg)


# Seq2Seq的瓶颈问题

![](images/8760c29cc7d40dba94ff516651bd73a9083c511e6dc9a6948c45d94cbd1df2bf.jpg)



Source sentence (input)



Target sentence (output)


![](images/ac63210eea35672999d70f4ff41a63df502e6fb4632c204718927219a7e56f4d.jpg)


![](images/5c151d7c44d26ebe75fcf1fc244e6e573135f5d7ad81f9e4508bfcca32d2c619.jpg)


# 注意力(Attention)

• 注意力提供了解决该瓶颈问题的一个方式

• 核心思想：在解码器的每一步，建立直接的连接到编码器，聚焦于源序列的特定部分

![](images/83368a358479bdcb1a65bd789b8b5cf0bfdd40e8d684c92c5791fd74ef3c82cf.jpg)


首先，我们通过图表展示，再形式化表示

# Seq2Seq和注意力

• 核心思想：在解码器的每一步，建立直接的连接到编码器，聚焦于源序

列的特定部

![](images/04de40004c79b093dce67370e6a2464ad950b9943b27100e80417a759864060d.jpg)


# Seq2Seq和注意力

![](images/dfd17693d1970fc6495b1bd367768e606d987e4a0023ff2e884e767c5c723968.jpg)


# Seq2Seq和注意力

![](images/b55a8ac437957b4298cda5af06affdd2b20f387e42fae65b14b51befc25d72e9.jpg)


# Seq2Seq和注意力

![](images/54fc11d6cde8549161d8b2e08916bf3e4eaa2f0ed0f9316fc780f071ac96977a.jpg)


# Seq2Seq和注意力

![](images/ec49eb59b20ecd2b37f037f5c72423c416361b6ea58273325cacd8b6bf103456.jpg)


# Seq2Seq和注意力

![](images/fff6b221c591ab08f78a7bfaa8ad52df2a50162bb80548291099100e275c68dc.jpg)


# Seq2Seq和注意力

![](images/bbab5018b0834e4ff3d626d2ee98df2f4140ad4423c0e32e22bed2d5373eee8a.jpg)


# Seq2Seq和注意力

![](images/14473af1cbbd3ac71ec124c134e2b140e273aec32860ea43c9726aa663f5abf5.jpg)


# Seq2Seq和注意力

![](images/073946fa252e8da70fc00914d069ce12f6a274d10e74284f01fd2901c27fc15e.jpg)



Source sentence (input)


![](images/27abdc0f0dce52b0f754225f6c301e94fc71515c6fa576fd29eb691415494217.jpg)


# Seq2Seq和注意力

![](images/7089b198d2afd05ad3ea67b6b8d434b530206baff4c779354c1e3e610d9af94f.jpg)



Source sentence (input)


# Seq2Seq和注意力

![](images/0e904dd737a954d7c13cb7d4ea3b176ee2db4e5f5d7c634a1ef769978f4de7d3.jpg)


# Seq2Seq和注意力

![](images/86d566166bae37056dd89a235c117ee53ccf6feb6609647cde62d52b4dc32936.jpg)


# Seq2Seq和注意力

• 编码器隐藏状态：??1, … , ???? ∈ ℝℎ

• 在时间步??，有解码器隐藏状态???? ∈ ℝℎ

• 对这一步计算注意力分数????:

$$
\pmb {e} ^ {t} = [ \pmb {s} _ {t} ^ {T} \pmb {h} _ {1}, \dots , \pmb {s} _ {t} ^ {T} \pmb {h} _ {N} ] \in \mathbb {R} ^ {N}
$$

• 对这一步用softmax来得到注意力分布 $\alpha ^ { t }$ (这是个概率分布且和为1)：

$$
\alpha^ {t} = \operatorname {s o f t m a x} (\boldsymbol {e} ^ {t}) \in \mathbb {R} ^ {N}
$$

• 使用 $\alpha ^ { t }$ ，对编码器隐藏状态进行加权求和，得到注意力输出 $\mathbf { } \mathbf { } \mathbf { } \mathbf { } \mathbf { } \mathbf { } \mathbf { } \mathbf { } \mathbf { } \mathbf { } \mathbf { } \mathbf { } \mathbf { } \mathbf { } \mathbf { } \mathbf { } \mathbf { } \mathbf { } \mathbf { } \mathbf { } \mathbf { } \mathbf { } \mathbf { } \mathbf { } \mathbf { } \mathbf { } \mathbf { } \mathbf { } \mathbf { } \mathbf { } \mathbf { } \mathbf { } \mathbf { } \mathbf { } \mathbf { } \mathbf { } \mathbf { } \mathbf { } \mathbf { } \mathbf { } \mathbf { } \mathbf { } \mathbf { } \mathbf { } \mathbf { } \mathbf { } \mathbf { } \mathbf { } \mathbf { } \mathbf { } \mathbf { } \mathbf { } \mathbf { } \mathbf { } \mathbf { } \mathbf { } \mathbf { } \mathbf { } \mathbf { } \mathbf { } \mathbf { } \mathbf { } \mathbf { } \mathbf { } \mathbf { } \mathbf { } \mathbf { } \mathbf { } \mathbf { } \mathbf { } \mathbf { } \mathbf { } \mathbf { } \mathbf { } \mathbf { } \mathbf { } \mathbf { } \mathbf { } \mathbf { } \mathbf { } \mathbf { } \mathbf { } \mathbf { } \mathbf { } \mathbf { } \mathbf { } \mathbf { } \mathbf { } \mathbf { } \mathbf { } \mathbf { } \mathbf { } \mathbf { } \mathbf { } \mathbf { } \mathbf { } \mathbf { } \mathbf { } \mathbf { } \mathbf \Psi \mathbf { } \mathbf { } \mathbf { } \mathbf { } \mathbf \Psi \mathbf { } \mathbf { } \mathbf { } \mathbf \Psi \mathbf { } \mathbf { } \mathbf { } \mathbf \Psi \mathbf { } \mathbf { } \mathbf \Psi \Psi \mathbf { } \mathbf { } \mathbf \Psi \mathbf { } \mathbf { } \mathbf \Psi \Psi \mathbf { } \mathbf \Psi \Psi \mathbf { } \mathbf \Psi \Psi \mathbf { } \mathbf \Psi \Psi \mathbf { } \mathbf \Psi \Psi \mathbf { } \mathbf \Psi \mathbf \Psi \Psi \Psi \mathbf { } \mathbf \Psi \mathbf \Psi \Psi \Psi \mathbf \Psi \Psi \mathbf \Psi \Psi \mathbf \Psi \Psi \mathbf \Psi \Psi \mathbf \Psi \Psi \mathbf \Psi \mathbf \Psi \Psi \mathbf \Psi \mathbf \Psi \Psi \mathbf \Psi \mathbf \Psi \Psi \mathbf \Psi \mathbf \Psi \mathbf \Psi \mathbf \Psi \Psi \mathbf \mathbf \Psi \Psi \mathbf \Psi \mathbf \Psi \mathbf \Psi \mathbf \Psi \mathbf \mathbf \Psi \mathbf \Psi \mathbf \mathbf \Psi \Psi \mathbf $

$$
\pmb {a} _ {t} = \sum_ {i = 1} ^ {N} \alpha_ {i} ^ {t} \pmb {h} _ {i} \in \mathbb {R} ^ {h}
$$

• 最后将注意力输出 $\pmb { a } _ { t }$ 和解码器隐藏状态 $\pmb { s } _ { t }$ 拼接，并和非注意力Seq2Seq模型样继续：

$$
[ \pmb {a} _ {t}; \pmb {s} _ {t} ] \in \mathbb {R} ^ {2 h}
$$

# Seq2Seq和注意力

# 注意力的优势

• 注意力能够显著提升NMT的性能

• 允许解码器专注于源句子的某些部分

• 注意 • 可以在翻译时回顾源句子，而无需记住所有内容

• 注意力解决了瓶颈问题

• 注意力允许解码器直接查看源句子，绕开了瓶颈问题

• 注意力有助于解决梯度消失问题

提供了捷径到更远的状态

• 注意力提供了一些可解释性

可以通过检查注意力分布看到解码器关注的内容

可以直接获得(软)对齐

因为从未明确训练过对齐系统，所以这是很有用的

网络只是自己学会了对齐

# 注意力的通用性

# 注意力是一种通用的深度学习技术

• 我们已经看到，注意力是改进机器翻译的序列到序列模型的好方法。

但是：注意力在很多架构中都能够使用(不仅仅是seq2seq) 和很多任务 (不只是MT)

• 对注意力更一般的定义:

• 给定一个向量集合values，以及一个向量query，注意力在query上，计算values加权和的技术

• 有时称为query对values的注意力聚焦.

例如，在 seq2seq+attention 模型中，每个解码器隐藏状态（query）关注所有编码器隐藏状态 （values）

# 注意力的通用性

# 注意力是一种通用的深度学习技术

• 对注意力更一般的定义:

• 给定一个向量集合values，以及一个向量query，注意力在query上，计算values加权和的技术

# 直观上:

• 加权和运算本质是对values向量信息的选择性摘要，由query向量动态决定关注焦点

• 注意力机制实现了任意规模输入→定长表征的转换(values向量)，其信息压缩过程始终以query向量为条件

# 核心结论:

• 注意力已成为深度学习模型中强大、灵活、普适的指路牌与记忆操作范式（2010年后源自神经机器翻译的重大创新）

# Transformer

# Transformers: Is Attention All We Need?

• 我们知道，注意力可以显著提高循环神经网络的性能。

• 今天，我们将更进一步，问：Is All Attention We Need？

• 剧透: 还差一点！

# Attention Is All You Need

Ashish Vaswani*

Google Brain

avaswani@google.com

Noam Shazeer

Google Brain

noam@google.com

NikiParmar*

Google Research

nikip@google.com

Jakob Uszkoreit*

GoogleResearch

usz@google.com

Llion Jones*

GoogleResearch

llion@google.com

Aidan N.Gomez*

University of Toronto

aidan@cs.toronto.edu

Lukasz Kaiser*

Google Brain

lukaszkaiser@google.com

Illia Polosukhin*

illia.polosukhin@gmail.com

# Transformer

# Transformers是NLP领域的重大革新

• 几乎支撑了现如今所有最先进NLP模型的神经网络架构

![](images/71fc4bdf1b3d4f8c590ed296a3c84c61c7a307f595bc2206dbe7744a8a50bcb9.jpg)


![](images/cd33e5e19698a1f9deea4f6694eadcf53624d4af29b951cd2997af5415e41d3c.jpg)


# Transformer的表现：机器翻译


First, Machine Translation results from the original Transformers paper!


<table><tr><td rowspan="2">Model</td><td colspan="2">BLEU</td><td colspan="2">Training Cost (FLOPs)</td></tr><tr><td>EN-DE</td><td>EN-FR</td><td>EN-DE</td><td>EN-FR</td></tr><tr><td>ByteNet [18]</td><td>23.75</td><td></td><td></td><td></td></tr><tr><td>Deep-Att + PosUnk [39]</td><td></td><td>39.2</td><td></td><td>1.0 · 1020</td></tr><tr><td>GNMT + RL [38]</td><td>24.6</td><td>39.92</td><td>2.3 · 1019</td><td>1.4 · 1020</td></tr><tr><td>ConvS2S [9]</td><td>25.16</td><td>40.46</td><td>9.6 · 1018</td><td>1.5 · 1020</td></tr><tr><td>MoE [32]</td><td>26.03</td><td>40.56</td><td>2.0 · 1019</td><td>1.2 · 1020</td></tr><tr><td>Deep-Att + PosUnk Ensemble [39]</td><td></td><td>40.4</td><td></td><td>8.0 · 1020</td></tr><tr><td>GNMT + RL Ensemble [38]</td><td>26.30</td><td>41.16</td><td>1.8 · 1020</td><td>1.1 · 1021</td></tr><tr><td>ConvS2S Ensemble [9]</td><td>26.36</td><td>41.29</td><td>7.7 · 1019</td><td>1.2 · 1021</td></tr><tr><td>Transformer (base model)</td><td>27.3</td><td>38.1</td><td colspan="2">3.3 · 1018</td></tr><tr><td>Transformer (big)</td><td>28.4</td><td>41.8</td><td colspan="2">2.3 · 1019</td></tr></table>

# Transformer的表现：大预言模型崛起

 Today, Transformer-based models dominate LMsYs Chatbot Arena Leaderboard!

<table><tr><td>Rank</td><td>Model</td><td>Arena Elo</td><td>95% CI</td><td>Votes</td><td>Organization</td><td>License</td><td>Knowledge Cutoff</td></tr><tr><td>1</td><td>GPT-4-Turbo-2024-04-09</td><td>1258</td><td>+4/-4</td><td>26444</td><td>OpenAI</td><td>Proprietary</td><td>2023/12</td></tr><tr><td>1</td><td>GPT-4-1106-preview</td><td>1253</td><td>+3/-3</td><td>68353</td><td>OpenAI</td><td>Proprietary</td><td>2023/4</td></tr><tr><td>1</td><td>Claude 3 Opus</td><td>1251</td><td>+3/-3</td><td>71500</td><td>Anthropic</td><td>Proprietary</td><td>2023/8</td></tr><tr><td>2</td><td>Gemini 1.5 Pro API-0409-Preview</td><td>1249</td><td>+4/-5</td><td>22211</td><td>Google</td><td>Proprietary</td><td>2023/11</td></tr><tr><td>3</td><td>GPT-4-0125-preview</td><td>1248</td><td>+2/-3</td><td>58959</td><td>OpenAI</td><td>Proprietary</td><td>2023/12</td></tr><tr><td>6</td><td>Meta Llama 3.70b Instruct</td><td>1213</td><td>+4/-6</td><td>15809</td><td>Meta</td><td>Llama 3 Community</td><td>2023/12</td></tr><tr><td>6</td><td>Bard (Gemini Pro)</td><td>1208</td><td>+7/-6</td><td>12435</td><td>Google</td><td>Proprietary</td><td>Online</td></tr><tr><td>7</td><td>Claude 3 Sonnet</td><td>1201</td><td>+4/-2</td><td>73414</td><td>Anthropic</td><td>Proprietary</td><td>2023/8</td></tr></table>

![](images/ff8be3bb47aa6c67ec94fa29be6f75bae7f0e5c82feac80f5db4a9263fb484f1.jpg)



Gemini / Bard(Google)


![](images/65fb134236b6977fa8a4292665f643afd46c6b98e6decda047580f27dd8542bc.jpg)



ChatGPT/GPT-4(OpenAl)


![](images/e993969421c36bd5e1223fcecb0ce118f41b2cb1bda2c7016c3fc61a3f69fd60.jpg)



Claude 3(Anthropic)


![](images/a19fd09a0c0a0c2dd941e6625c8407c99a29fc4ca2eceba521ac5ccac8a844b0.jpg)



Llama 3(Meta)


[Chiang et al., 2024]

# Transformer的表现：NLP之外

# Protein Folding

![](images/6b16c4b7b08fccc96eda49898d3f6cd8a3174ff49b4ee21008a77c76ec55706d.jpg)



[Jumper etal.2021] aka AlphaFold2!


![](images/a462db2ef05cab3a58f43f7e295c00bc85865603d40284519c6bfb4e9ed67442.jpg)


# Image Classification

[Dosovitskiy et al.2020]: Vision Transformer (ViT) outperformsResNet-based baselines with substantially lesscompute.

<table><tr><td></td><td>Ours-JFT (ViT-H/14)</td><td>Ours-JFT (ViT-L/16)</td><td>Ours-121k (ViT-L/16)</td><td>BiT-L (ResNet152x4)</td><td>Noisy Student (EfficientNet-L2)</td></tr><tr><td>ImageNet</td><td>88.55 ± 0.04</td><td>87.76 ± 0.03</td><td>85.30 ± 0.02</td><td>87.54 ± 0.02</td><td>88.4/88.5*</td></tr><tr><td>ImageNet RealL</td><td>90.72 ± 0.05</td><td>90.54 ± 0.03</td><td>88.62 ± 0.05</td><td>90.54</td><td>90.55</td></tr><tr><td>CIFAR-10</td><td>99.50 ± 0.06</td><td>99.42 ± 0.03</td><td>99.15 ± 0.03</td><td>99.37 ± 0.06</td><td>-</td></tr><tr><td>CIFAR-100</td><td>94.55 ± 0.04</td><td>93.90 ± 0.05</td><td>93.25 ± 0.05</td><td>93.51 ± 0.08</td><td>-</td></tr><tr><td>Oxford-IIT Pets</td><td>97.56 ± 0.03</td><td>97.32 ± 0.11</td><td>94.67 ± 0.15</td><td>96.62 ± 0.23</td><td>-</td></tr><tr><td>Oxford Flowers-102</td><td>99.68 ± 0.02</td><td>99.74 ± 0.00</td><td>99.61 ± 0.02</td><td>99.63 ± 0.03</td><td>-</td></tr><tr><td>VTAB (19 tasks)</td><td>77.63 ± 0.23</td><td>76.28 ± 0.46</td><td>72.72 ± 0.21</td><td>76.29 ± 1.70</td><td>-</td></tr><tr><td>TPUv3-core-days</td><td>2.5k</td><td>0.68k</td><td>0.23k</td><td>9.9k</td><td>12.3k</td></tr></table>

![](images/e1427d52eaa8dd0185b9364cb4fcb247a3cd09a1dbfa85c37ede35cb9db27bac.jpg)


# ML for Systems

[Zhou et al. 2020]: A Transformer-basedcompiler model (GO-one) speeds up aTransformermodel!

<table><tr><td>Model (#devices)</td><td>GO-one (s)</td><td>HP (s)</td><td>METISS (s)</td><td>HDP (s)</td><td>Run time speed up over HP / HDP</td><td>Search speed up over HDP</td></tr><tr><td>2-layer RNNLM (2)</td><td>0.173</td><td>0.192</td><td>0.355</td><td>0.191</td><td>9.9% / 9.4%</td><td>2.95x</td></tr><tr><td>4-layer RNNLM (4)</td><td>0.210</td><td>0.239</td><td>0.503</td><td>0.251</td><td>13.8% / 16.3%</td><td>1.76x</td></tr><tr><td>8-layer RNNLM (8)</td><td>0.320</td><td>0.332</td><td>OOM</td><td>0.764</td><td>3.8% / 58.1%</td><td>27.8x</td></tr><tr><td>2-layer GNMFT (2)</td><td>0.301</td><td>0.384</td><td>0.344</td><td>0.327</td><td>27.6% / 14.3%</td><td>30x</td></tr><tr><td>4-layer GNMFT (4)</td><td>0.350</td><td>0.469</td><td>0.466</td><td>0.432</td><td>34% / 23.4%</td><td>58.8x</td></tr><tr><td></td><td>0.440</td><td>0.562</td><td>OOM</td><td>0.693</td><td>21.7% / 36.5%</td><td>7.35x</td></tr><tr><td>2-layer Transformer-XL (2)</td><td>0.223</td><td>0.268</td><td>0.37</td><td>0.262</td><td>20.1% / 17.4%</td><td>40x</td></tr><tr><td>4-layer Transformer-XL (4)</td><td>0.230</td><td>0.27</td><td>OOM</td><td>0.259</td><td>17.4% / 12.6%</td><td>26.7x</td></tr><tr><td>8-layer Transformer-XL (8)</td><td>0.350</td><td>0.46</td><td>OOM</td><td>0.425</td><td>23.9% / 16.7%</td><td>16.7x</td></tr><tr><td></td><td>0.229</td><td>0.312</td><td>OOM</td><td>0.301</td><td>26.6% / 23.9%</td><td>13.5x</td></tr><tr><td>Inception (2) b64</td><td>0.423</td><td>0.731</td><td>OOM</td><td>0.498</td><td>42.1% / 29.3%</td><td>21.0x</td></tr><tr><td>AmoebaNet (4)</td><td>0.394</td><td>0.44</td><td>0.426</td><td>0.418</td><td>26.1% / 6.3%</td><td>58.8x</td></tr><tr><td>2-stack 18-layer WaveNet (2)</td><td>0.317</td><td>0.376</td><td>OOM</td><td>0.354</td><td>18.6% / 11.7%</td><td>6.67x</td></tr><tr><td>4-stack 36-layer WaveNet (4)</td><td>0.659</td><td>0.988</td><td>OOM</td><td>0.721</td><td>50% / 9.4%</td><td>20x</td></tr><tr><td>GEOMEAN</td><td>-</td><td>-</td><td>-</td><td>-</td><td>28.5% / 18.2%</td><td>15x</td></tr></table>

# Transformer：尺度定律(Scaling Law)

# Transformer就是我们所需要的吗？

• 使用 Transformer，随着我们同时增加模型大小、训练数据和计算资源，语言建模性能可以顺利提高

• 这种幂律关系已经在多个数量级上被观察到，而且没有放缓的迹象！

• 如果我们继续扩展这些模型（不改变架构），它们最终能否达到或超过人类水平的性能？

![](images/7ab3e0cc677e2522fec6adc052247ebad050b836f44184afa5c9ac5c93caf483.jpg)



Compute


![](images/33b07f7b024b2b90f32d73684020361b6d18c9d9d3b9e7d108d4d1ea17090d88.jpg)



Dataset Size


![](images/27fb2b95df0df793cbc51a1c1039d1c42ac5cb70faeb4a39bbf3a8a55bc5d4a0.jpg)



Parameters


# Transformer的动机

# 为什么要超越递归架构？

Transformer的作者在设计这个架构时有3个想法 ：

1. 最小化（至少别增加）每层的计算复杂度

2. 最小化任何一对单词之间的路径长度，以促进学习长距离依赖关系

3. 最大化可并行化的计算量

# Transformer的动机

# 1. 每层的计算复杂度

d时，与我们目前了解的递归模型相比，Transformer 的每层复杂度较低。


Table1:Maximumpath lengths,per-layer complexityand minimum numberof sequential operationsfordifferent layer types. $n$ is the sequence length, $d$ is therepresentation dimension, $k$ isthe kernelsize of convolutions and $r$ the size of the neighborhood in restricted self-attention.


<table><tr><td>Layer Type</td><td>Complexity per Layer</td><td>Sequential Operations</td><td>Maximum Path Length</td></tr><tr><td>Self-Attention</td><td>O(n2·d)</td><td>O(1)</td><td>O(1)</td></tr><tr><td>Recurrent</td><td>O(n·d2)</td><td>O(n)</td><td>O(n)</td></tr><tr><td>Convolutional</td><td>O(k·n·d2)</td><td>O(1)</td><td>O(logk(n))</td></tr><tr><td>Self-Attention (restricted)</td><td>O(r·n·d)</td><td>O(1)</td><td>O(n/r)</td></tr></table>


Table1of the Transformerpaper.


# Transformer的动机

# 2. 最小化线互距离

• RNN是“从左到右”展开的

• 编码线性局部性，是一种有用的启发式方法

• 相邻的单词通常会相互影响彼此的含义

![](images/6f3c16de0e55f85ad8c312563d142ef96ecc7e11d5460cf17afe2835eb0bd210.jpg)



tasty pizza


• 问题: RNN需要O(sequence length) 的步数来使相隔较远的单词交互

![](images/ac00c0ee1d8cf393f0cecc00b001fbe4e5a10f1eea2bf19ff3ba1131c63161fc.jpg)


# Transformer的动机

# 2. 最小化线互距离

• O(sequence length)的步数来使相隔较远的单词交互，意味着：

• 难以学习到长距离依赖(因为梯度问题)

• 单词的线性顺序是“内置”的，我们知道顺序结构并不能说明所有情况

![](images/4ec1a1172b3fece9d48abdcff7ad9f49863ddc93bc922c2908c18f593603fc4d.jpg)


 Info of chef has gone through O(sequence length) many layers!

# Transformer的动机

# 3. 最大化可并行性

• 前向和后向传播有 O(seq length) 个无法并行化的操作

• GPU（和 TPU）允许一次执行许多独立计算

• 但是，在计算过去的 RNN 隐藏状态之前，不能完全计算未来的 RNN 隐藏状态

• 难以在非常大的数据集上进行训练

• 随着序列长度的增加，问题尤其严重，因为由于内存限制，无法再将更多样本组合成batch

![](images/3987fe9b0724b3a29d19f8eeaa47457026460987650790e4506d5a86134e1f19.jpg)


# Transformer与(自)注意力

• 概括地说，注意力将每个单词的表示形式视为一个query，用于访问和合并一组values中的信息。

• 之前我们从递归的Seq2Seq模型中了解到了解码器对编码器的关注

• 自注意力(Self-attention) 是编码器-编码器 (或解码器-解码器) 的注意力，其中，每个单词都关注输入（或输出）中的其他单词

![](images/cc266adbbabdf3b8059d0e544f70c27d460fe84b7d4fd8efb0619d89ba525c4d.jpg)


All words attend to all words in previous layer; most arrows here are omitted

# 计算依赖关系

# 递归(recurrence)vs.注意力(attention)的计算依赖关系

![](images/f8359ac91282e92d9b19a27bb3698f6ea473ae6c12fe32ad59dcba18f9a07f53.jpg)


# Transformer编码器-解码器

# [Vaswani et al., 2017]

![](images/00bf0b4cd798c4fa9a60feadf9a49bf4d96d059352c76c55576348b76323af80.jpg)


# 编码器：自注意力


自注意力为Transformer的核心构建块


![](images/02d41679137202b351672d08c3a63a6b697c59cc4bb7103447a83dd92dfe653c.jpg)


# 注意力机制：直观

把注意力当成一个“模糊的”或近似的哈希表：

为了查询一个value，我们需要把query和表中的keys进行比较

在哈希表中(如左下图所示)：

每个query(哈希) 映射到正好一个key-value对

在(自)注意力中(如右下图所示):

每个query和每个key在不同程度上匹配

以query-key的匹配程度为权重，返回values的和

![](images/896b247073a64c5ebb2960cbb714f20b7c3fa56e7bf6fa2b69f2a32ea05f9b39.jpg)


![](images/8b81e44d676df39c76e352296a402a23d6854fa9b8d058e166a72cbcb46c30f5.jpg)


# Transformer编码器的自注意力

• 步骤1：对每个单词 $x _ { i }$ ，计算它的query、key和value：

$$
q _ {i} = W ^ {Q} x _ {i} k _ {i} = W ^ {K} x _ {i} v _ {i} = W ^ {V} x _ {i}
$$

• 步骤2：计算query和key之间的注意力分数：

$$
e _ {i j} = q _ {i} \cdot k _ {j}
$$

步骤3：使用softmax对注意力分数进行归一化：

$$
\alpha_ {i j} = \operatorname {s o f t m a x} \big (e _ {i j} \big) = \frac {\exp (e _ {i j})}{\sum_ {k} \exp (e _ {i k})}
$$

• 步骤4：计算value的加权和：

$$
o u t p u t _ {i} = \sum_ {j} \alpha_ {i j} v _ {j}
$$

![](images/b1e703245782d8843062730e248ec4f6021e8f002bdfbee98ae6e0707299b0cc.jpg)


# Transformer编码器的自注意力

# 向量化的表示形式

步骤1：将词嵌入堆叠为??，计算query、key和value：

$$
Q = X W ^ {Q} \quad K = X W ^ {K} \quad V = X W ^ {V}
$$

• 步骤2：计算query和key之间的注意力分数：

$$
\boldsymbol {E} = Q \boldsymbol {K} ^ {T}
$$

• 步骤3：使用softmax对注意力分数进行归一化：

$$
A = \operatorname {s o f t m a x} (E)
$$

• 步骤4：计算value的加权和：

$$
O u t p u t = A V
$$

$$
\text {O u t p u t} = \operatorname {s o f t m a x} \left(Q K ^ {T}\right) V
$$

# Transformer并非万能

• 问题: 由于没有元素级非线性，自注意力只是简单地对value向量进行重新平均。

• 简单修复：在注意力的输出上添加一个前向层，提供非线性的激活作用 (以及额外的表达能力)

![](images/1f7d10b2e379584480d09521e98bd56f582f3042efbb9437cf1ab57bbfbfb54b.jpg)


![](images/c2a8f8dead0bd2dd13354c56175eaecb0b9419eba430dbdd84be2c553253996f.jpg)


![](images/f190efb7e33ba02ba71179bae119e96794e2617f8b9f774fd8fd3f1792a7759a.jpg)


![](images/9b5db9080351276bb5f2aab1f311149e34e2478cba5e63dd946835be25f13247.jpg)


# Transformer： 训练Trick

# 但怎么在深度网络里面应用？

![](images/f7440bb2022abfe08fd35fa5fbe77e9dc71d1d837e56a0f8f9965146babad22e.jpg)


![](images/612c8b7cb43f95097b8688baa5371e4e7fc29bc694f717751ca614478f1f89c6.jpg)


![](images/b37b23c41af03fd25a12da31ed69e9977144053ce0217fe90497d5f1cee54fb3.jpg)


训练Trick #1：残差连接 (Residual Connections)

训练Trick #2：层归一化 (Layer Normalization)

训练Trick #3：缩放点内积注意力 (Scaled Dot Product

# Transformer： 训练Trick

# Trick #1：残差连接 (Residual Connections)

• 残差连接是计算机视觉领域一个简单但强大的技术

• 深度网络其实在学习恒等函数上，出奇地差

因此，直接传播“未加工的”嵌入到下一层，会有很大的帮助

$$
x _ {l} = F (x _ {l - 1} + x _ {l - 1})
$$

这能够避免网络“遗忘”或扭曲一些重要的信息，因为它被很多层处理

![](images/e1c7b00d3fd36d5cbfa44621f5884461a50642c704c152f4251f6220544f4c02.jpg)


残差连接也被认为能够平滑损失地貌（Loss Landscape）使训练更加容易

![](images/913bb1de4fff4c60cc803752840c61b6686a59fff6c0e19472a5ca52c24eb926.jpg)


![](images/e165496939080568f3a394a78f4165a61eaa10e63b1031315de92b84cb16fbcf.jpg)


[residuals]

# Transformer： 训练Trick

# Trick #2：层归一化(Layer Normalization)

问题：对于给定层，由于它从更底层得到的输入持续发生变换，参数难以训练

解决：在每一层内，通过归一化到均值为和标准差为1，减小方差

Mean: $\mu ^ { l } = \frac { 1 } { H } \sum _ { i = 1 } ^ { H } a _ { i } ^ { l }$  Standard Deviation: $\sigma ^ { l } = \sqrt { \frac { 1 } { H } \sum _ { i = 1 } ^ { H } \left( a _ { i } ^ { l } - \mu ^ { l } \right) ^ { 2 } }$

$$
\boxed {x ^ {\ell \prime} = \frac {x ^ {\ell} - \mu^ {\ell}}{\sigma^ {\ell} + \epsilon}}
$$

Encoder

Repeat 6x(#of Layers)

![](images/e210993a3e23d444812e586ea6603c9be65072d4a9f28d69d4bfa97cab18c3d6.jpg)


![](images/e80282fcfb75acc2ed8d8e5903f157974bad2d4747fc8ffa2b70e0da382b1a6b.jpg)


# Transformer： 训练Trick

# Trick #3：缩放点内积注意力(Scaled Dot Product Attention)

在层归一化之后，向量元素的均值和方差分别为0和1

然而，极端值的出现仍然会极大影响点积的结果，因为它的方差随维度 $d _ { k }$ 缩放

# 回顾统计理论：

• 和的均值=均值的和 $= d _ { k } * 0 = 0$

• 和的方差 $\Bumpeq$ 方差的和 $= d _ { k } * 1 = d _ { k }$

为使方差为1，只需要简单地除以 $\sqrt { d _ { k } }$

![](images/628ce6386486ec2d077b035aeff3899305e7b9e37f3375b7c1aa202775bc2c9f.jpg)


![](images/5b92105ca200881eaf5adbc40af481f1e968fdb186988df7b3840c9c9c6c6aa7.jpg)


更新之后的自注意力公式：

$$
O u t p u t = s o f t m a x \left(Q K ^ {T} / \sqrt {d _ {k}}\right) V
$$

# Transformer： 主要问题

我们已经在编码器中应用了注意力，但还有一个主要问题

• 考虑下列句子:

• “Man eats small dinosaur.”

词语的顺序似乎完全没有对网络产生影响

这是错误的， 因为词序在许多语言(包括英语)中都有意义

$$
O u t p u t = s o f t m a x \left(Q K ^ {T} / \sqrt {d _ {k}}\right) V
$$

![](images/3811e48afa48aded3408a8423fdf9237d19a4c7c2c5cf2d0741d1eb9e29218c4.jpg)



Transformer-Based Encoder-Decoder Model



Man eats small dinosaur


# Transformer： 主要问题

# 解决方法：通过位置编码注入顺序信息

![](images/62b3fbe5b388aadb3866d4e435098f7937228577366426fed65d03ecedbc786f.jpg)


# 自注意力：位置表征

# 解决自注意力的第一个问题：序列的顺序

• 由于自注意力不会构建顺序信息，因此我们需要在 key、queries 和 values 中对句子的顺序进行编码。

• 考虑将每个序列索引(sequence index)表示成向量(vector)

$$
p _ {i} \in \mathbb {R} ^ {d}, f o r i \in \{1, 2, \dots , T \} \mathrm {为 位 置 向 量}
$$

• 不需要关心????是由何而来

• 很容易就能将这种信息整合到自注意力块中：只需要把????加到输入中

• 令??෥??、 $\widetilde { k _ { i } }$ 、 $\widetilde { q _ { i } }$ 为旧的values、keys、queries

$$
v _ {i} = \tilde {v} _ {i} + p _ {i}
$$

$$
q _ {i} = \tilde {q} _ {i} + p _ {i}
$$

$$
k _ {i} = \tilde {k} _ {i} + p _ {i}
$$

在深度自注意力网络里面，只需要在第层这样做。此外，除了直接加之外，也可以采用拼接的方式

# 自注意力：位置表征

# 基于正弦曲线(sinusoids)的位置表征向量（原始）

• 正弦位置表征(Sinusoidal position representations): 连接不同周期的正弦函数:

$$
p _ {i} = \left( \begin{array}{c} \sin (i / 1 0 0 0 0 ^ {2 * 1 / d}) \\ \cos (i / 1 0 0 0 0 ^ {2 * 1 / d}) \\ \vdots \\ \sin (i / 1 0 0 0 0 ^ {2 * \frac {d}{2} / d}) \\ \cos (i / 1 0 0 0 0 ^ {2 * \frac {d}{2} / d}) \end{array} \right)
$$

![](images/86ba063df23239d077171d21514453852a15bd9fb907acc217299ba04c58c013.jpg)


• 优点:

• 周期性表明 “绝对位置”可能没有那么重要

当周期重新开始时，或许可以外推到更长的序列

• 缺点:

• 不可学习

# 扩展：相对位置编码+自注意力

关键: 最突出的位置信息是单词之间的关系（例如，“cat”是“eat”之前的单词），而不是它们的绝对位置（例如， “cat”是单词 2）

 Original Self-Attention Output:

$$
z _ {i} = \sum_ {j = 1} ^ {n} \alpha_ {i j} \left(x _ {j} W ^ {V}\right)
$$

where $\alpha _ { i j } = \frac { \exp { e _ { i j } } } { \sum _ { k = 1 } ^ { n } \exp { e _ { i k } } }$ aij exp eij

$$
e _ {i j} = \frac {\left(x _ {i} W ^ {Q}\right) \left(x _ {j} W ^ {K}\right) ^ {T}}{\sqrt {d _ {z}}}
$$

 Relation-Aware Self-Attention Output:

![](images/9ba41e5ba8f9eb6e23394b5b490c5645b17cdc10cd1c2974a2ef9ca0320d7d34.jpg)


$$
\operatorname {c l i p} (x, k) = \max  (- k, \min  (k, x))
$$

<table><tr><td>k</td><td>EN-DE BLEU</td></tr><tr><td>0</td><td>12.5</td></tr><tr><td>1</td><td>25.5</td></tr><tr><td>2</td><td>25.8</td></tr><tr><td>4</td><td>25.9</td></tr><tr><td>16</td><td>25.8</td></tr><tr><td>64</td><td>25.9</td></tr><tr><td>256</td><td>25.8</td></tr></table>

 We then learn relative position representations

$$
w ^ {K} = \left(w _ {- k} ^ {K}, \dots , w _ {k} ^ {K}\right) \text {a n d} w ^ {V} = \left(w _ {- k} ^ {V}, \dots , w _ {k} ^ {V}\right)
$$

# 多头自注意力

思想：进行多次自注意力操作然后将它们的结果结合起来

![](images/d4cd68f60673a48dc5b7605ead796924ed45168eb8e0964e26f0b38490aff28a.jpg)



[Vaswani et al. 2017]


![](images/729f4f2a4e3075898af1e0269b707dcc392566adae44a41ceaa810ea41fc9141.jpg)



Wizards of theCoast,Artist:Todd Lockwood


# Transformer编码器：多头自注意力

• 如果想要一次查看句子中的多个地方怎么办？

• 对于单词??，自注意力 “查看” $\bar { x } _ { i } ^ { \top } Q ^ { \top } K x _ { j }$ 最高的地方, 但如果因为不同的原因，想要查看不同的??呢?

• 通过构建多个 $Q$ 、 $K$ 、??矩阵，设计多个自注意力“头”

• 令 $Q _ { \ell } , K _ { \ell } , V _ { \ell } \in \mathbb { R } ^ { d \times d / h }$ ，其中 $h$ 为注意力头的个数，ℓ的范围1到 $h$

• 每个注意力头独立地进行注意力操作:

• ????????????ℓ = ?????????????? (????ℓ??ℓ⊤??⊤ ∗ ????ℓ)，其中????????????ℓ ∈ ℝ??/ℎ

• 然后组合所有头的输出

• ???????????? = ??[????????????1; … ; ????????????ℎ]，其中?? ∈ ℝ??×??

• 每个头“查看”不同的东西，并构造不同的value向量

![](images/4c99011c035c7a03cd57da566895f42ad2632a9ffbcae45346d9b9d6ab2e4bbc.jpg)



Credittohttps://jalammar.github.io/illustrated-transformer/


# Transformer编码器：多头自注意力

# 至此，编码器完成，对于解码器：

![](images/7f27eb0d491fdf26e3e8addf2816ceb936557cb13232a7d69528fc9b7aa6b6bc.jpg)


# Transformer解码器：掩码多头自注意力

• 问题：如何防止解码器“作弊”？如果我们有一个语言建模目标，那么网络就不能向前看并 “看到” 答案吗？

• 解决：掩码多头自注意力。概括地说，我们从模型中隐藏（屏蔽）有关未来词元(Token)的信息。

![](images/b87895ee21e950c1d91dcaf28dba7b93b273f549612bf74042d44f1c9c46c292.jpg)


# Transformer Transformer 解码器：掩码多头自注意力

![](images/344ef09101aac00ddb6e25bdb8936583754049acd8702933827c01f76b9f9bc5.jpg)


# 编码器-解码器注意力

可以看到自注意力即key、query、value均有相同的来源

在解码器中，注意力看起来更像我们之前看过的

令ℎ1, … , ℎ?? 为Transformer编码器的输出向量，$h _ { i } \in \mathbb { R } ^ { d }$

令 $z _ { 1 } , \dots , z _ { T }$ 为Transformer解码器的输入向量，???? ∈ ℝ?? $z _ { i } \in \mathbb { R } ^ { d }$

那么，key和value则由编码器取得（像一段记忆一样）:

$$
k _ {i} = K h _ {i} v _ {i} = V h _ {i}
$$

• 并且query从解码器取得，有： $q _ { i } = Q z _ { i }$

![](images/8e466edca74349d5bf22a0da201619aeba71767d801b5d7535bd28b63757b4d3.jpg)


# 解码器：收尾

![](images/67fc18950d1d87c7dc583f6a0ee229bfed37845879c3714fa6c733dcace86cc3.jpg)


# 解码器：收尾

添加一个前馈层 (使用残差连接以及层归一化)

![](images/1ad5d7cf275059e596ccb914531708a0aeeab672612ad35921bc94e1e88c59b0.jpg)


# 解码器：收尾

添加一个前馈层 (使用残差连接以及层归一化)

添加最终线性层，将嵌入投影到一个比词汇量大小更长的向量中（对数概率）

![](images/4268c458fc82fc8d567c5c4cfd62affb3180d51d33de84a73b735d4726615b98.jpg)


# 解码器：收尾

添加一个前馈层 (使用残差连接以及层归一化)

添加最终线性层，将嵌入投影到一个比词汇量大小更长的向量中（对数概率）

添加Softmax层，生成下一个可能单词的概率分布

![](images/37b8f70fbb2c5f596186fa755fe5a5127835b6b5a90d937840448d773b8423a7.jpg)


# Transformer完整架构

![](images/72e8838e1fcae939ba51dc2ea135b6b5a2c14413e9241106f24fb99269182d29.jpg)


# 谢谢大家！

相关课程资源及参考文献请浏览

超算习堂：https://easyhpc.net/course/143