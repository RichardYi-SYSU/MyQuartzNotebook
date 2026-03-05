# 人工智能：搜索技术 I

![](images/44d93ecd9eea1e4d396c19c7fb1723db735318acdacac6292716c7a9fae5a92f.jpg)


![](images/4bb9d8d414d8d32cec05a0d22ca4093c076df6a5ab6f3bbeda27453c31be9706.jpg)


授课对象：计算机科学与技术专业 二年级

课程名称：人工智能（专业必修）

节选内容：第四章 搜索技术 I

课程学分：3学分

# 搜索定义

# 搜索Search

◼ Problem solving by search 搜索可以解决的问题

◼ Uninformed search 盲目（无信息）搜索

◼ Heuristic search 启发式（有信息）搜索

# 搜索Search

◼ 搜索在游戏策略中取得了较好的结果

◼ 其它人工智能问题中也可以应用搜索算法


Finite State Machine


![](images/1cb199ad3784a9a46c9b8998e1a472849f3e018dd21a7f92b383e128a2a40d00.jpg)


# 搜索Search

# Monte Carlo Search Tree Algorithm

![](images/4db8f47f973f4d3a59f7f3c114c5e178407e19d4c1c7d131cd70e1bc6ef62856.jpg)


![](images/b3c365a282013ad1bc61fa3bbd29313d55f275efd6e91af861bf988e2d170fb9.jpg)


![](images/2a3163499d25de62cc50bfbd19414e95a83f611b4004a33980798c92db74b08e.jpg)


![](images/64a6180771a08cd9000495fed8b91cd7d5e46853e712b0ae6d2f82da943c66d3.jpg)


# 搜索Search

◼ 搜索在游戏策略中取得了较好的结果

◼ 其它人工智能问题中也可以应用搜索算法

# Practical

⚫ Many problems don't have specific algorithms for solving them.Casting as search problems is often the easiest way of solving them.

⚫ Problem specific heuristics provides search with a way of exploitingextra knowledge.

# 搜索Search

# Search Problems

![](images/f1a975247a22a39edc785889f9de92be5c74e4e7903479e07d629d41570c3524.jpg)


![](images/6ab27b564a7f1dae9d111ec345d21c3091e52a16e52613dad9ac3c8d687f749f.jpg)


![](images/e97cca7ca4acb3d5266b2a30896d1ba7746a4c56a041355dd6a941d34197c820.jpg)


![](images/92f08ddcc0031f31d1bf8f1e6f3d429e16491fc495cb7e2b607ee76c86bba036.jpg)


![](images/557cbaf6070cf010ab7fccaf688e869ea67bcf039205f1b9bb6d24d41ebfc904.jpg)


![](images/31c44dd44930f03f70a1b9465a5a205bf038b6b454b18ae1645e3d2096e4fd21.jpg)


![](images/acfca71f2b01c356137e393762d0d52121c23404e0eb6eb383cc9d750f4e102a.jpg)



Slide7


# 搜索Search

# More search problems

![](images/0d397640ccc21d95be7e5a0b4bb5329f5f118dac1ce634118d14fc14ddd54004.jpg)


![](images/e833ec25b261f010d90cb3529a9c27c43a8687620dbb2c3c16548328a647e845.jpg)


![](images/33915e63abc22fde1100a85bd06d8c055b80c7a0483037d74718e9ba416005f8.jpg)


# 搜索Search

# A Search Problem:How do Agent make decisions?

• This kind of hypothetical reasoning involves asking

— what state am I ? 我在哪？

what actions can I take? 我能干吗？

— what state should I achieve？我到哪里去？

• From this we can reason about particular sequences of actionsone should try to bring about to achieve a desirable state.

• Search is a computational method for capturing a particularversion of this kind of schedule.

# 搜索Search

![](images/54eeaf5bc133f55b18e352e3770160b34ebbd91ca6da03d7de686365e8e5c8e1.jpg)


— what state am I ?

Current resources

— what actions can I take?

Defend/Build Tech/Attack

— what state should I achieve？

Defeat the player

Limitation of Search：Search only shows how to solve the

problem once we have the problem correctly formulated.

# 形式化定义

我们需要考虑下面几个部分来对搜索问题进行形式化定义：

◼ 状态空间(state space)：表示需要进行搜索的空间。状态空间是对问题的形式化

◼ 动作(action)：表示从一个状态到另一个状态。动作是对真实的动作的形式化

◼ 初始状态(initial state)：当前状态的表示

◼ 目标(goal)：需要达到的目标状态的表示

◼ 启发式方法(heuristics)：用于指导搜索的前进方向

◼ 解(solution): 是由 “动作”构成的序列

# 形式化定义

Once you have a formalized search problem, there are a number of algorithms one canuse to solve it.

A solution is a sequence of actions or moves that can transform your current state into astate where desired (or goal) conditions hold. 问题的解是由“动作”构成的序列。序列中的动作可以将初始状态转化为目标状态。

![](images/08415e9569737ffd118def5b57b2035737e0346f12cd9e1ba5b125d6850c2d24.jpg)


# 例1：Romania Travel

Currently in Arad, need to get to Bucharest ASAP.

Can we formalize this search?

![](images/a19df16b39dbcee23f4684193d0504b370434bbdd1e50e1e5e8754cab6af2a8a.jpg)


– state space:

actions (successorfunctions):

– initial state:

– desired (or goal)condition:

# 例1：Romania Travel

Currently in Arad, need to get to Bucharest ASAP.

Can we formalize this search?

![](images/9e8cd1db92a75cc3a35975eec71523d70dabba70916ea85d4aca3b6b76916c65.jpg)


– state space

可以到达的任一个城市

– actions

在相邻的城市之间移动

initial state

在城市Arad

– desired (or goal) condition

在城市Bucharest

问题的解：旅行路线，即从Arad到Bucharest途径城市组成的序列

# 例2：Water Jugs

We have a 3 gallon (liter) jug and a 4 gallon jug. We can filleither jug to the top from a tap, we can empty either jug, orwe can pour one jug into the other (at least until the otherjug is full).

![](images/a7132df073667bd987646e4979f99f40bf139bafdcf481586a3773980145cb23.jpg)



Fig: Water Jug Problem


# 例2：Water Jugs

–state space:

pairs of numbers (gal3, gal4) where gal3 is the number ofgallons in the 3 gallon jug, and gal4 is the number ofgallons in the 4 gallon jug.

–actions (successor functions):

Empty-3-Gallon, Empty-4- Gallon, Fill-3-Gallon, Fill-4-Gallon, Pour-3-into-4, Pour 4-into-3.

–initial state:

Various, e.g., (0,0)

–desired (or goal) condition:

Various, e.g., (0,2) or (1, 3)

![](images/9cc4684ad30b089205cb9ab9e42fad8a8557c2ece26e215d6cd7fff8240da234.jpg)


![](images/69984c13495d5fcc339d19be2c150f06d26c3a0de25ad50921b8378b0a38be32.jpg)



4L:0


![](images/71af1b30ff17f9cc52e2cd668f0d07f01296bf0c94b2f180cd4b3a30064b9efa.jpg)



4L:3



3L:0


![](images/19d57efd2e98453f4e77e82e2454d74ac7d48845f92e228adf72b9e021fc9151.jpg)


![](images/fb12c1c9345d4b9030a148fb785dbe1c3a06f876f801982de2967260901ce819.jpg)



4L:4



3L:2


![](images/459dfa1f462129d279a34f1ef547ced9149f1d4b1d3b8e249ae935e1a58534ed.jpg)



4L:0



3L:2


![](images/ec1eddb9536f77a8977e9af24915ed053f713e15d1d2b1dac3e1bcc7f6cfa8f3.jpg)



4L:2



3L:0


# 例2：Water Jugs

– If we start off with gal3 and gal4 as integers, can only reachinteger values.

– Some values, e.g., (1,2) are not reachable from some initialstate, e.g., (0,0).

– Some actions do not change the state, e.g.,

• (0,0) → Empty-3-Gallon → (0,0)

# 例3：The 8-Puzzle/八数码问题

![](images/b9b8a1e6ee9ae7d3ddef3e487563b20f64e94a6996536dd7d2de8d8f3cfe9c8d.jpg)


![](images/44ac304b0360f57cee9b05b6ce4e22a1b5000b8a77e5cbea63ac116753cd8b7e.jpg)


规则：可以把空格移动到相邻的位置（也可以视为移动空格到临近的数字的位置）

# 例3：The 8-Puzzle

![](images/0fb488a9a75a047856c7084bfc1fabeae7e90d7a055ac298ba2bb617fe42250d.jpg)



Start State


![](images/499c44c0e892d1a3a497c069cc60b7f514da9a7dc9c7ee644895a7edb715f997.jpg)



Goal State


$\bullet$ 状态空间:

各种不同的方格摆放方式

$\bullet$ 初始状态:

左图所示的方格摆放方式

$\bullet$ 目标:

右图所示的方格摆放方式

动作:

向上/下/左/右移动空格

规则：可以把空格移动到相邻的位置

目标：从初始数字排布变换出目标的数字排布方式

# 例3：The 8-Puzzle

![](images/64292b3b9410a0c3d2be5b9284253efe310c9792c8066f288dd587a94dd65858.jpg)



Search Space for 8‐Puzzle Problem


# 例3：The 8-Puzzle

#  八数码难题属于滑块难题

![](images/5569e38eb800f8e9d96fb4cf7382a0c8bd60c0ee5487d0a5ddbd91247e17cad5.jpg)



漫画人物


![](images/e25fcf05b69580019a531fe31149114f5c86f0b39d1a3fd80ea5b00b1d929dbe.jpg)



英语拼词


![](images/cd499f17fef74385f202aa39667087ba93ecc85d957cc254549f569ba6ba3acb.jpg)



华容道


滑块难题又属于二维组合谜题（2D combination puzzle）

此外，还有三维组合谜题（3D combination puzzle），例如魔方

# 搜索问题形式优化

◆ 前面的示例中，一个状态是对应一个真实世界中的状态

然而，一个状态也可以对应智能体如何认识世界的情况：智能体的认知状态（ the agent’s knowledge state. ）

# 例4： 吸尘器世界

# 问题描述：

• 有一个吸尘器需要清扫两个房间

• 每个房间有两个状态：

干净或不干净

• 吸尘器有向左(left)和向右(right)两个动作（左边/右边没有房间时动作不起作用）

• 吸尘器有吸尘(suck)的动作，该动作使得吸尘器所在的房间状态变为干净（即使房间本身就是干净的）

![](images/43b554c40995a1bacc74870e5f12fbddcc63504d52c3ae0eb3facb20d4af0608.jpg)


![](images/19f56bbaa7491c7b3825dacd6458d5cfdecf7b047be5970e3dbe9118e15f1ea7.jpg)


![](images/fa34fad35d42eeff78440cc59afefd83850fb551119b0981e2c3d0094efc1715.jpg)


![](images/b2b728df07d449b7f9aaf490548322bdd00071677f0dec083feae127e1390804.jpg)


![](images/f74cc35e7bdb7e59dbb7aa4bef206d72c015cf3b709ca21b28d00ca0c57f689a.jpg)


![](images/1e459c8efe65fc968d6d99d55a87daff56265e77800774c5e5ef52e64d05b4f0.jpg)


![](images/b2ce45ab774a3dd5942e1df7c8cc7ee42bfd35550973e7b31e1d36bc6bf2fb48.jpg)


![](images/84a2501efc6e2e0968361bb80f0bff3d74acd8f0420f28232083f5c1e41af039.jpg)


物理状态

# 例4： 吸尘器世界

# 认知层面的状态空间

•一个认知状态是物理状态空间的一个子集。也就是智能体知道自己处于几个物理状态中的一个状态中，但是不知道具体是哪一个。

![](images/16ef601894d132d2b8eaf8b9190f3bb429a8197a11fec58c69d692a4047b33d7.jpg)


![](images/f820e4043efcf38b392b016635348402484bbff4b20711b0e90d45257c6f43cf.jpg)


![](images/18c93049367e33dcab4a9517aacbf067d84f4f5a39903acc8688378874266e58.jpg)


![](images/b3349597852aea288dc769bce074f7c6dd406a9b827228e3d9011868eb0698d2.jpg)


![](images/f6c30d4e7745206024ecb854d991470919fcec19cbb4daf81099c395c5306459.jpg)


![](images/81fc05ed385fa5559220bb5f6fc13cf0bdf6e13e4dd06b380fdd020877e96709.jpg)


![](images/0123eea7af9dc40e6d89094874b92e5e233924d9cc340835842934c7430e5276.jpg)


![](images/64b17e30304c97c6dbdeff8cfbe2e790162af714ae08ecad15783afffee4b7be.jpg)


目标是所有房间的状态都为干净

# 例4： 吸尘器世界

# 认知层面的状态空间

•完全不清楚物理世界

认知状态是物理状态的集合

•初始认知状态为{1,2,3,4,5,6,7,8}

智能体不知道自己身处具体是哪个物理状态

•但不论如何，动作序列 <right, suck,left, suck> 都可到达目标，认知状态的变化情况如下

$$
\{1, 2, 3, 4, 5, 6, 7, 8 \} \text {r i g h t} \rightarrow \{2, 4, 6, 8 \}
$$

$$
\mathrm {s u c k} \rightarrow \{4, 8 \} \mathrm {l e f t} \rightarrow \{3, 7 \} \mathrm {s u c k} \rightarrow \{7 \}
$$

1

![](images/b4162d06b59d2fe9c9a7a92fdb4c461ed7e42271fc0e9b6c2e8a439e3e25e69a.jpg)


![](images/1facfc870b01dc7edf98ee2ed3a81caaeb0ecc74cbb8e66362438eccd85bdb4c.jpg)


![](images/8b0f70be754259c707329668b8471195c98ff74334762d395062835666acf9e7.jpg)


![](images/4671ed4966e40d22bd48af4a233e76b13452d61b1d431431f827abe2a0d503d4.jpg)


2

![](images/0b3817610ab3d07d4b065d0830961d071c7daa5c37e0d606fa2c317ff68fbaa9.jpg)


4

![](images/6f96fb161dac7194fed3aa986727947db416581fc100772af335827b1a79b7e5.jpg)


6

![](images/02e2837b10a15ae9033f61511e0c8cd36a76678e4f9b66b4f9caec9778f30231.jpg)


8

![](images/a257cf4aa6b93d4108739b7b8e6460de83712b5f3b55c2c09a8548c949749cfb.jpg)


目标是所有房间的状态都为干净

# 搜索算法

# 算法输入

• 具体的初始状态：一个具体的物理状态，或是一个物理状态的集合表示的智能体的认知状态，等等

• 后继函数： $\begin{array} { r l } { \mathrm { ~ } } & { { } = \left\{ \begin{array} { l l } { \begin{array} { r l r l } \end{array} } \end{array} \right. } \end{array}$ 状态经过一个动作之后可以到达的状态的集合}

• 目标测试：一个作用于状态上，当该状态满足目标条件时返回真的函数

• 前进成本： ${ \mathsf { C } } ( \mathsf { x } , a , \mathsf { y } ) =$ 从x状态通过动作a到达y状态所需要的成本 (x状态无法到达y状态时， $\forall _ { a } \mathsf { C } ( \mathsf { x } , a , \mathsf { y } ) = \infty )$

# 算法输出

• 从初始状态到某个满足目标测试的状态的状态序列

# 获取动作系列

• 状态 $\pmb { \mathsf { X } }$ 的后继状态可能来自不同的动作，如：

• $x  a  y$

• $x  b  z$

• 后继函数 S(x) 返回的状态集合中的状态是状态 $\pmb { \times }$ 通过任何一个动作能达到的状态，因此需要把来自不同动作的后继状态加以区分

• 因此修改 $\mathsf { S } ( { \boldsymbol { \mathsf { x } } } )$ 的返回值，不仅包括后继状态，还要记录获得这个后继状态所经过的动作

• ${ \sf S } ( \boldsymbol { \times } ) = \{ < \boldsymbol { \gamma } , \boldsymbol { a } > , < \boldsymbol { \gamma } , \boldsymbol { b } > \}$

状态 y 通过动作 $\cdot$ 得到，状态 z 通过动作 $\cdot$ 得到

• $S ( x ) = \{ < y , > , < y , > \}$

状态 y 通过动作 $\cdot$ 得到，状态 y 通过动作 $b$ 得到

# 算法框架

We put states we we haven’t yet explored or expanded, but want toexplore, in a list called the Frontier边界 (or Open 表).

还没有被探索，但准备下一步探索的状态的集合

Initially, all that is in the Frontier is the initial state.

初始边界 $=$ 初始状态集合

• At each iteration, we pull a node from the Frontier, apply S(x), andinsert children back into the Frontier.

TreeSearch(Frontier，Sucessors,Goal?)

If Frontier is empty return failure

Curr $=$ select state from Frontier

If (Goal?(Curr)) return Curr.

Frontier' $=$ (Frontier - {Curr}) U Successors(Curr)

return TreeSearch(Frontier'， Successors,Goal?)

# 树搜索

树搜索：用搜索树来寻找一条从起点A 到终点 M 的路径。

![](images/1ef81bb51d799ee5d8a40d4a3dd3007222cbde6e1932378065c58faedee5c318.jpg)


# 树搜索

![](images/d1efd0750eb72585f188f0278a03ef47a4d4f40994438f0bb1baf5542e78b627.jpg)



第1步


![](images/d7d2b42a5d7e9ed79c55d8931f8413e5f10c378b183b537d20bee265e5c58133.jpg)



第3步


![](images/e16d8cb8d28ec1aeb421e7a51a4abc5841f2b813257b95838f259072b8d88dc3.jpg)



第2步


![](images/fc945ebbceffc2490846957f6e06782917f91ec110d2aebc07dd3374d430db2d.jpg)



第4步


A为根节点、M为叶节点。

虚线表示节点尚未生成。

$\clubsuit$ 粗实线为已生成节点。

$\clubsuit$ 已扩展节点加阴影表示。

![](images/33c4d25ee6f4328810a98558bcceee8864c308a112f38af54c61cc1885088947.jpg)


# 示例：罗马尼亚旅行问题

![](images/3922d4219bae927b4fc05cc3ecede9421fe5cda640338ab90fb9433ce1bd0463.jpg)


1. Initial nodes on the Frontier: {Arad}.

2. Expand Arad: {Z<A>, T<A>, $\leq < A > \}$

3. Expand Sibiu: $\{ Z { < } \mathsf { A } >$ , $\mathsf { T } { \mathsf { { < } } } \mathsf { A } \mathsf { { > } }$ , ${ \mathsf { A } } { < } { \mathsf { S } } , { \mathsf { A } } { > }$ , $O { < } S , A { > }$ , F<S,A>, R<S,A>}

4. Expand Fagaras: $\{ Z { < } \mathsf { A } >$ , $\mathsf { T } { \mathsf { { < } } } \mathsf { A } \mathsf { { > } }$ , ${ \mathsf { A } } { < } { \mathsf { S } } , { \mathsf { A } } { > }$ , O<S,A>, R<S,A>,${ \tt S } { < } \mathsf { F } , { \tt S } , \mathsf { A } { > }$ , B<F,S,A>}

Solution is now on frontier; cost of this solution is $1 4 0 + 9 9 + 2 1 1 = 4 5 0$

# 示例：罗马尼亚旅行问题

![](images/cb6c291d7cf46fd23f3d5e371de88648aa294bb6a65df02094f9593d81e2d196.jpg)


1. Initial nodes on the Frontier: {Arad}.

2. Expand Arad: {Z<A>, T<A>, S<A>},

3. Expand Sibiu: $\{ Z { < } \mathsf { A } >$ , T<A>, A<S,A>, O<S,A>, F<S,A>, R<S,A>}

4. Expand R.V.: $\{ Z { < } \mathsf { A } >$ , T<A>, A<S,A>, O<S,A>, R<S,A>, S<R,S,A>,P<R,S,A>, $C < R , S , A > )$

5. Expand Pitesti: $\{ Z { < } \mathsf { A } >$ , $\mathsf { T } { \mathsf { { < } } } \mathsf { A } \mathsf { { > } }$ , ${ \mathsf { A } } { < } { \mathsf { S } } , { \mathsf { A } } { > }$ , O<S,A>, R<S,A>, S<R,S,A>,$\mathsf { P { < R , } S , } A >$ , ${ \mathsf { C } } { \mathsf { < R } } , { \mathsf { S } } , { \mathsf { A } } { \mathsf { > } }$ , R<P,R,S,A>, C<P,R,S,A>, B<P,R,S,A>}

Solution is now on frontier; cost of this solution is $1 4 0 + 8 0 + 9 7 + 1 0 1 = 4 1 8$

# 示例：罗马尼亚旅行问题

![](images/28dec27946ef524f8e54767908e610ad698f368bcaf282bbf80214de27d19cbf.jpg)


# Solution 2:

{Arad}

{Z<A>, T<A>, S<A>},

{Z<A>, T<A>, A<S,A>, O<S,A>, F<S,A>, R<S,A>}

{Z<A>, T<A>, A<S,A>, O<S,A>, F<S,A>, S<R,S,A>, P<R,S,A>, C<R,S,A>}

{Z<A>, T<A>, A<S,A>, O<S,A>, F<S,A>, S<R,S,A>, C<R,S,A>, R<P,R,S,A>, C<P,R,S,A>, Bucharest<P,R,S,A>}

Solution: Arad -> Sibiu $\mathbf { \varepsilon } _ { - > }$ Rimnicu Vilcea $\mathbf { \varepsilon } _ { - > }$ Pitesti $\mathbf { \varepsilon } _ { - > }$ Bucharest Cost:

140 + 80 +

97 $\mathbf { + 1 0 1 } = 4 1 8$

# Solution 1:

{Arad},

{Z<A>, T<A>, S<A>},

{Z<A>, T<A>, A<S;A>, O<S;A>, F<S;A>, R<S;A>}

{Z<A>, T<A>, A<S;A>, O<S;A>, R<S;A>, S<F;S;A>, B<F;S;A>}

Solution: Arad $\mathbf { \varepsilon } _ { - > }$ Sibiu $\mathbf { \varepsilon } _ { - > }$ Fagaras $\mathbf { \varepsilon } _ { \mathbf { - } \mathbf { > } }$ Bucharest

Cost: $1 4 0 + 9 9 + 2 1 1 = 4 5 0$

# 示例：罗马尼亚旅行问题


Search Tree Representation


![](images/ef2aa84b7d93dbf990a1de44076e43165c78354421cb39533ad63903b8a2beff.jpg)


![](images/8deeb30fdad0f1ccb1d1867022574f66c688ccb6ef8cb7879ce800b955c1090e.jpg)


# 示例：罗马尼亚旅行问题


Reflections on Example


![](images/2287cd1f1fd28daa86520831d143c20115d5eb9655904e506a45ea083b654034.jpg)


In this problem, the Frontier here contains a set of paths, not juststates. 边界不仅是状态的集合而是路径的集合

# 示例：罗马尼亚旅行问题

# Reflections on Example

![](images/63d62343df997b185f1e182687973882642752efb480b4a30afb3060a5c56ddf.jpg)


The order states are selected from the Frontier has a critical effect on表明了状态选择的顺序会对搜索操作产生重要的影响

• Whether or not a solution is found会影响搜索是否能找到解

• The cost of the solution that is found.会影响搜索到的节的成本大小

• The time and space required by the search.会影响搜索过程中所需要的时间和空间资源

# 循环问题

![](images/ff6c4ad51ffb6dbcab6420e823dfb8b3e98a09b13d4e13dbcbc0405eaee79275.jpg)


{Z<A>, T<A>, S<A>},

{Z<A>, T<A>, O<S;A>, F<S;A>, A<S;A>, R<S;A>}

{Z<A>, T<A>, O<S;A>, F<S;A>, R<S;A>, Z<A;S;A>, T<A;S;A>, S<A,S,A>}

边界不是状态的集合而是路径的集合，因此只要路径不同就会往边界上添加新的元素，导致了循环问题

# 搜索算法的重要特征

◼ 完备性（Completeness）: 搜索算法是否总能在问题存在解的情况下找到解

最优性（Optimality）: 当问题中的动作是需要成本时，搜索算法是否总能找到成本最小的解

时间复杂度（Time complexity）: 搜索算法最多需要探索/生成多少个节点来找到解

◼ 空间复杂度（Space complexity）: 搜索算法最多需要将多少个节点储存在内存中

# 盲目搜索

# 选择法则

上面的例子表明了状态选择的顺序会对搜索操作产生重要的影响:

会影响搜索是否能找到解

会影响搜索到的解的成本大小

◼ 会影响搜索过程中所需要的时间和空间资源

# 搜索算法的重要性质

◼ 完备性（Completeness）: 搜索算法是否总能在问题存在解的情况下找到解

◼ 最优性（Optimality）: 当问题中的动作是需要成本时，搜索算法是否总能找到成本最小的解

◼ 时间复杂度（Time complexity）: 搜索算法最多需要探索/生成多少个节点来找到解

◼ 空间复杂度（Space complexity）: 搜索算法最多需要将多少个节点储存在内存中

# 盲目搜索策略

◼ 这些策略都采用固定的规则来选择下一需要被扩展的状态

◼ 这些规则不会随着要搜索解决的问题的变化而变化

◼ 这些策略不考虑任何与要解决的问题领域相关的信息

# 常用的盲目搜索方法

宽度优先（Breadth-First）

深度优先（Depth-First ）

◼ 一致代价（Uniform-Cost）

深度受限（Depth-Limited）

迭代加深搜索（Iterative-Deepening search）

# 边界中的节点选择

⚫ Selection can be achieved by employing an appropriate ordering of thefrontier set, i.e.:

1. Order the elements on the Frontier.对边界上的元素进行排序

2. Always select the first element.总是选择第一个元素

⚫ Any selection rule can be achieved by employing an appropriate orderingof the frontier set.

任何选择规则都可以视为对边界采用某种合适的排序方式

# 宽度优先搜索

• 把当前要扩展的状态的后继状态放在边界的最后 {0<>}

• 例子:

• 假设使用正整数表示状态 {0,1,2,…}

• 状态n的后继状态为状态 $\mathsf { n } { + } 1$ 和状态 $n + 2$

• 如： ${ \mathsf { S } } ( 1 ) = \{ 2 , 3 \} ; { \mathsf { S } } ( 1 0 ) = \{ 1 1 , 1 2 \}$

• 初始状态为0

• 目标状态为5

{1,2}

{2,2,3}

{2,3,3,4}

{3,3,4,3,4}

{3,4,3,4,4,5}

# 宽度优先搜索

• 把当前要扩展的状态的后继状态放在边界的最后 {0<>}

• 例子:

• 假设使用正整数表示状态 {0,1,2,…}

• 状态n的后继状态为状态 $\mathsf { n } { + } 1$ 和状态 $n + 2$

• 如： ${ \mathsf { S } } ( 1 ) = \{ 2 , 3 \} ; { \mathsf { S } } ( 1 0 ) = \{ 1 1 , 1 2 \}$

• 初始状态为0

• 目标状态为5

{1,2}

{2,2,3}

{2,3,3,4}

{3,3,4,3,4}

{3,4,3,4,4,5}

# 宽度优先搜索

1. Place Start in the Frontier.

2. Expand all nodes reachable from Start in 1 step,

3. but not more than 1; add path to back of Frontier list.

4. Expand all nodes reachable from Start in 2 step, but notmore than 2; add path to back of Frontier list.

5. Expand all nodes reachable from Start in 3 step, but notmore than 3; add to path back of Frontier list.

6. And so on ….

![](images/a7f20323c726bca7cb121603756d6ed9e0ba9bdd766696843cafabb2f69ac9d2.jpg)


# 宽度优先搜索

![](images/1d741b67c930079627fb00b6e5a182a9908b6962109f8afeb1c9c26e5aeb67aa.jpg)


# 宽度优先搜索

![](images/b0243b0581ec9a63ab891f3b2d8db27d389c74a1a1920353327ebdbbd2b8c25f.jpg)


# 宽度优先搜索

![](images/61b7f0d5c290825d33233c7d629313987b806cddcb2e7ac1d0a6c0e7ae020d65.jpg)



Slide 15


# 宽度优先搜索

![](images/77922931f710969af8f41ebaa21888c897f8817173fd161a0150641e70420d7c.jpg)


# 宽度优先搜索

![](images/78245aaec5e8149c84877ce5bcf0e45172dacd5ade78ae3aac6d4046e0b61481.jpg)


# 宽度优先搜索

![](images/e1149b8c7645199c750de4f99de42feebc49376e659484090ae5f6e7b52bf9b6.jpg)


# 宽度优先搜索 for Water Jug

Level O

Level 1

Level 2

![](images/d71fa36e82da7801cfc878d74a359885dadc047f053cbc81605e1d6a83067842.jpg)


In the tree above we order the states explored; paths to states arerepresented by the path from the root to that states.

Breadth‐First Search explores the search space level by level.

# 宽度优先搜索 for Water Jug

initial state $=$ (0,0), goal state $=$ (*,2), actions(successor functions): Empty-3-Gallon, Empty-4-Gallon, Fill-3-Gallon, Fill-4- Gallon, Pour-3-into-4,Pour 4-into-3.

1.Frontier = {<(0,0)>}

2.Frontier = {<(0,0),(3,0)>, <(0,0),(0,4)>}

3.Frontier = {<(0,0),(0,4)>, <(0,0),(3,0),(0,0)>,

$$
<   (0, 0), (3, 0), (3, 4) >, <   (0, 0), (3, 0), (0, 3) > \}
$$

$$
\begin{array}{l} <   (0, 0), (3, 0), (0, 3) >, <   (0, 0), (0, 4), (0, 0) >, \\ <   (0, 0), (0, 4), (3, 4) >, <   (0, 0), (0, 4), (3, 1) > \\ \end{array}
$$

# 宽度优先的性质

$$
\begin{array}{l} b = \mathrm {问 题 中 一 个 状 态 最 大 的 后 继 状 态 个 数} \\ d = \mathrm {最 短 解 的 动 作 个 数} \\ \end{array}
$$

宽度优先搜索具有完备性和最优性

◼ 短的路径会在任何比它长的路径之前被遍历

◼ 给定路径长度，该长度的路径是有限的

◼ 最终可以遍历所有长度为d的路径，因此一定可以找出最短的解

时间复杂度: $1 + b + b ^ { 2 } + \ldots + b ^ { d } + b ( b ^ { d } - \ 1 ) = { \cal O } ( b ^ { d + 1 } )$

空间复杂度: $b ( b ^ { d } - \mathrm { ~  ~ \nabla ~ } 1 ) = O ( b ^ { d + 1 } )$

![](images/739c343cae665a25ad34f698bfe3744b02456c2538835852ee2711d2dd82ab36.jpg)


# 空间复杂度会带来的问题

• 假设 b = 10, 并且每秒扩展1000个节点，每个节点需要100bytes来存储：

<table><tr><td>Depth</td><td>Nodes</td><td>Time</td><td>Memory</td></tr><tr><td>1</td><td>1</td><td>1 millisecond.</td><td>100 bytes</td></tr><tr><td>6</td><td>106</td><td>18 mins.</td><td>111 MB</td></tr><tr><td>8</td><td>108</td><td>31 hrs.</td><td>11 GB</td></tr></table>

• 实际情况下，内存需求会先于时间限制算法的运行

# 深度优先搜索

• 把当前要扩展的状态的后继状态放在边界的最前面

• 边界上总是扩展最深的那个节点

与宽度优先搜索的示例比较：

深度优先：

{0}

{1,2}

{2,3,2}

{3,4,3,2}

{4,5,4,3,2}

{5,6 4,5,4,3,2}

宽度优先：

{0}

{1,2}

{2,2,3}

{2,3,3,4}

{3,3,4,3,4}

{3,4,3,4,4,5}

# 深度优先搜索

initial state $=$ (0,0), goal state = (*,2), actions (successor functions)

$=$ Empty-3-Gallon, Empty-4-Gallon, Fill-3-Gallon, Fill-4-Gallon, Pour-3- into-4,Pour 4-into-3.

1. Frontier $= \{ < ( 0 , 0 ) > \}$

2. Frontier = {<(0,0), (3,0)>, <(0,0), (0,4)>}

3. Frontier = {<(0,0),(3,0),(0,0)>, <(0,0),(3,0),(3,4)>,

$$
<   (0, 0), (3, 0), (0, 3) >, <   (0, 4), (0, 0) > \}
$$

4. Frontier = {<(0,0),(3,0),(0,0),(3,0)>, <(0,0),(3,0),(0,0),(0,4)>

$$
<   (0, 0), (3, 0), (3, 4) >, <   (0, 0), (3, 0), (0, 3) >, <   (0, 0), (0, 4) > \}
$$

Level 0

Level 1

Level 2

Level 3

![](images/57eebfb4108ead327c8371af2081c0c60e0c4a2b4004a8c31036cea48c94c97a.jpg)


Red nodes are backtrack points (these nodes remain on Frontier).

# 深度优先的性质

# 完备性:

在状态空间无限的情况下: No

◼ 在状态空间有限，但是存在无限的路径（例如存在回路）的情况下: No

$$
e. g., S (0) = \{1, 2 \}, S (1) = \{0 \}, i n i t s t a t e 0, g o a l i s 2
$$

◼ 在状态空间有限，且对重复路径进行剪枝的情况下：Yes

最优性: No 存在多条路径时，最先发现的不一定最优

# 时间复杂度

# 时间复杂度为： $O ( b ^ { m } )$

其中m是遍历过程中最长路径的长度 (Could explore each branch of searchtree)

当m远远大于d时，时间效率会很差

当存在多条解路径的情况下深度优先搜索可以比宽度优先搜索更快找到解 (可以碰运气先遍历了到达解的那条路径).

# 空间复杂度

# 空间复杂度：

深度优先回溯点 $=$ 当前路径上的点的未扩展过的兄弟节点

一次只会考虑一条路径

边界上只包含当前探索的最深的节点，以及回溯点

O(bm), 线性复杂度是深度优先搜索一个显著的优点

![](images/3d952db3d5f64752014b1a23abf309e08687c62b4d1163503c75653c44b03d56.jpg)


# 致代价搜索

边界中，按路径的成本升序排列

总是扩展成本最低的那条路径

◼ 当每种动作的成本是一样的时候，和宽度优先是一样的

# 一致代价搜索性质

假设每个动作的成本 ≥ s > 0

◼ 一致代价搜索中，所有成本较低的路径都会在成本高的路径之前被扩展

给定成本，该成本的路径数量是有限的

◼ 成本小于最优路径的路径数量是有限的

最终，我们可以找到最短的路径

当最优解的路径长度为 $d$ 时，宽度优先搜索的时间和空间复杂度都是 $O ( b ^ { d + 1 } )$

对于一致代价搜索，当最优解的成本为 $C ^ { * }$ ，则时间和空间复杂度为O(bC∗/s+1)

# 深度受限搜索

◼ 宽度优先搜索存在空间复杂度过大的问题

◼ 深度优先搜索存在可能运行时间非常长，甚至在存在无限路径时无限运行下去的问题

深度受限搜索

◼ 深度优先搜索，但是预先限制了搜索的深度 L

◼ 因此无限长度的路径不会导致深度优先搜索无法停止的问题

◼ 但只有当解路径的长度 $\leq L$ 时，才能找到解

# 深度受限搜索

```txt
DLS (Frontier, Successors, Goal?) /* Call with Frontier = {<START>} */  
WHILE (Frontier not EMPTY) {  
    n= select first node from Frontier  
    Curr = terminal state of n  
    If(Goal?(Curr)) return n  
    If Depth(n) < D //Don't add successors if Depth(n) = D!!  
        Frontier = (Frontier - {n}) U Successors(Curr)  
    Else  
        Frontier = Frontier - {n}  
        CutOffOccured = TRUE.  
}  
return FAIL
```

# 示例


Limi


![](images/50daf12f99d8fff33598537ddaf77782558c9bce22619a3fe1c003510a56a2bb.jpg)


![](images/64523ade9221d834fa44abe00a6431e6cf9bbcba248f92d220bd362a4d648595.jpg)


![](images/0b5bb0baada624cf6f8bf49303177519b7332e03aba95d7014e570307ceb5b75.jpg)


![](images/bc3ad7189918a48aa4cd3eb3b7a8bbe18aa2ed37788d19e1d92dd404ac16a442.jpg)


![](images/798f4f832fdf608d74aeefa3bd9c919617da1756012a384da93287b7c59c4081.jpg)


![](images/d6201e9d6f4d686c410563b5c3ca7e4b386869f2a31447515bcddc0b82935b35.jpg)


![](images/3249b2ae5467134ea674e9a8c07943611ce2f7dfb75335621f74175486540544.jpg)


![](images/ba25f8b746630e23638bf15c5bf036c524f9a09deb50ffdce87782747761c350.jpg)


![](images/d783de5ec5e5c6941a6b8c50e7214e9f6396a071b7871fb0fd61f014109608ba.jpg)


![](images/fdedc31bc9f42dee6f3643583ad342517179f67fa969b9d4c6216944b989e966.jpg)


![](images/045ccc9f93dcce400503982de601dded1042c988e69cf00fa7875eb34f72f6fe.jpg)


![](images/e465534d380e45720ae8d696dcd9bed1517eee4626042032863126326fe546c2.jpg)


# 深度受限的性质

完备性: No

最优性: No

时间复杂度: $O ( b ^ { L } )$

空间复杂度: $O ( b L )$

L为限制的最大深度

# 迭代加深搜索

 为了解决深度优先搜索和宽度优先搜索存在的问题

 一开始设置深度限制为 $L = 0$ ，我们迭代地增加深度限制，对于每个深度限制都进行深度受限搜索

 如果找到解，或者深度受限搜索没有节点可以扩展的时候可以停止当前迭代，并提高深度限制L

 如果没有节点可以被剪掉（深度限制不能再提高）仍然没有找到解，那么说明已经搜索所有路径，因此这个搜索不存在解

# 示例

Limit = 0

![](images/7b69826975ecc70d7cabcc75610e5323d05979b66c61d3deccddf851da1ce13c.jpg)


![](images/1eeb2d95c26dd7d63d99022d9221ad57e0bfd6ccb14ecffa223c51ed57958d75.jpg)


# 示例

Limit = 0

![](images/fa07562190dc145fcac192bf7e06a947c6af5567a33f2cc8ceb51a8899462d21.jpg)


![](images/958cf70281c8594448521b0ce4365c58c1f1c53453d025f22a4aec6ed10d7f39.jpg)


Limit =

![](images/93f231b2300e92f429e45eac1210f6dfe4805f2b01e07695672bdfb168c3e8f4.jpg)


![](images/07e04737f43686df3dc8558b4317be7c91e13eb70295293f9754df5f272ed8ed.jpg)


![](images/76caae7b8329cdf87a4990dae9acf8a260ff4fc19c7c4fe652e963feadce81ef.jpg)


![](images/35c0310b798a5d98c71fd871b8899c7600eaccdc9b1928608932bbf5439f7f33.jpg)


# 示例

Limit = 0

![](images/cf583ab0c8f9981a02e28729608444bca28d1fca89f8274d6b1cce27a6f574fc.jpg)


![](images/fa772ea687968bf9c884775ddfa8909638e059396ab3ba38820edf7a04edb751.jpg)


Limit =

![](images/12eec0004b655f2edaf94477043cce3c8e179d7878c87686f83cb35158311c3c.jpg)


![](images/c113a5b28c36e633d3f095808334a3744a9c4dd97d67a3a683a94b4991885e7c.jpg)


![](images/303943dbad4b37c706f570e68b1f28b51d5fbe0fd184483c17ec1efee914c12f.jpg)


![](images/a9402a97fe238fc3a34fecf3a8533f0880c9cf598473fb913564af9bc850a8e5.jpg)


Limit

![](images/0feb7720fa12abfa37878b1fd0937c65b06651f3e0491d085c5571cf09fc46f5.jpg)


![](images/0c75d61cb6caaf654c26cac6bba1969739adb458fe08b8e1a1e7357b8df8047d.jpg)


![](images/cebc8b794e4dcd818c589405b8cf8d925f219153d00a81060e0abae68421cefc.jpg)


![](images/2c805984481f3c319ba10ae5b216bfe5fbe9a55acc257b6f95948fa12715e968.jpg)


![](images/ab8b4ec91c15d58a6eb81e0451cb627fd263a142188dbedd79bfdc652b55a0dd.jpg)


![](images/134ea3f113c02a4397aec90e8aebd76fc858ea24e3abc5f4afc7d32a67474f4e.jpg)


![](images/6b9a85fb2e841d392cd57d12d5c5f18bcd1d559fb93b8e4351b1baf6c38e3918.jpg)


![](images/85b1a55472b4fb16ec8dc0f3c1e31b3360a0f34f48e81abc8e83d7c31025a15a.jpg)


# 示例

Limit = 0

![](images/ee2f7bf16f970bc00359443d7f6c519b3050acbe388137f27dc0e1c227d8bdd7.jpg)


![](images/5a4963ab758db2adf393ee416d53f4a8df6e3d73721c91ed1426cad10be2f014.jpg)


Limit =

![](images/3c8ecc5b8ffcc8006e9bf52fceb23e6303f520208c38351ad95c9b38e062e514.jpg)


![](images/0f104747fe7295adbee96a4bd560163651d355519e38b040cbe6b1c45387f439.jpg)


![](images/9ebed0a84defca0a3ed43959d219129fb2eb75da8c1766e18e8d08b10a744e6f.jpg)


![](images/d7ba25b0e56137d8069986f6470015bcb149f506cf7b25094876789b9f261045.jpg)


Limit

![](images/540541f687a74f49a81b5cef26e087508e48f2614ca20656ec540c28dadfe650.jpg)


![](images/e76c9786d1a1129eafad411a91441280317f8ba95c1b6c0b4096f9bba061061d.jpg)


![](images/8ebb2217f85b8da630ce72e91f772c289b0a01a898ee9e5c0b0a526b231c900d.jpg)


![](images/a823bf082a15c19446f19bd366f3381d6a3bbc1048a22da8ac05a1e12318476e.jpg)


![](images/33b82caaea5791feb86183537a6605a730955f7acaae094ea30a7f951dd1e57e.jpg)


![](images/0a59960745479050d945f9338e6966e1bfa96d3c21305d5cf39f8436ee313842.jpg)


![](images/c799205d587de31548e18a64aeb6a9280b9609af8266f608533a0e1131c5741c.jpg)


![](images/06b1d3fc7d2275b488c7c1dabced00e3b1d512b18d80cf895e286db0f944293b.jpg)


Limi

![](images/d989216921168dce704701866e5194e9ab12bc1397da914bd904fce332d3b328.jpg)


![](images/73ea8e80dfd27b4b92ca84f9b86c88b3351795aa8bff06283f7eb607f1f50e52.jpg)


![](images/1626050c601fe64b6adbe83e882fa54d7a3abadcef20acde20639dfdb43d0734.jpg)


![](images/99f2d63d272289dce8975e73c9f5e1e0592093ee377435ed102e07b05879c2e5.jpg)


![](images/5fa9f5f7b60d874322d8e9ea90cc04c72bb1e894e433dea49645ed956938dfe1.jpg)


![](images/d5770ebc0527a2c061a660c1d844760b2487b48e4b5080c1f324417edff8a609.jpg)


![](images/8b2773c93b03a880917a2e12d1445a8bca7bb92458ae64f0514c0d6eb7da8bf2.jpg)


![](images/ad742d41c86e06ddcb9d3d5a47e73f27951289ba64a906cfa12740a4a7e878e5.jpg)


![](images/4efc370a8e0a45677e8cc481f2824256e9d75a92f01f31663fe9c423eb3115b6.jpg)


![](images/37c04ebe2bd418905d627c8b7501fc6351138162faf6df2cd824fc0ecd45694d.jpg)


![](images/a1956a3cf77b7312ad34034c0b95c99192eb500e1a433672318419572450c4f5.jpg)


![](images/3f64eea72eeffd83af7fd86874545264f5e19e9246581355c5e4df72c1571039.jpg)


# 迭代加深搜索性质

完备性：Yes

最优性：Yes （在每个动作的成本一致的情况下）

如果动作成本不一致，则可以使用成本边界(cost bound)代替深度限制L：

⚫ 只扩展成本低于成本边界(cost bound)的路径

⚫ 每次迭代时记录当前还未扩展路径中的最小成本

下一次迭代则提高成本边界

这样开销会很大，迭代数量为成本数值的构成的集合的大小

时间复杂度： $( d + 1 ) b ^ { 0 } + d b + ( d - 1 ) b ^ { 2 } + . . . . + b ^ { d } = { \cal O } ( b ^ { d } )$

空间复杂度: $O ( b d )$

迭代加深搜索可以比宽度优先搜索更高效: 不用扩展深度限制上的节点。但是宽度优先搜索需要扩展直到目标节点。

# 迭代加深搜索性质

![](images/231d7c5065627b1de5d4bbd5a1c35b5115c63fab015cc2ab865b308a93d0f559.jpg)



BFS


![](images/836e3170f1f4b179d2856b0d6d6752157f39f6bbaab13dc2e13361e8778a4a2d.jpg)



IDS


时间复杂度： $( d + 1 ) b ^ { 0 } + d b + ( d - 1 ) b ^ { 2 } + \ldots + b ^ { d } = O ( b ^ { d } )$

对比宽度优先搜索的时间复杂度:

$$
1 + b + b ^ {2} + \dots + b ^ {d} + b (b ^ {d} - 1) = O (b ^ {d + 1})
$$

迭代加深搜索可以比宽度优先搜索更高效: 不用扩展深度限制上的节点。但是宽度优先搜索需要扩展直到目标节点。

空间复杂度: O(bd)

# 双向搜索

![](images/7cc79d667a7e79f46d1bf73e29bf8211c128813dc7f17825ee85e42c53da5617.jpg)


![](images/4a2e10311598411ae7446dadd6303833d973108492bc9deb76d94ebc5c1281ce.jpg)



Bidirectional Search


![](images/0b8780238908af595e49a7b334c9e490ad05a7205bcd3a44bbf2dd9fb34ad879.jpg)


同时进行从初始状态向前的搜索和从目标节点向后搜索，在两个搜索在中间相遇时停止搜索假设两个搜索都使用宽度优先搜索

完备性: Yes

◼ 最优性: Yes（在每条边/每个动作的成本一致的情况下）

时间和空间复杂度: $O ( b ^ { d / 2 } )$

难点：如何向后搜索，部分问题可以向后搜索，但有些问题向后搜索会使得分子引子很大

# 盲目搜索总结

<table><tr><td>标准</td><td>深度优先</td><td>宽度优先</td><td>深度受限</td><td>迭代加深</td><td>一致代价</td></tr><tr><td>时间</td><td>O(bm)</td><td>O bd+1)</td><td>O(bL)</td><td>O(bd)</td><td>O(bC*/s+1)</td></tr><tr><td>空间</td><td>O(bm)</td><td>O bd+1)</td><td>O(bL)</td><td>O bd)</td><td>O(bC*/s+1)</td></tr><tr><td>最优</td><td>否</td><td>是</td><td>否</td><td>是</td><td>是</td></tr><tr><td>完备</td><td>否</td><td>是</td><td>否</td><td>是</td><td>是</td></tr></table>

上表中， $b$ 为问题中一个状态最大的后继状态个数， $d$ 是最短解的动作个数，m是遍历过程中最长路径的长度， $L$ 为限制的搜索深度，$C ^ { * }$ 为最优解的成本，s为动作的成本下界。

# 路径检测

⚫ 回顾下，我们之前在边界上通常保存了路径

假设 $( n _ { 1 } , \ldots , n _ { k } )$ 是一条到达节点 $n _ { k }$ 的路径，并且我们要扩展节点 $n _ { k }$ 来获得子节点 $c _ { \prime }$我们可以获得一条到达节点c 的路径 $( n _ { 1 } , \ldots , n _ { k } , c )$ 

路径检测用于确保状态（节点） c 与它所在路径上的祖先节点都不相等

⚫ 也就是说，单独检测每条路径是否出现重复节点

# Path Checking

![](images/89f0f7ac84f8527e91cd9cf8bba0bc69b15146b2ca4667babaf9925cc2e7c30d.jpg)


![](images/435197bdd08b667f568983c194efb0cdea37ae06aae82dc55320f22828477b61.jpg)


# Cycle Checking

Keep track of all states previously expanded during the search.记录下在之前的搜索过程中扩展过的所有节点

当扩展节点 $n _ { k }$ 获得子节点c时，确保节点c不等于之前任何扩展过的节点

Higher space complexity (equal to the space complexity of breadth-firstsearch).

Other issues with cycle checking will come up when we look at heuristicsearch.

# Cycle Checking (BFS)

![](images/16f7c7697ddcb9544386cc98c4d60cf5da16abc7f2291ba56fb2a9da7fef4b05.jpg)


# Example: Arad to Neamt

![](images/feb5a058cc862a8003a8f8ebf57908cd997585bb669859f4eea298e5df4a53f9.jpg)


# Example: Arad to Neamt

![](images/ad3c4def623eccd05611187d9f58b2d468406eb827a802f2f926c2f58722fdff.jpg)


⚫If path checking, nodes 1 and 2 are not generated

⚫If cycle checking, node 3 is not generated since it is expanded before; but if only path checking, node3 is generated

⚫If cycle checking, node 4 is generated, because it is only generated before, not expanded before

![](images/0317cd76da07e3f85ddb902263543bdc1d28b9014584ce6ee01908c3bc7264ce.jpg)


# 环检测最优性问题

对于一致代价搜索，使用环检测后仍能找到最优的解

⚫ 一致代价搜索在第一次扩展到某个节点时，其实已经找到了到达这个节点的成本最低的路径

⚫ 这意味着被环检测剔除的节点不可能出现一条更短/成本更低的路径之后会看到，对于启发式搜索，这个性质不一定会成立

# 环检测最优性问题

![](images/d27e023c336a7bbaec1b003b53dc1ac46801e86dbf062812d3364794864507b7.jpg)


e.g., on the previous slide, when we expand the first O to generate node3, S is already expanded, so $c ( A \to S ) \leq$ $\begin{array} { r l } { c ( A  S ) \leq } & { { } C ( A  Z  O ) } \end{array}$ . Thus node 3can be safely rejected.

# 路径/环检测 比较

路径检测: 当扩展节点n来获得子节点c时，确保节点c不等于到达节点c的路径上的任何祖先节点

环检测: 记录下在之前的搜索过程中扩展过的所有节点当扩展节点 $n _ { k }$ 获得子节点c时，确保节点c不等于之前任何扩展过的节点对于一致代价搜索，环检测可以保留一致代价搜索的最优性

# 启发式搜索

# 课堂练习

练习1 如右图所示，初始状态为节点S，目标状态为G，各边的路径成本如图。请使用一致代价搜索算法，完成以下任务：

• 按扩展顺序列出节点，并记录每一步的Open表和Closed表状态

• 当节点A生成目标G时，为何算法不立即终止？解释UCS如何保证最终找到最优路径。

![](images/ed6a17346f265cc4d921410aedb4d2139e4ec5193cc9f3c64ee320afe5ecba2f.jpg)


# 课堂练习

# 练习1 解：

• 搜索过程如下: （括号内为该节点总代价）

<table><tr><td>步骤</td><td>扩展节点</td><td>Open表</td><td>Closed表</td><td>备注</td></tr><tr><td>0</td><td>-</td><td>S(0)</td><td>空</td><td>初始状态</td></tr><tr><td>1</td><td>S</td><td>A(1), B(5), C(15)</td><td>S(0)</td><td>扩展S，生成子节点A/B/C</td></tr><tr><td>2</td><td>A</td><td>B(5), G(11), C(15)</td><td>S(0), A(1)</td><td>扩展A，生成G（总成本1+10=11）</td></tr><tr><td>3</td><td>B</td><td>G(10), C(15)</td><td>S(0), A(1), B(5)</td><td>扩展B，生成G（总成本5+5=10）</td></tr><tr><td>4</td><td>G</td><td>C(15)</td><td>S(0), A(1), B(5), G(10)</td><td>找到目标G，终止</td></tr></table>

最终路径为 $S  \mathsf { B }  \mathsf { G }$ ，总成本为 10

![](images/b2312d36045ac4167783c983d9bd180c53f7bfa4888e6ef542fd35da4d919063.jpg)


# 课堂练习

# 练习1 解：

• 当节点A生成目标G（路径成本11）时，算法未终止的原因：

• UCS仅在扩展节点时检查是否为目标，而非生成时

• 此时Open表中存在B(5)，其潜在路径到G的总成本可能更低（实际为5+5=10）

• UCS始终优先扩展累积成本最小的节点，确保首次到达目标时路径成本最小。若提前终止，可能错过更优路径（B→G） 。

![](images/2115405f96e7c0b325b023622ca2b97a65e14ebba7b1b552392bae5b7e946d04.jpg)


# 无信息搜索总结

•宽度优先：搜索对象的位置深度

•一致代价：搜索对象的到达路径长度

•深度优先：搜索对象的位置深度

•深度受限：搜索对象的位置深度

•迭代加深：搜索对象的位置深度

•双向：搜索对象的位置深度

共有的特征是：

搜索方向都依据了某一评价指标

$\bullet$ 搜索方向和搜索对象本身的属性无关

<table><tr><td>Criterion</td><td>Breadth-First</td><td>Uniform-Cost</td><td>Depth-First</td><td>Depth-Limited</td><td>Iterative Deepening</td><td>Bidirectional (if applicable)</td></tr><tr><td>Complete?</td><td>Yesa</td><td>Yesa,b</td><td>No</td><td>No</td><td>Yesa</td><td>Yesa,d</td></tr><tr><td>Time</td><td>O(bd)</td><td>O(b1+[C*/ε])</td><td>O(bm)</td><td>O(bl)</td><td>O(bd)</td><td>O(bd/2)</td></tr><tr><td>Space</td><td>O bd)</td><td>O(b1+[C*/ε])</td><td>O(bm)</td><td>O(bl)</td><td>O bd)</td><td>O(bd/2)</td></tr><tr><td>Optimal?</td><td>Yesc</td><td>Yes</td><td>No</td><td>No</td><td>Yesc</td><td>Yesc,d</td></tr></table>

# 如何能让搜索更“聪明”？

• 通用搜索策略在搜索过程中，不对状态优劣进行判断，仅按照固定方式搜索。在盲目搜索中，我们没有考虑边界上的节点哪一个更具有“前景”（promising）

• 例如在一致代价搜索(UCS)时，我们总是扩展从初始状态到达当前状态的成本最小的那条路径，却没有考虑过从当前状态点沿着当前路径到达目标路径的成本

![](images/031cf8a71e0f8624697018423285282d997e14dd9ec0a74bdc214b0a599ae5d5.jpg)



VS


![](images/9e2419a97c594ebbb46e57c5e6a0c4588a9442843c423abfba637fb9ae51b1b0.jpg)


人解决问题的“启发性”

![](images/981f5266a4cc6bc5e46e630849e52647b12f93cba96500fb001db203d0ce5611.jpg)



Goal


对两个可能的状态A和B， 选择“从目前状态到最终状态” 更好的一个作为搜索方向。

• 但很多时候我们对两个状态的优劣是有判断的。

# 动机

◼ 在盲目搜索中，我们没有考虑边界上的节点哪一个更具有“前景”

◼ 例如在一致代价搜索时，我们总是扩展从初始状态到达当前状态的成本最小的那条路径，却没有考虑过从当前状态点沿着当前路径到达目标路径的成本

◼ 但是，在许多情况下，我们可以有额外的知识来衡量当前节点，例如可以知道当前节点到达目标节点的成本

# 启发式搜索

◼ 对于一个具体问题，构造专用于该领域的启发式函数 $h ( n )$ , 该函数用于估计从节点??到达目标节点的成本

要求对于所有满足目标条件的节点??， $h ( n ) = 0$

◼ 在不同的问题领域中，对上述的成本的估计有不同的方法。即，启发式函数是随领域不同而不同的

当前节点到目标的某种距离或者差异的度量；

当前节点处于最佳路径的概率；

某种条件下的主观if-then规则；

# 启发式函数示例: 8-puzzle

• 在某个状态下，共有三种可能的选择。

• 如何评判三种走法的优劣？

![](images/73bf4cc0af19fbc0493ff1cb3db0d5f171bfb56c69ba2b9c3d7d65c23372c85f.jpg)


![](images/48dbf69cac0cd6c445d6383f74e70c6c6a99d57720d31b16833c21941c12addd.jpg)



Goal


# 启发式函数示例: 8-puzzle

• Method A：

– 当前棋局与目标棋局之间错位的牌的数量，错数最少者最优。

–然而，这个启发方法没有考虑到距离因素，譬如：棋局中把“1”“2”颠 倒，与“1”“5”颠倒，但是移动难度显然不同。

![](images/615bc6140e1fbbe66f88118e16731ddbb5297e6edcfadcfa371908ada5fa9808.jpg)


![](images/56fdd1b0887f1faa0ee206e2d3fee0c6552cbef9c172979362dd9a9bcf98bc97.jpg)



Goal


# 启发式函数示例: 8-puzzle

Method B改进：

– 更好的启发方法是“错位的牌距离目标位置的距离和最小” 。

– Method B 仍然存在很大的问题：没有考虑到牌移动的难度。两 张牌即使相差一格，如“1”“2”颠倒，将其移动至目标状态依 然不容易。

![](images/f28ebdaa1832c162630b02d1e547b6a98792f76eef734f944ea979d900afd904.jpg)


![](images/65fc33f3c3e87fedf50f104b499f0a13f3eec5699616cc318d8e390987a5d593.jpg)



Goal


# 启发式函数示例: 8-puzzle

Method C：

– 在遇到需要颠倒两张相邻牌的时候，认为其需要的步数为一个固 定的数字。

Method D改进：

– 将B与C的组合，考虑距离，同时再加上需要颠倒的数量。

![](images/aeb8dd63161a96f5731c174e165368bf1b5de55d78550278a367a72c61497ed1.jpg)


![](images/113ea11e899b515dbcf948b28bf4727dd91edd701e6bca44e4cfffe1d442d1e5.jpg)


# 启发式函数示例: 直线距离（欧氏距离）

![](images/39e965eed7b4f6e1ac6211d34098d192a7fc950d4e4e8f3161d1a3e65fc92c16.jpg)


# Straight-line distance

to Bucharest

Arad 366

Bucharest 0

Craiova 160

Dobreta

Eforie 161

Fagaras 178

Giurgiu 77

Hirsova 151

Iasi 226

Lugoj 244

Mehadia 241

Neamt 234

Oradea 380

Pitesti 98

RimnicuVilcea 193

Sibiu 253

Timisoara 329

Urziceni 80

Vaslui 199

Zerind

# 启发式函数示例: 直线距离（欧氏距离）

![](images/ff3cc992807ec2f2815ffedf2626a4c1fc078297b531e194120a77e8b18a48ef.jpg)


Straight-line distance

toBucharest

Arad 366

Bucharest 0

Craiova 160

Dobreta 242

Eforie 161

Fagaras 178

Glurgiu

Hirsova 151

Iasi 226

Lugoj 244

Mehadia 241

Neamt 234

Oradea 380

Pitesti 98

Rimnicu Vileea193

Sibiu

Timisoara 329

Urziceni 80

Vaslui 199

Zerind 374

(a)The initial state

(b)After expanding Arad dingArad

Arad

Arad

329 329

(c)After expanding Sibiu

![](images/3771ba1894ea4f3b87f4171df49cbfa10d32439257a3fd2561237074483982f3.jpg)


(d)After expanding Fagaras

![](images/eafb45fb0c481d5210fd3d679f860a29399ba750c128a73b2f7f07397e3311c9.jpg)


Arad-Sibiu-Fagaras-Bucharest: $-$

Arad-Sibiu-RV-Pitesli-Bucharest: $1 4 0 + 8 0 + 9 7 + 1 0 1 = 1 4 0 + 2 7 8 = 4 1 8$

In red is the path we selected. In green is the shortest path between

Arad and Bucharest. What happened?

仅依靠启发式函数有问题

# 贪心最好优先搜索 Greedy

利用启发式函数 $h ( n )$ 来对边界上的节点进行排序，只靠启发式函数的方法叫贪心最好（最佳）优先搜索 (Greedy Best-first Search)

我们贪婪地希望找到成本最低的解

◼ 但是，这种做法忽略了从初始状态到达节点??的成本

因此这种做法可能“误入歧途”，选择了离初始状态很远（成本很高），但根据 $h ( n )$ 看起来离目标状态很近的节点

![](images/cd2fcdec46e6558ff69a2c758af0a386532018907a63c7078041346e59ad3fa0.jpg)


因此贪心最好优先搜索既不是完备的，也不是最优的。…

# 贪心最好优先搜索 Greedy

利用启发式函数 $h ( n )$ 来对边界上的节点进行排序，只靠启发式函数的方法叫贪心最好（最佳）优先搜索 (Greedy Best-first Search)

我们贪婪地希望找到成本最低的解

◼ 但是，这种做法忽略了从初始状态到达节点??的成本

因此这种做法可能“误入歧途”，选择了离初始状态很远（成本很高），但根据 $h ( n )$ 看起来离目标状态很近的节点

$$
\rightarrow \mathrm {s t e p} \mathrm {c o s t} = 1 0
$$

$$
\rightarrow \mathrm {s t e p} = 1 0 0
$$

[S]

$$
[ n 3, n 1 ]
$$

$$
[ G o a l, n 1 ]
$$

$$
\mathsf {h} (\mathsf {n} 1) = 7 0
$$

![](images/baf6764a2c61028b81eb84f8cc5fb9bf80c415d4d9fa84462224ed27a2a1974c.jpg)


因此贪心最好优先搜索既不是完备的，也不是最优的。

# 贪心最好优先搜索


贪心最好优先搜索：评价函数 $f ( n ) =$ 启发式函数 $h ( n )$


<table><tr><td>辅助信息</td><td>所求解问题之外、与所求解 问题相关的特定信息或知识</td><td></td></tr><tr><td>评价函数 (evaluation function) \(f(n)\)</td><td>从当前节点\(n\)出发，根据评 价函数来选择后继节点。</td><td>下一个节 点是谁?</td></tr><tr><td>启发式函数 (heuristic function) \(h(n)\)</td><td>计算从节点\(n\)到目标节点之 间所形成路径的最小代价值， 这里将两点之间的直线距离 作为启发式函数。</td><td>完成任务 还需要多少代价?</td></tr></table>

# 贪心最佳优先搜索(Greedy BFS)

# 单纯依靠启发函数搜索不可行

⚫ 对于一个具体问题，我们可以定义最优路线：“从初始节点出发，以最优路线经过当前节点，并以最优路线达到终止节点” 。

盲目搜索(如UCS)，只考虑了前半部分，能计算出从初始节点走到当前节点的优劣。

⚫ 启发函数(如Greedy)则只“估计”了当前节点到最终节点的优劣。

两者相结合，就是启发式搜索策略。

典型代表是A算法。

# A 搜索

f(n) g(n) + h(n)评价函数 起始节点到节点n代价 节点n到目标节点代价(当前最小代价) (后续估计最小代价)

Define an evaluation function 定义评价函数 $\_$

$\cdot$ is the cost of the path to node n从初始节点到达节点??的路径成本

$h ( n )$ is the heuristic estimate of the cost of getting to a goal node from n从 $n$ 节点到达目标节点的成本的启发式估计值

⚫ So $f ( n )$ is an estimate of the cost of getting to the goal via node $n _ { \mathrm { \iota } }$ 是经过节点??从初始节点到达目标节点的路径成本的估计值

⚫ We use $f ( n )$ to order the nodes on the frontier. Always expand the node with lowest f-valueon Frontier. 利用节点对应的 $f \left( n \right)$ 值来对边界上的节点进行排序，并总扩展边界中具有最小$f$ 值的节点。

⚫ 对于某个确定状态，g(n)和h(n)都是定值，用两者的和评估当前节点到达最终目标的成本，采用最佳优先搜索进行求解

# 一致代价搜索UCS和贪婪搜索Greedy对比

•UCS：按路径计算成本

•路径代价g(x)

•Greedy：按目标临近性计算成本

•启发函数h(x)

![](images/794bb78267d1d2e04413619f56f009430743be3128bb2c579a8f5862f8856ebd.jpg)



${ \mathfrak { d } } = \operatorname { g } ( \mathbf { \boldsymbol { x } } ) + \mathbf { \boldsymbol { h } } ( \mathbf { \boldsymbol { x } } )$


# 例子：利用A搜索找到Arad到Bucharest最短路径

![](images/ce9583c98949c5df14764997a17627d9e39d1a1643bb05b6b5d6e723a029f6ce.jpg)


 Straight-line distance

to Bucharest

Arad 366

Bucharest 0

Craiova 160

Dobreta 242

Eforie 161

Fagaras 178

Giurgiu 77

Hirsova 151

Iasi 226

Lugoj 244

Mehadia 241

Neamt 234

Oradea 380

Pitesti 98

Rimnicu Vilcea 193

Sibiu 253

Timisoara 329

Urziceni 80

Vaslui 199

Zerind 374

# 示例

![](images/70383dcf050074b98a22bbff5a26db09ed4a29f83721ed8a190ed453a523a11a.jpg)


Straight-line distanceto Bucharest

Arad 366

Bucharest 0

Craiova 160

Dobreta

Eforie 161

Fagaras 178

Giurgiu 77

Hirsova 151

Iasi 226

Lugoj 244

Mehadia 241

Neamt 234

Oradea 380

Pitesti 98

Rimnicu Vilcea193

Sibiu 253

Timisoara 329

Urziceni 80

Vaslui 199

Zerind 374

(a) The initial state

Arad

366=0+366

(b) After expanding Arad nding Arad

Arad

![](images/0a3ed775c6630f3ad97f2cb701f551f0c7ca1610a214571c96fcf3a8c2732436.jpg)


(c) After expanding Sibiu

Arad

646=280+366 415=239+176 671=291+380 413=220+193

(d) After expanding Rimnicu Vilcea

Arad

![](images/ee7c565b390aaa5c05a6c0b1526fe1544956f3cfbd16306dee05aaea8443174d.jpg)


(e) After expanding Fagaras

Arad

![](images/6ad4988167dbc8a4b1a6e43d4922846d534ad8ee531f7b8ad55264ddcc64fa35.jpg)


(f) After expanding Pitesti

Arad

![](images/207f431a313f7b57c3e4f41503e78acd2c4fdd6b56292b0dea8d331cbbfa11df.jpg)


# 示例

![](images/b9f07b92c1b40ca4bb654ef8580b25512a313e4266c6825676c0847820c8b0ab.jpg)


Straight-line distance

to Bucharest

Arad 366

Bucharest 0

Craiova 160

Dobreta

Eforie 161

Fagaras

Giurgiu 77

Hirsova 151

Iasi 226

Lugoj 244

Mehadia 241

Neamt 234

Oradea 380

Pitesti 98

RimnicuVilcea

Sibiu 253

Timisoara 329

Urziceni 80

Vaslui 199

Zerind 374

# 示例 8-puzzle的启发式求解

仍然以8格拼图来解释A算法。令h(n)为“错牌数量”， $\mathsf { g } \left( \mathsf { n } \right)$ 为“已经移动的步数”，从初始状态开始搜索。

• step1：

![](images/d851373a1c49b38c2dba2ac0a1586730961fb8eecb036844713b1a72d5392c77.jpg)



Goal


![](images/885de5473c3bf1c0d2593e609d9783096dffdef6097b390a1ac60c9200df4ada.jpg)


Open/Frontier =[a4]

Closed=[ ]

# 示例 8-puzzle的启发式求解


Step2：三种走法


![](images/cc3e1bd407aa3a4306ce9f0ffc54c30637dab5a6ca4f7bd067d38ea228178008.jpg)


Open =[c4,b6,d6]

closed=[ a4 ]

![](images/500566b775dadc4620abc273769f763ddc0e69e47db62d0821f26fdcc17ec907.jpg)



Goal


# 示例 8-puzzle的启发式求解


Step3：继续


![](images/6a633e5cda157652e70ac98fc1f0b7eac70ef9b546e7d6d940cf52d3f2c31251.jpg)


![](images/2732b3c2f3b879db52da79b08ad55bf82a23a61308c9011c70bdbe14ea35a0ac.jpg)



Goal


Open =[e5,f5,b6,d6,g6]

closed=[ a4 ]

# 示例 8-puzzle的启发式求解


• Step4：继续


![](images/9c262ce1e22f625d35565c8596c5a8d326c70303ed91b59ae7c46c7a05e388b4.jpg)


<table><tr><td>1</td><td>2</td><td>3</td></tr><tr><td>8</td><td></td><td>4</td></tr><tr><td>7</td><td>6</td><td>5</td></tr></table>

Goal

$$
\text {O p e n} = [ \mathrm {f 5}, \mathrm {h 6}, \mathrm {b 6}, \mathrm {d 6}, \mathrm {g 6}, \mathrm {i 7} ]
$$

$$
c l o s e d = [ a 4, c 4, e 5 ]
$$

# 示例 8-puzzle的启发式求解

St 

![](images/cac094eae052dce8fd4a17e8916fbecda4c38cb1153070e27bb9fafe50f74475.jpg)


<table><tr><td>1</td><td>2</td><td>3</td></tr><tr><td>8</td><td></td><td>4</td></tr><tr><td>7</td><td>6</td><td>5</td></tr></table>

Goal

$$
\text {O p e n} = [ \mathrm {j} 5, \mathrm {h} 6, \mathrm {b} 6, \mathrm {d} 6, \mathrm {g} 6, \mathrm {k} 7, \mathrm {i} 7 ]
$$

$$
c l o s e d = [ a 4, c 4, e 5, f 5 ]
$$

# 示例 8-puzzle的启发式求解

Step6：j节点只有一个孩子

![](images/63b715800240bc5a9804b6dba505983c25aaf18693a304ea5918fa390e63fda7.jpg)


![](images/85713506e262b196eebf0116b15149f9a654b29b5a529774c15bc438c8813f88.jpg)



Goal


Open =[L5,h6,b6,d6,g6,k7,i7]

closed=[ a4,c4,e5,f5,j5 ]

# 示例 8-puzzle的启发式求解

Step7：找到答案

![](images/890a526240755230ea7854ae8fdd0746e20f148af514505f5234dc12fa625c90.jpg)


![](images/c80b650d8425ea8689fa5cb33388525b82e1a85168f692774b9c9f1d860472d8.jpg)



Goal


Open =[m5,h6,b6,d6,g6,n7,k7,i7]

closed=[ a4,c4,e5,f5,j5,L5 ]

# 示例 8-puzzle的启发式求解

https://www.redblobgames.com/pathfinding/a-star/introduction.html

```python
frontier = PriorityQueue()
frontier.put(start, 0)
came_from = dict()
cost(so_far = dict())
came_from[ start ] = None
cost"So_far[ start ] = 0
```

while not frontier.empty(): current  $=$  frontier.get() if current  $\equiv =$  goal: break

for next in graph.neighbors(current):   
new_cost  $=$  cost(so_far[current]  $^+$  graph.cost(current, next) if next not in cost"So_far or new_cost  $<$  cost"So_far[next]: cost"So_far[next]  $=$  new_cost priority  $=$  new_cost frontier.put(next, priority) came_from[next]  $=$  current

# Uniform Cost Search

# 示例 8-puzzle的启发式求解

frontier $\equiv$ PriorityQueue()

frontier.put(start, 0)

came_from $=$ dict()

came_from[start] $\mathbf { \equiv } =$ None

 while not frontier.empty():

$\mathbf { \equiv } =$ frontier.get()

$= =$ goal:

break

for next in graph.neighbors(current):

if next not in came_from:

priority $\equiv$  heuristic(goal, next)

 frontier.put(next, priority)

came_from[next] $=$ current

# Greedy Best-First Search

# 示例 8-puzzle的启发式求解

```python
frontier = PriorityQueue()
frontier.put(start, 0)
came_from = dict()
cost(so_far = dict())
came_from[ start ] = None
cost"So_far[ start ] = 0
while not frontier.empty():
    current = frontier.get()
if current == goal:
    break
for next in graph.neighbors(current):
    new_cost = cost"So_far[ current ] + graph.cost(current, next)
    if next not in cost"So_far or new_cost < cost"So_far[ next]:
        cost"So_far[ next ] = new_cost
        priority = new_cost + heuristic(goal, next)
        frontier.put(next, priority)
    came_from[ next ] = current
```

# 练习：使用A算法解决8数码问题

采用Manhattan启发式函数，使用A*搜索解决初始状态和目标状态如图所示的8数码问题，画出搜索图，图中标明所有节点的f, $g , h$ 值

$h ( n ) =$ 所有方块到达其目标位置的曼哈顿距离之和


Goal


<table><tr><td></td><td>1</td><td>2</td></tr><tr><td>3</td><td>4</td><td>5</td></tr><tr><td>6</td><td>7</td><td>8</td></tr></table>


Current


<table><tr><td>8</td><td>5</td><td>2</td></tr><tr><td>3</td><td>4</td><td></td></tr><tr><td>6</td><td>7</td><td>1</td></tr></table>

The Current state has amanhattan distannce of 9to the goal state in theleft example


Initial State


<table><tr><td>1</td><td>2</td><td>3</td></tr><tr><td></td><td>4</td><td>6</td></tr><tr><td>7</td><td>5</td><td>8</td></tr></table>


Goal State


<table><tr><td>1</td><td>2</td><td>3</td></tr><tr><td>4</td><td>5</td><td>6</td></tr><tr><td>7</td><td>8</td><td></td></tr></table>

8 tile needs to move 4 squares 5 tile needs to move 2 squares1 tile needs to move 3 squares

# 练习：使用A算法解决8数码问题


Initial State


<table><tr><td>1</td><td>2</td><td>3</td></tr><tr><td></td><td>4</td><td>6</td></tr><tr><td>7</td><td>5</td><td>8</td></tr></table>


Goal State


<table><tr><td>1</td><td>2</td><td>3</td></tr><tr><td>4</td><td>5</td><td>6</td></tr><tr><td>7</td><td>8</td><td></td></tr></table>

![](images/63bf71bb7c274950ebebb0e13538c664174af6edf9d5d2965176b65c7ffacc89.jpg)


# 城市旅行示例

![](images/bf7e7192e8f2b6133d7b1aa9e97b1874ad1d76a4eefae30dd7edb25970c9a5da.jpg)


![](images/5898b524f6e5e7e3a06bf5a9164115ae8a4ed0204e2ee00abd4771573ad7059a.jpg)


![](images/86b6932cfd9a7f9750b354459a8bfcb8a761a217c55ed7d507201fd19b87b8ce.jpg)


![](images/558432e98614fcfa41a188857968622173c1386c3e919f742c9070490cb18916.jpg)


![](images/0df12b30aec6a5d0e568352e743142c0ac34e7ffd9abdfcbffdb862a683f426e.jpg)


# A搜索的解是最优的吗

![](images/365f99fdba1884167be69fd54ea4748a383200a5f4b654065983aae8e9645de5.jpg)


•为什么？

•h(A)的估计太大了，甚至超出了实际cost，

•过大的启发值将淹没实际代价 $\mathfrak { g } \left( \mathfrak { n } \right)$ ，使得搜索脱离实际

•因此启发函数应该有上限

# 启发函数的上限问题

• A算法中，状态图上的每一步都有很多种可能的路径，我们希望能找到最优的路径。

![](images/dea5eb31196a7e1741685e321e844ca3db2168970364e4163e3bdb53157b5d02.jpg)


• 最优路径满足什么条件？ （假设n是最优路径上的点）

# 启发函数的上限问题

$- \mathtt { g } ( \mathtt { n } )$ 是从 S 走到 $\mathbf { n }$ 的所有方式中，代价最小的路径，记为g*(n)

$- \mathtt { h } ( \mathtt { n } )$ 是从 $\mathbf { n }$ 走到 E 的所有方式中，代价最小的路径，记为h*(n)

– 则最优路径为 $\mathtt { f } \ast \left( \mathrm { n } \right) = \mathtt { g } \ast \left( \mathrm { n } \right) + \mathtt { h } \ast \left( \mathrm { n } \right)$

![](images/dfd588d70262d759cffd67214fcb66b2e3bbb67c6daa4b5debf169c0409e154b.jpg)


# 启发函数的上限问题

f*(n)无法直接计算，只能求近似，且需要能约束住算法估计值

搜索过程中， ${ \mathfrak { g } } \left( { \mathfrak { n } } \right)$ 是逐步优化得到的，因此 $\mathbf { g } * ( \mathbf { \boldsymbol { n } } ) \approx \mathbf { g } \left( \mathbf { \boldsymbol { n } } \right)$ 是合理的

– 有： $\_$ 。

$$
\begin{array}{r l} & {\text {f} (n) \leq f * (n) (\text {使 得 n 点 有 被 扩 展 的 可 能 性})} \\ & {\quad g * (n) \approx g (n)} \end{array}
$$

– 可以得出： ${ \mathrm {  ~ h ~ } } ( { \mathrm {  ~ n } } ) \equiv { \mathrm {  ~ h * ~ } } ( { \mathrm {  ~ n } } )$

– 于是直观上理解，这就是启发函数的上限。

如果启发函数大于这个上限，则搜索算法出现发散（跳过最优点），不能保证总能找到最优解。

$- \mathrm {  ~ h ~ } ( \mathrm { n } ) = 0$ 退化为一致代价搜索，则可找到最优解，h（n）趋于无穷则算法失效

1.如果 $h ( n )$ 高估了实际成本 $h ^ { * } ( n )$ ：这意味着算法可能会认为通过节点 $n$ 的路径比实际上更糟，从而可能错过最短路径。因为如果 $h ( n )$ 过大， $f ( n )$ 也会相应变大，导致算法倾向于探索其他看似更有希望（即 $f$ 值更小）的路径，而这些路径可能并不是最优的。

2.如果 $h ( n )$ 精确或低于实际成本 $h ^ { * } ( n )$ ：这样算法就不会错过任何潜在的最短路径，因为它总是偏向于探索那些估计总成本更低的路径。即使 $h ( n )$ 低估了，最坏的结果就是算法会探索更多节点，这可能会使搜索过程更慢，但仍然可以保证找到最优路径。

# h(n)的条件：可采纳性

在A算法中，如果代价函数 $\scriptstyle { \mathrm { f ( n ) = g ( n ) + h ( n ) } }$ 始终满足 h(n) ≦ h*(n)那么该算法就是A*算法。

I. 假设 $c ( n _ { 1 } \to n _ { 2 } ) \geq s > 0 .$ 每个状态转移（每条边）的成本是非负的，而且不能无穷地小

II. 假设 $h ^ { * } ( n )$ 是从节点 $\mathbf { \bar { \Phi } } _ { n }$ 到目标节点的最优路径的成本 (当节点??到目标节点不连通时， $h ^ { * } ( n ) = \infty ,$ )

当对于所有节点??，满足??(??) ≤ ??∗(??)，?? ?? 是可采纳的

◼所以，可采纳的启发式函数低估了当前节点到达目标节点的成本，使得实际成本最小的最优路径能够被选上；如果启发函数大于这个上限，则搜索算法出现 发散，不能保证总能找到最优解。

◼因此，对于任何目标节点??，ℎ(??) = 0

![](images/ac0d6f76a4e36b6bcc8861d1375a0d2115c6d80ff75cbc6f8617e8ce9a4f96d4.jpg)


# h(n)的条件：一致性(单调性)

对于任意节点 $\dot { \boldsymbol { n } } _ { 1 }$ 和 $| n _ { 2 }$ ，若

$$
h (n _ {1}) \leq c (n _ {1} \to n _ {2}) + h (n _ {2})
$$

则 $h ( n )$ 具有一致性/单调性

（想想， 如果是大于号， 代表的是不是过大估计了cost？）

◼ 注意到，满足一致性的启发式函数也一定满足可采纳性（证明如下）

Case 1: 从节点 $\mathbf { \dot { \Omega } } _ { n }$ 没有路径到达目标节点，则可采纳性一定成立

Case 2: 假设 $n = n _ { 1 } \to n _ { 2 } \to \ldots \to n _ { k }$ 是从节点 $\mathbf { \dot { \Omega } } _ { n }$ 到目标节点的一条最优路径。可以使用数学归纳法证明对于所有的??， $h ( n _ { i } ) \leq h ^ { * } ( n _ { i } )$ .

$$
\begin{array}{l} \mathrm {B a s e :} h \left(n _ {k}\right) = 0 \\ \text {I n d u c t i o n :} h \left(n _ {i - 1}\right) \leq c \left(n _ {i - 1} \rightarrow n _ {i}\right) + h \left(n _ {i}\right) \leq c \left(n _ {i - 1} \rightarrow n _ {i}\right) + h ^ {*} \left(n _ {i}\right) = h ^ {*} \left(n _ {i - 1}\right) \\ \end{array}
$$

大部分的可采纳的启发式函数也满足一致性/单调性

![](images/6bc0d2070ab046ed6d872cae455b1db8efc342a05975d08b79d78602cfd5a85a.jpg)


# 示例：直线距离（是否满足一致性与可采纳性？）

![](images/316e2540716e9d371d78eb3f962745f44780ef96049080cf654fff077fa03998.jpg)


# 示例1：可采纳但不具备单调性的启发式函数

因为 $h ( n _ { 2 } ) > c ( n _ { 2 } {  } n _ { 4 } ) + h ( n _ { 4 } )$ ，下面的启发式函数不是单调的，但是却是可采纳的

→ step cost =200

→ step cost $=$ 100

$$
\boldsymbol {g} (\boldsymbol {n}) + \boldsymbol {h} (\boldsymbol {n}) = \boldsymbol {f} (\boldsymbol {n})
$$

$$
\begin{array}{l} \{S \} \rightarrow \left\{n _ {1} [ 2 0 0 + 5 0 = 2 5 0 ], n _ {2} [ 2 0 0 + 1 0 0 = 3 0 0 ] \right\} \\ \rightarrow \left\{n _ {2} [ 1 0 0 + 2 0 0 = 3 0 0 ], n _ {3} [ 4 0 0 + 5 0 = 4 5 0 ] \right\} \\ \rightarrow \left\{n _ {4} [ 2 0 0 + 5 0 = 2 5 0 ], n _ {3} [ 4 0 0 + 5 0 = 4 5 0 ] \right\} \\ \rightarrow \left\{\text {G o a l} [ 3 0 0 + 0 = 3 0 0 ], n _ {3} [ 4 0 0 + 5 0 = 4 5 0 ] \right\} \\ \end{array}
$$

![](images/41e6bbb52f67c89868566914b36010632fafbfe06705f787c7859693a4c9c856.jpg)


n1$S \to n _ { 2 } \to n _ { 4 } \to G o a l _ { \circ }$ 。虽然确实可以找到最优路径，但是在搜索过程中错误地忽略了 $\overline { { n _ { 2 } } }$ 而去扩展 $n _ { 1 }$

# 示例2：可采纳但不具备单调性的启发式函数

因为 $h ( n _ { 2 } ) > c ( n _ { 2 } {  } n _ { 1 } ) + h ( n _ { 1 } )$ ，下面的启发式函数不是单调的，但是却是可采纳的

→ step cost =200

→ step cost =100

→step cost =50

$$
\boldsymbol {g} (\boldsymbol {n}) + \boldsymbol {h} (\boldsymbol {n}) = \boldsymbol {f} (\boldsymbol {n})
$$

![](images/91ab92a5a47d33bf2d48c32e6fe5639b10372c8d1d3478f2ee2a28ee17e2bece.jpg)


$$
\begin{array}{l} \{S \} \rightarrow \left\{n _ {1} [ 2 0 0 + 5 0 = 2 5 0 ], n _ {2} [ 2 0 0 + 1 0 0 = 3 0 0 ] \right\} \\ \rightarrow \left\{n _ {2} [ 1 0 0 + 2 0 0 = 3 0 0 ], n _ {3} [ 4 0 0 + 5 0 = 4 5 0 ] \right\} \\ \rightarrow \{n _ {3} [ 4 0 0 + 5 0 = 4 5 0 ] \} \\ \rightarrow \left\{\text {G o a} / [ 6 0 0 + 0 = 6 0 0 ] \right\} \\ \end{array}
$$

采用环检测： $S \to n _ { 1 } \to n _ { 3 } \to G o a I$

![](images/ce4d73cb08c2c0803924a28126172239db53688a74ef1c1cda532c8b8199220b.jpg)


最优路径： $S \to n _ { 2 } \to n _ { 1 } \to n _ { 3 } \to G o a I$

![](images/0f54dc7fd31e9f9b7de91f6025091b8f054e357e254ac79723c03e235102cf56.jpg)


环检测是指通过记录在之前的搜索过程中扩展过的所有节点，每当扩展节点时，只有该节点不同于之前任何扩展过的节点时才进行扩展，否则该节点被剪枝（即不扩展），从而减少需要扩展的节点数量。

# 环检测的影响

◼如果启发式函数只有可采纳性，则不一定能在使用了环检测之后仍保持最优性

◼为了解决这个问题：必须对于之前遍历过的节点，必须记录其扩展路径的成本。这样的话，若出现到达已遍历过节点但成本更低的路径，则需重新扩展而不能剪枝

◼启发式函数的一单调性可以保证我们在第一次遍历到一个节点时，就是沿着到这个节点的最优路径扩展的

◼因此，只要启发式函数具备单调性，就能在进行环检测之后仍然保持最优性

# 时间和空间复杂度

$h ( n ) = 0$ 时，对于任何n这个启发式函数都是单调的。A∗搜索会变成一致代价搜索因此一致代价的时间/空间复杂度的下界也适用于A*搜索。

即， $\mathsf { A } ^ { * }$ 搜索仍可能是指数复杂度，除非我们能才找到好的h函数

<table><tr><td>Criterion</td><td>Breadth-First</td><td>Uniform-Cost</td><td>Depth-First</td><td>Depth-Limited</td><td>Iterative Deepening</td><td>Bidirectional (if applicable)</td></tr><tr><td>Complete?</td><td>Yesa</td><td>Yesa,b</td><td>No</td><td>No</td><td>Yesa</td><td>Yesa,d</td></tr><tr><td>Time</td><td>O(bd)</td><td>O(b1+[C*/ε])</td><td>O(bm)</td><td>O(bl)</td><td>O bd)</td><td>O(bd/2)</td></tr><tr><td>Space</td><td>O bd)</td><td>O(b1+[C*/ε])</td><td>O(bm)</td><td>O(bl)</td><td>O bd)</td><td>O(bd/2)</td></tr><tr><td>Optimal?</td><td>Yesc</td><td>Yes</td><td>No</td><td>No</td><td>Yesc</td><td>Yesc,d</td></tr></table>

# 可采纳性意味着最优性

假设最优解的成本是??∗

◼ 最优解一定会在所有成本大于 $C ^ { * }$ 的路径之前被扩展到

成本≤ ??∗的路径的数量是有限的

因此最终可以检测到最优解

# 可采纳性意味着最优性

# 最优解一定会在所有成本大于 $C ^ { * }$ 的路径之前被扩展到

# 证明:

• 假设 $p ^ { * }$ 是一个最优解的路径，其成本为 $C ^ { * }$

• 假设 $p$ 是一条满足 $c ( p ) > c ( p ^ { * } )$ 的路径，而且路径 $p$ 在 $\overleftarrow { p } ^ { * }$ 之前被扩展（反证法）

• 那么扩展了到路径 $p$ 时，肯定会有一个 $p ^ { * }$ 上的节点 $\mathbf { \bar { \it { n } } }$ 处在边界上

• 因为 $p$ 在 $\dot { p }$ ∗之前被扩展，因此 $p$ 路径的最后的节点(假设为目标节点） $x$ 有

• $f ( x ) \leq f \left( n \right)$

因此 

• ?? ?? = ??(??) $+ 0 = f ( x ) \leq f \left( n \right) = g ( n ) + h ( n ) \leq g ( n ) + h ^ { * } ( n ) = c ( p ^ { * } )$

和 $c ( p ) > c ( p ^ { * } )$ 相矛盾

![](images/ca317c77ed1a6de5e0ebb18146cf8dd6b6e42562c91c4f84b9d75a1da964bc22.jpg)


$$
\begin{array}{l} p = S \rightarrow u \rightarrow x \\ p ^ {*} = S \longrightarrow u \longrightarrow n \longrightarrow x \\ \end{array}
$$

# 单调性相关结论

Proposition 1：一条路径上的节点的 $f$ 函数值应该是非递减的

（注意如果只有可采纳性，此结论不成立）

证明：令… . ??1, ??2, … …为一路径

$$
f (n 1) = g (n 1) + h (n 1) \leq g (n 1) + c (n 1 \rightarrow n 2) + h (n 2)
$$

$$
f (n 2) = g (n 2) + h (n 2) = g (n 1) + c (n 1 \rightarrow n 2) + h (n 2)
$$

故 $f ( n 1 ) \leq f ( n 2 )$

# 单调性相关结论

Proposition 2： 如果节点??2在节点??1之后被扩展，则有

$$
f \left(n 1\right) \leq f \left(n 2\right)
$$

# 证明：

有以下两种情况:

◼当 $n 1$ 被扩展， $n 2$ 还在边界上。由于 $n 2$ 在 $\mathrm { \Pi } _ { \mathrm { \it { n } 1 } }$ 之后扩展，说明$f \left( n 1 \right) \leq f \left( n 2 \right)$

◼当 $n 1$ 被扩展， $n 2$ 的祖先节点 $\dot { n } 3$ 在边界上，则 $f \left( n 1 \right) \leq$$f \left( n 3 \right)$ 。再根据Proposition 1， $f \left( n 1 \right) \leq f \left( n 3 \right) \leq f ( n 2 )$

# 单调性相关结论

Proposition 3：在遍历节点n时，所有??值小于 $f ( n )$ 的节点都已经被遍历过了

证明：

⚫ 假设存在路径 $p = n _ { 1 } \to \ n _ { 2 } \dots \to \ n _ { k }$ 还没有被遍历过，但

$$
f (n _ {k}) <   f (n)
$$

$\bullet$ 其中， $n _ { k }$ 是路径 $p .$ 上最后被遍历的节点

$\bullet$ 路径 $p .$ 上的节点 $\dot { n } _ { i + 1 }$ 应该已经在n被探索时的边界上了，因此

$$
f (n) \leq f (n _ {i + 1})
$$

$\bullet$ 根据命题1， $f ( n _ { i + 1 } ) \leq f ( n _ { k } )$

$\bullet$ 因此 $f ( n ) \leq f ( n _ { k } )$ ， 与假设矛盾

# 单调性相关结论

Proposition 3：在遍历节点n时，所有??值小于 $f ( n )$ 的节点都已经被遍历过了

证明：

⚫ 假设存在路径 $p = n _ { 1 } \to \ n _ { 2 } \dots \to \ n _ { k }$ 还没有被遍历过，但

$$
f (n _ {k}) <   f (n)
$$

$\bullet$ 其中， $n _ { k }$ 是路径 $p .$ 上最后被遍历的节点

$\bullet$ 路径 $p .$ 上的节点 $\dot { n } _ { i + 1 }$ 应该已经在n被探索时的边界上了，因此

$$
f (n) \leq f (n _ {i + 1})
$$

$\bullet$ 根据命题1， $f ( n _ { i + 1 } ) \leq f ( n _ { k } )$

$\bullet$ 因此 $f ( n ) \leq f ( n _ { k } )$ ， 与假设矛盾

# 单调性相关结论

Proposition 4：A*搜索第一次扩展到某个状态，其已经找到到达该状态的最小成本路径

证明：

$\bullet$ 假设路径 $\ p = \yen 123,456$ 是第一条被发现的到达??的路径

$\bullet$ 假设路径 $\cdot p ^ { \prime } = \ . . . \  \ m  \ n$ 是第二条被发现的到达 $n$ 的路径

$\bullet$ 根据Proposition 2， $f ( \mathfrak { n } ) \mathrm { v i a } \mathrm { p } = g ( \mathfrak { p } ) + h ( \mathfrak { n } ) \le f ( \mathfrak { m } )$

$\bullet$ 根据Proposition 1， $f ( m ) \leq f ( \mathrm { n } ) \mathrm { v i a } p ^ { \prime } = g ( p ^ { \prime } ) + h ( n )$

$\bullet$ 因此 $g ( p ) \leq g ( p ^ { \prime } )$ ， 即 $c ( p ) \leq \ c ( p ^ { \prime } )$

# IDA∗

A∗搜索和宽度优先搜索或一致代价搜索一样，也存在潜在的空间复杂度过大的问题。

IDA∗（迭代加深的A∗搜索）：用于解决空间复杂度过大的问题，它类似于迭代加深算法，但是IDA*用于划定界限的不是深度，而是f 值，即 $( g + h )$ ）。

在每次迭代时，IDA*划定的界限是f 值超过上次迭代的f值。

可证明，当启发函数h为可采纳时， IDA* 是最优的： let $C ^ { * }$ be the cost of the optimalsolution, the cutoff value will be increased to $C ^ { * } ,$ and an optimal solution will be found

# A∗搜索：总结

◼ 定义一个评价函数为 $f ( n ) = g ( n ) + h ( n )$

◼ 我们使用 $f ( n )$ 函数来对边界上的节点进行排序。

可采纳性： $h ( n ) \leq h ^ { \ast } \left( n \right)$

单调性：对于任意节点??1和??2：

$$
h (n _ {1}) \leq c (n _ {1} \to n _ {2}) + h (n _ {2})
$$

◼ 启发式函数具有单调性说明其也具有可采纳性。

◼ 启发式函数具有可采纳性说明其也具有最优性 (无环检测)。

◼ 只要启发式函数是单调的，就能在进行环检测之后仍然保持最优性。

A*搜索具有指数级的空间复杂度。

# 单调性结论：总结

◼ 一条路径上的节点的 $f$ 值应该是非递减的

◼ 如果??2节点在??1节点之后扩展， $\exists \mathbb { B } \mathcal { L } ( n 1 ) \leq f ( n 2 )$

◼ A*搜索第一次扩展到某个状态，其已经找到到达该状态的最小成本的路径

◼ 只要启发式函数具备单调性（一致性），就能在进行环检测之后仍然保持最优性

# 构建启发式函数：松弛问题

通过考虑一个比较简单的问题，并将 $h ( n )$ 设置为简单问题中到达目标的成本

8数码问题：当满足下面条件时，可以把方块A移动到B位置

◼A方块与B位置相邻（上/下/左/右相邻）

◼B位置是空的

![](images/65538c46e69f7dd5d47e5790e44c1536cc3da0d62d9dc411fff812ab375176ac.jpg)



Start State


![](images/ee9d615662484923446bfe7b4349993eb11af13391534676468884bf0cb8b716.jpg)



Goal State


# 构建启发式函数：松弛问题

可以放松一些条件使得问题变简单

1.只要方块A和B位置相邻就可以把A移动到B（不考虑B是否为空的条件）

2.只要B位置为空的，就可以把A移动到B（忽略相邻的条件）

3.任何情况下都可以把A移动到B（忽略两个条件）

![](images/dc358a73907261f0cd7fde0d21b9d27e8cb9a96ba744c3997813f72b13e9b735.jpg)



Start State


![](images/ef2541a0bcac5b7bd64ec0a8a4d07ec893472547870fbb5e75fc222d93e08113.jpg)



Goal State


# 构建启发式函数：松弛问题

3. 任何情况下都可以把A移动到B（忽略两个条件）

![](images/809bf4443e3113fb524534e5230043b58b958b420a9c7f495f4483c5095c7a57.jpg)



Start State


![](images/0873665850d77b7075222215433f832a1258433a428f85c95f1332a9abb91040.jpg)



Goal State


#3 可以推导出“不在目标位置方块数”(Misplaced)的启发式函数ℎ ?? = 当前状态与目标状态位置不同的方块数

可采纳性：对于没有在目标位置上的方块，我们需要至少一次动作才能把其移动到目标位置，这个动作的成本大于等于1。所以 $h ( n ) \leq h * ( n )$

单调性：任何动作都最多只能消除一个不在目标状态上的方块，因此对于任何8数字的状态，相邻状态位置不同的方块数最多差1， $h ( n 1 ) - h ( n 2 ) \leq 1$≤ ??(??1 → ??2)

# 构建启发式函数：松弛问题

![](images/274ff47ccc740a559ec68b9cd28f0fbb93373f6980b4b985953ab305af44e0c9.jpg)



Start State


![](images/1b34b7c7a57b0d042113d1c7a267dc3ee934e8775c3b408d17717b54b73f321e.jpg)



Goal State


1. 只要方块A和B位置相邻就可以把A移动到B（不考虑B是否为空的）

#1 可以推导出“曼哈顿距离”(Manhattan)的启发式函数

ℎ(??) = 所有方块到达其目标位置的曼哈顿距离之和

可采纳性：对于每个不在目标位置的方块，都需要至少d个动作才能到达目标位置，其中d是该方块初始位置到目标位置的曼哈顿距离。不同的两个不在目标位置的方块，它们的这些动作是不同的，仍有 $h ( n ) \leq h * ( n )$

单调性：任何动作最多能使一个不在目标位置的方块的曼哈顿距离减少1，因此ℎ ??1 − ℎ ??2 ≤ 1 ≤ ??(??1 → ??2)

# 构建启发式函数：松弛问题

定理：在松弛问题中，到达某个节点的最优成本是原始问题中到达该节点的可采纳的启发式函数值

证明：

⚫ 若 $P$ 是一个初始问题，设 $P _ { j }$ 是问题??的松弛问题

⚫ 那么 $S o l ( P ) \subseteq S o l \big ( P _ { j } \big )$ ， $S o l ( P )$ 表示问题 $P$ 的解节点集

于是?????????? $\varsigma t \Bigl ( S o l \bigl ( P _ { j } \bigr ) \Bigr ) \leq m i n c o s t \bigl ( S o l ( P ) \bigr )$ ，??????????????(??)表示到达节点集??中的节点的最小成本

$\bullet$ 因此 $h ( n ) \leq h ^ { * } ( n )$

# 比较两种启发式函数

定义：假如启发式函数h1和 $\mathrm { l h } 2$ 都是可采纳的，并且对于除了目标节点之外的其他节点，都有 $h 1 ( n ) \leq h 2 ( n )$ ，我们称h2函数支配了h1函数（或者h2函数比h1含有更多信息）

定理：假如h2函数支配了h1函数，那么在使用A*算法时，使用h2函数扩展的节点，使用h1函数也会扩展到。

<table><tr><td>Depth</td><td>IDS</td><td>A*(Misplaced) h1</td><td>A*(Manhattan) h2</td></tr><tr><td>10</td><td>47,127</td><td>93</td><td>39</td></tr><tr><td>14</td><td>3,473,941</td><td>539</td><td>113</td></tr><tr><td>24</td><td>---</td><td>39,135</td><td>1,641</td></tr></table>

# 应用

# 使用A*搜索解决8数码问题

采用Manhattan启发式函数 $h ( n )$ ，用带环检测的A*搜索初始状态和目标状态如下图所示的8数码问题，画出搜索图，图中标明所有节点的f值

初始：

<table><tr><td>2</td><td>8</td><td>3</td></tr><tr><td>1</td><td>6</td><td>4</td></tr><tr><td>7</td><td></td><td>5</td></tr></table>

目标：

<table><tr><td>1</td><td>2</td><td>3</td></tr><tr><td>8</td><td></td><td>4</td></tr><tr><td>7</td><td>6</td><td>5</td></tr></table>


Goal


<table><tr><td></td><td>1</td><td>2</td></tr><tr><td>3</td><td>4</td><td>5</td></tr><tr><td>6</td><td>7</td><td>8</td></tr></table>


Current


<table><tr><td>8</td><td>5</td><td>2</td></tr><tr><td>3</td><td>4</td><td></td></tr><tr><td>6</td><td>7</td><td>1</td></tr></table>

 8 tile needs to move 4 squares 5 tile needs to move 2 squares1 tile needs to move 3 squares

$h ( n ) =$ 所有方块到达其目标位置的曼哈顿距离之和

The Current state has a manhattandistannce of 9 to the goal state in the aboveexample

![](images/0bfda456780ea858170a357eecf9f19fd6dce8b9b43da56614527f925b705277.jpg)


<table><tr><td>循环</td><td>OPEN</td><td>CLOSED</td></tr><tr><td>初始化</td><td>S0</td><td></td></tr><tr><td>1</td><td>S2S1S3</td><td>S0</td></tr><tr><td>2</td><td>S6S1S3S4S5</td><td>S0S2</td></tr><tr><td>3</td><td>S7S1S3S4S5S8</td><td>S0S2S6</td></tr></table>

搜索树如左图(右上角的数字是其估价函数值)

初始:

<table><tr><td>2</td><td>8</td><td>3</td></tr><tr><td>1</td><td>6</td><td>4</td></tr><tr><td>7</td><td></td><td>5</td></tr></table>

目标：

<table><tr><td>1</td><td>2</td><td>3</td></tr><tr><td>8</td><td></td><td>4</td></tr><tr><td>7</td><td>6</td><td>5</td></tr></table>

# 积木世界规划

现有积木若干，积木可以放在桌子上，也可以放在另一块积木上面。有两种操作：

$\textcircled{1}$ move(x, y)：把积木x放到积木y上面。前提是积木x和y上面都没有其他积木。

$\textcircled{2}$ moveToTable(x)：把积木x放到桌子上，前提是积木x上面无其他积木，且积木x不在桌子上。

设计本问题的一个启发式函数h(n)，满足 $h ( n ) \leq h ^ { * } ( n )$ ，然后用A*搜索初始状态和目标状态如下图所示的规划问题：

![](images/f740cf3364c28d50c96cc6b801fc2099bdf11c8c2cca61c647bfa8676c06203d.jpg)


# 积木世界规划

◼ 积木处于其目标位置：以该积木为顶的塔出现在目标状态中

启发式函数：令h(n)为状态n中不在目标位置的积木数

◼ 可采纳性：对于每个不在目标位置的积木，需要至少1步动作来使得其到达目标位置。每块不在目标位置的积木要移动到目标位置的动作都不相同（即不存在一个动作使得两块积木同时到达目标位置的情况）

◼ 单调性：任何动作最多都只能消除一个不在目标位置的积木

# 积木世界规划

◼ 是否可以设计一个更好的具有可采纳性的启发式函数？

 （考虑下面的策略）

➢ 当积木x已经处于其目标位置，我们说x是一个good tower

➢ 如果当前状态下采取某一个动作可以创建一个good tower，则进行该动作；

➢ 否则，把一个积木移到桌上，但要确保移动的这个积木不是good tower

# 积木世界规划

◼ 一个盒子中有七个格子，里面放了黑色，白色两种木块；

◼ 三个黑色在左边，三个白色在右边，最右边一个格子空着；

一个木块移入相邻空格，耗散值（成本）为1；

◼ 一个木块相邻一个或两个其他木块跳入空格，耗散值（成本）为跳过的木块数；

◼ 游戏中将所有白色木块跳到黑色木块左边为成功。

# 滑动积木游戏

◼ 令 $h ( n )$ 为每个白色木块前的黑色木块数目和

◼ $E X  X E , E X Y  Y X E , E X Y Z  Z X Y E$

每个代价为1的动作使 $h ( n )$ 至多下降1

每个代价为2的动作使 $h ( n )$ 至多下降2

因此 $h ( n )$ 是单调的

# 传教士和野蛮人的问题

有N个传教士和N个野蛮人在河的左岸

有一艘可以载K个人的小船

◼ 寻求一种可以把所有人运到河的右岸的方法

◼ 并且要求无论何时何地 (在河的任意岸或在小船上)：传教士的人数 ≥ 野蛮人的人数或 传教士的人数 $= 0$

类似的渡河难题：

![](images/f627c9f9dba4e18ad29b0efad7105eb76c92d892454576e4c33c8acf7ed0a00e.jpg)


![](images/10f3880bc0cc58356f662ef180abafe00ca21ab666c912822894bf37062118e8.jpg)


![](images/52cc672349b62f99a1774880b520400c2f1eb601fca3ca87f836db0a1b6c733a.jpg)


![](images/7e63e556843e3cb47006a80db422605238dae0f976a7f399e682e0d133177d01.jpg)


![](images/8ec2627d264f0b4ef9ccb73fc010fb32326e09191eb03b78c8ceadec80f4cda9.jpg)


![](images/3b9a79061bc1b5cfeebbd5362a3c25c54cff4f470954020d493860f69f66edae.jpg)


吃醋丈夫；火炬过桥；狐狸、鹅与豆袋难题；船夫与羊、狼和白菜问题

# 传教士和野蛮人的问题

◼ 状态 (M, C, B) 表示：M – 左岸的传教士的人数，C –左岸的野蛮人的人数，$\mathsf { B } = 1$ 表示小船在河的左岸

◼ 动作 (m, c) 表示：m – 小船上的传教士的人数，c –小船上的野蛮人的人数

前提条件：传教士的人数和野蛮人的人数满足题目中的约束

动作的效果：

$$
(\mathrm {M}, \mathrm {C}, 1) \rightarrow (m, c) \rightarrow (M - m, C - c, 0)
$$

$$
(\mathrm {M}, \mathrm {C}, 0) \rightarrow (m, c) \rightarrow (M + m, C + c, 1)
$$

# 对于K ≤ 3时的启发式函数

$h 1 ( n ) = M + C$ 的启发式函数是可采纳的吗?

不是，考虑状态 (1, 1, 1)时，

$$
h 1 (n) = 2, \text {但} h ^ {*} (n) = 1 <   2
$$

假设 $h ( n ) = M + C - 2 B$

单调性：

$$
(\mathrm {M}, \mathrm {C}, 1) \rightarrow (m, c) \rightarrow (M - m, C - c, 0)
$$

$$
h (n _ {1}) - h (n _ {2}) = m + c - 2 \leq K - 2 \leq 1
$$

$$
(\mathrm {M}, \mathrm {C}, 0) \to (m, c) \to (M + m, C + c, 1)
$$

$$
h (n _ {1}) - h (n _ {2}) = 2 - (m + c) \leq 1, s i n c e m + c \geq 1
$$

# 直接证明可采纳性

当 B = 1，

在最好的情形下,我们在最后一步把3个人送到河的右岸

在此之前，我们可以把三个人送到右岸，再由一个人把船摆

渡到左岸。因此，每次来回都只能渡2个人过河，

$\textstyle \sum _ { \Xi } ^ { \overline { { \operatorname { m } } } } \geq 2 \left| { \frac { M + C - 3 } { 2 } } \right| + 1 \geq M + C - 2 \uparrow { \overline { { \Xi } } } / \mathcal { J } / \mathsf { F }$

当 $\mathsf { B } = 0$

我们需要一个人将船摆渡到左岸，这样就形成了B = 1的情

形。现在我们需要把M + C + 1的人摆渡到右岸

因此，我们总共需要 $i \geq M + C + 1 - 2 + 1 = M + C \uparrow$ 动作

# 直接证明可采纳性

两者结合，得到：

$$
h (n) = \left\{ \begin{array}{l l} M + C - 2, B = 1 \\ M + C, & B = 0 \end{array} \right.
$$

• 综合即 $h ( n ) = M + C - 2 B$ 此时满足A*条件

# 练习

 令N=3, $K = 2 ,$ 利用A*算法求解该问题。

# 参考

 令N=3, $K = 2 ,$ 利用A*算法求解该问题。

![](images/1bf8c9bdca43e8464a5437c42b0cb2032635f3237fa49d4578c487652acfe5eb.jpg)


# 参考

![](images/4a21a05b2580cf96eb69d6a7d3e6385a8835ac3b7edae1b4d438e877815c245d.jpg)


# 练习

 如果第一次选择状态时，选择从(3,1,0)，以及倒数第二次选择状态(1,1,1)，则会得到另外的不同路径（试一试）

 简化后的所有求解方法如下图所示：

![](images/12ea8171b626dcd355ff429a993c687ca0c1d3fd41232bba45cac627e46859ab.jpg)


# 练习

#  游戏中的怪物追逐

• 游戏中，怪物试图靠近人发起 攻击应该沿着什么路径过来 遇到障碍物该怎么办？

– 怪物可以横向、纵向、斜向运动

假定小孩不动

– 如何找到最快接近的路线？

![](images/3fdcf9e32f221f4774d563860b660b656203fe957e4b1951517884e282745694.jpg)


# 练习

#  游戏中的怪物追逐

. Step1： 状态空间和状态转移

– 直接用怪物位置作为状态

– 直接用坐标点作为转移动作

![](images/e5644e90f0e2326c0ee7f0c9fe1b8613015d460d0264e9f0e26fecc57ab64a08.jpg)


# 练习

#  游戏中的怪物追逐

• Step2： 设计A*启发函数

– 优化目标为步骤最短。

– 两点之间直线最短， 因此可以 设计启发函数为：怪物当前坐 标与小孩目标坐标的直线距离。

– 如图中(4,4)到(8,6)距离为4.47

– 显然，此时满足 $\mathtt { h } \left( \mathrm { n } \right) \leqslant \mathrm { h } * \left( \mathrm { n } \right)$

![](images/2d0a6e5eb0c9db42abb809ae0173cc5f14169fc7cc9404a32db2792494150eb1.jpg)


# 练习

#  游戏中的怪物追逐

Step3： 计算搜索过程

– 在0时刻，向8个方向行动1步，$\mathsf { g } = 1$

– 计算每种可能下的h值

– 选择最优情况前进。

– 最终路线如何？

![](images/9e1f27088f22f3f650874121e67cc39370dc0e509d10fc50891b63e2851322a9.jpg)


# A*搜索应用

•游戏AI

•导航路径

•资源分配

•机器人运动

•语言分析

![](images/808b9ef948b2aba9fad81d16aa105c3f3e484c292681b569fe1c09d6a0ee48d3.jpg)


# 课堂练习

练习2 某探险队需绕过湖到达露营地，地图由方格组成（如右图所示），湖面为不可穿越的障碍区。探险队可向上下左右或对角线移动（水平和垂直移动成本为10，对角线为15）。使用A*算法测绘最终到达目的地的最近行走距离。（探险队、湖面、露营地分别为图中圆形、矩形、星形）

![](images/993e98465d19f09d32c0500652e97d4d1158897e6a3386da89a2dd8abf48694f.jpg)


# 课堂练习

# 练习2 解：

• 选择启发式函数：考虑到可以对角线移动且代价比两次纵\横向移动更低，那么直接采用曼哈顿距离不能满足可采纳性。

• 根据问题可知，若不考虑湖面，则当前位置??到露营地的最优路径必然仅由一条斜线+一条直线组成，令：

$$
\begin{array}{l} a = \max \big (\left| x _ {g} - x _ {c u r r} \right|, \left| y _ {g} - y _ {c u r r} \right| \big) \\ b = \min (\left| x _ {g} - x _ {c u r r} \right|, \left| y _ {g} - y _ {c u r r} \right|) \\ h (n) := h (x _ {c u r r}, y _ {c u r r}) = 1 0 \times (a - b) + 1 5 \times b \\ \end{array}
$$

可采纳性：满足 $h ( n ) \leq h ^ { * } ( n )$

一致性：满足 $h ( n _ { 1 } ) \leq c ( n _ { 1 } , n _ { 2 } ) + h ( n _ { 2 } )$

![](images/8ac0049850692d6b384cb127a8f4b43e4fc93a1d644a5f875f31ae1820f34819.jpg)


# 课堂练习

# 练习2 解：

搜索过程：设起点为(1, 2)，湖面覆盖区(3,2)和(3, 3)，露营地(5,3)。（花括号第一项为坐标，第二项为f=g+h）

<table><tr><td>步骤</td><td>当前坐标</td><td>Open表</td><td>Closed表</td><td>移动方向</td></tr><tr><td>0</td><td>-</td><td>[(1,2), f = 0 + 45]</td><td>空</td><td>-</td></tr><tr><td>1</td><td>[(1,2), 0+45]</td><td>[(2,1), 15+40], [(2,2), 10 + 35], [(2,3), 15+30], [(1,3), 10 + 40], [(1,1), 10 + 50]</td><td>[(1,2)]</td><td>右上</td></tr><tr><td>2</td><td>[(2,3), 15+30]</td><td>[(2,2), 25 + 35], [(2,4), 25 + 35], [(3,4), 30 + 25]</td><td>[(1,2), (2,3)]</td><td>右上</td></tr><tr><td>3</td><td>[(3,4), 30+25]</td><td>[(3,5), 40 + 30], [(4,5), 45 + 25], [(4,4), 40 + 15], [(4,3), 45 + 10]</td><td>[(1,2), (2,3), (3,4)]</td><td>右下</td></tr></table>

![](images/ce88fa34bd09803820084253f0637e741b9a2de740f830d4878e31c62d463ca1.jpg)


# 课堂练习

# 练习2 解：

搜索过程：设起点为(1, 2)，湖面覆盖区(3,2)和(3, 3)，露营地(5,3)。（限于篇幅有些明显更远的Open表项未列出来）

<table><tr><td>步骤</td><td>当前坐标</td><td>Open表</td><td>Closed表</td><td>移动方向</td></tr><tr><td>4</td><td>[(4,3), 45+10]</td><td>[(5,3), 55 + 0], [(4,4), 55 +15], [(4,2), 55 + 15], [(5,4), 60 +10], [(5,5), 60 + 10]</td><td>[(1,2), (2,3), (3,4), (4,3)]</td><td>右</td></tr><tr><td>5</td><td>[(5,3), 55+0]</td><td colspan="3">抵达露营地，算法结束</td></tr></table>

故最短路径为(1, 2)→(2, 3)→(3, 4)→(4, 3)→(5, 3)，总成本为55。当然从过程可以看出，在同时存在相同最小f值时，选择不同的移动方向也会得到其他路径

![](images/25569bb69ebb3d21f6aab13c85ce9cace348e403b3b97e5a7f49aba42ff9a658.jpg)


# A*搜索应用

/www.youtube.com/watch?v=2XjzjAfUSING PAC-MAN VISUAL THEME

ALGORITHMS SHOUN

BREADTH-FIRSTDEPTH-FIRSTHILL CLIMBING A-STAR

# A*搜索应用

Maze solver using $\mathsf { A } ^ { * }$ pathfinder algorithm

![](images/57b7093d7f37c407c4b686fc6ae974898c1564e139b3a91fa625c704b860ee08.jpg)


# A*搜索应用

# 语音词图中的启发式搜索

在统计语音识别过程中，计算机将用户的每个发音转化成若干可能的词，构成如下的词图（比如sense、sentence）。语音识别的任务就是要在这样的词图中寻找最有可能组成合理句子的组合。

![](images/d701b72e50ff8520b080580560a8dd58df51830a3b26035f3978c98a8faca2e3.jpg)


# A*搜索应用

# 机器翻译中的启发式搜索

源语言的若干可能的翻译形式需要通过拼接，形成最终的翻译译文。每一个外文词都有很多种翻译方法，所有翻译词形成一个状态空间，最佳译文就是在状态空间中找到一个最佳的搜索路线。

![](images/a9372de4d77ccfaf0f78ece67300c588967eca9bf075e8c097885afd723ac35e.jpg)


# 练习

• 利用带环检测的宽度优先搜索解决 $\ N = 3 , K = 2$ 的时候的传教士和野蛮人的问题

• 利用带环检测的A*搜索解决 ${ N } = 5 , { K } = 3$ 的时候的传教士和野蛮人的问题

# Thanks