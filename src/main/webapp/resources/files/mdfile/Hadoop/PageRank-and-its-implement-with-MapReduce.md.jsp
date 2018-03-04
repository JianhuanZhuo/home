<%@ page contentType="text/html; charset=UTF-8" %><p>十分简洁明了的 PageRank 算法简介，值得推荐！
作者：CodeMeals
转自：<a href="http://www.cnblogs.com/fengfenggirl/">http://www.cnblogs.com/fengfenggirl/</a></p>
<!--more-->
<p>　　PageRank对网页排名的算法，曾是Google发家致富的法宝。以前虽然有实验过，但理解还是不透彻，这几天又看了一下，这里总结一下PageRank算法的基本原理。</p>
<p>一、什么是pagerank</p>
<p>　　PageRank的Page可是认为是网页，表示网页排名，也可以认为是Larry Page(google 产品经理)，因为他是这个算法的发明者之一，还是google CEO（^_^）。PageRank算法计算每一个网页的PageRank值，然后根据这个值的大小对网页的重要性进行排序。它的思想是模拟一个悠闲的上网者，上网者首先随机选择一个网页打开，然后在这个网页上呆了几分钟后，跳转到该网页所指向的链接，这样无所事事、漫无目的地在网页上跳来跳去，PageRank就是估计这个悠闲的上网者分布在各个网页上的概率。</p>
<p>二、最简单pagerank模型</p>
<p>　　互联网中的网页可以看出是一个有向图，其中网页是结点，如果网页A有链接到网页B，则存在一条有向边A-&gt;B，下面是一个简单的示例：
<img src="http://images.cnitblog.com/i/431880/201405/201959072629566.jpg" alt="" />
　　这个例子中只有四个网页，如果当前在A网页，那么悠闲的上网者将会各以1/3的概率跳转到B、C、D，这里的3表示A有3条出链，如果一个网页有k条出链，那么跳转任意一个出链上的概率是1/k，同理D到B、C的概率各为1/2，而B到C的概率为0。一般用转移矩阵表示上网者的跳转概率，如果用n表示网页的数目，则转移矩阵M是一个n*n的方阵；如果网页j有k个出链，那么对每一个出链指向的网页i，有M[i][j]=1/k，而其他网页的M[i][j]=0；上面示例图对应的转移矩阵如下：</p>
<p><img src="http://images.cnitblog.com/i/431880/201405/202015378717604.jpg" alt="" /></p>
<p>　　初试时，假设上网者在每一个网页的概率都是相等的，即1/n，于是初试的概率分布就是一个所有值都为1/n的n维列向量V0，用V0去右乘转移矩阵M，就得到了第一步之后上网者的概率分布向量MV0,（nXn）*(nX1)依然得到一个nX1的矩阵。下面是V1的计算过程：</p>
<p><img src="http://images.cnitblog.com/i/431880/201405/202114099185287.jpg" alt="" /></p>
<p>　　注意矩阵M中M[i][j]不为0表示用一个链接从j指向i，M的第一行乘以V0，表示累加所有网页到网页A的概率即得到9/24。得到了V1后，再用V1去右乘M得到V2，一直下去，最终V会收敛，即Vn=MV(n-1)，上面的图示例，不断的迭代，最终V=[3/9,2/9,2/9,2/9]'：</p>
<p><img src="http://images.cnitblog.com/i/431880/201405/261719185728644.jpg" alt="" /></p>
<p>三、终止点问题</p>
<p>　　上述上网者的行为是一个马尔科夫过程的实例，要满足收敛性，需要具备一个条件：</p>
<p>图是强连通的，即从任意网页可以到达其他任意网页：
　　互联网上的网页不满足强连通的特性，因为有一些网页不指向任何网页，如果按照上面的计算，上网者到达这样的网页后便走投无路、四顾茫然，导致前面累计得到的转移概率被清零，这样下去，最终的得到的概率分布向量所有元素几乎都为0。假设我们把上面图中C到A的链接丢掉，C变成了一个终止点，得到下面这个图：</p>
<p><img src="http://images.cnitblog.com/i/431880/201405/202114482318158.jpg" alt="" /></p>
<p>　　对应的转移矩阵为：</p>
<p><img src="http://images.cnitblog.com/i/431880/201405/202116138097136.jpg" alt="" /></p>
<p>　　连续迭代下去，最终所有元素都为0：　　</p>
<p><img src="http://images.cnitblog.com/i/431880/201405/202119194819359.jpg" alt="" /></p>
<p>四、陷阱问题</p>
<p>　　另外一个问题就是陷阱问题，即有些网页不存在指向其他网页的链接，但存在指向自己的链接。比如下面这个图：</p>
<p><img src="http://images.cnitblog.com/i/431880/201405/202128577315418.jpg" alt="" /></p>
<p>　　上网者跑到C网页后，就像跳进了陷阱，陷入了漩涡，再也不能从C中出来，将最终导致概率分布值全部转移到C上来，这使得其他网页的概率分布值为0，从而整个网页排名就失去了意义。如果按照上面图对应的转移矩阵为：　</p>
<p><img src="http://images.cnitblog.com/i/431880/201405/202133299812792.jpg" alt="" /></p>
<p>　　不断的迭代下去，就变成了这样：</p>
<p><img src="http://images.cnitblog.com/i/431880/201405/202136578712805.jpg" alt="" /></p>
<p>五、解决终止点问题和陷阱问题</p>
<p>　　上面过程，我们忽略了一个问题，那就是上网者是一个悠闲的上网者，而不是一个愚蠢的上网者，我们的上网者是聪明而悠闲，他悠闲，漫无目的，总是随机的选择网页，他聪明，在走到一个终结网页或者一个陷阱网页（比如两个示例中的C），不会傻傻的干着急，他会在浏览器的地址随机输入一个地址，当然这个地址可能又是原来的网页，但这里给了他一个逃离的机会，让他离开这万丈深渊。模拟聪明而又悠闲的上网者，对算法进行改进，每一步，上网者可能都不想看当前网页了，不看当前网页也就不会点击上面的连接，而上悄悄地在地址栏输入另外一个地址，而在地址栏输入而跳转到各个网页的概率是1/n。假设上网者每一步查看当前网页的概率为a，那么他从浏览器地址栏跳转的概率为(1-a)，于是原来的迭代公式转化为：</p>
<p><img src="http://images.cnitblog.com/i/431880/201405/202158112317322.jpg" alt="" /></p>
<p>　　现在我们来计算带陷阱的网页图的概率分布：</p>
<p><img src="http://images.cnitblog.com/i/431880/201405/202205000122441.jpg" alt="" /></p>
<p>　　重复迭代下去，得到：</p>
<p><img src="http://images.cnitblog.com/i/431880/201405/202208390746633.jpg" alt="" /></p>
<p>　　可以看到C虽然占了很大一部分pagerank值，但其他网页页获得的一些值，因此C的链接结构，它的权重确实应该会大些。</p>
<p>六、用Map-reduce计算Page Rank</p>
<p>　　上面的演算过程，采用矩阵相乘，不断迭代，直到迭代前后概率分布向量的值变化不大，一般迭代到30次以上就收敛了。真的的web结构的转移矩阵非常大，目前的网页数量已经超过100亿，转移矩阵是100亿*100亿的矩阵，直接按矩阵乘法的计算方法不可行，需要借助Map-Reduce的计算方式来解决。实际上，google发明Map-Reduce最初就是为了分布式计算大规模网页的pagerank，Map-Reduce的pagerank有很多实现方式，我这里计算一种简单的。</p>
<p>　　考虑转移矩阵是一个很多的稀疏矩阵，我们可以用稀疏矩阵的形式表示，我们把web图中的每一个网页及其链出的网页作为一行，这样第四节中的web图结构用如下方式表示：</p>
<pre><code class="language-python">A    B    C    D
B    A    D
C    C
D    B    C
</code></pre>
<p>　　A有三条出链，分别指向B、C、D，实际上，我们爬取的网页结构数据就是这样的。</p>
<p>　　1、Map阶段</p>
<p>　　Map操作的每一行，对所有出链发射当前网页概率值的1/k，k是当前网页的出链数，比如对第一行输出&lt;B，1/3<em>1/4&gt;,&lt;C，1/3</em>1/4&gt;,&lt;D，1/3*1/4&gt;;</p>
<p>　　2、Reduce阶段</p>
<p>　　Reduce操作收集网页id相同的值，累加并按权重计算，pj=a*(p1+p2+...Pm)+(1-a)*1/n，其中m是指向网页j的网页j数，n所有网页数。</p>
<p>　　思路就是这么简单，但是实践的时候，怎样在Map阶段知道当前行网页的概率值，需要一个单独的文件专门保存上一轮的概率分布值，先进行一次排序，让出链行与概率值按网页id出现在同一Mapper里面，整个流程如下：</p>
<p><img src="http://images.cnitblog.com/i/431880/201405/211557326376640.jpg" alt="" /></p>
<p>　　这样进行一次迭代相当于需要两次MapReduce，但第一次的MapReduce只是简单的排序，不需要任何操作，用python调用Hadoop的Streaming.</p>
<p>　　SortMappert.py代码如下:</p>
<pre><code class="language-python">1 #!/bin/python
2 '''Mapper for sort'''
3 import sys
4 for line in sys.stdin:
5      print line.strip()
</code></pre>
<p>　　SortReducer.py也是一样</p>
<pre><code class="language-python">1 #!/bin/python
2 '''Reducer for sort'''
3 import sys
4 for line in sys.stdin:
5       print line.strip()
　　PageRankMapper.py代码:
</code></pre>
<pre><code class="language-python"> 1 ''' mapper of pangerank algorithm'''
 2 import sys
 3 id1 = id2 = None
 4 heros = value = None
 5 count1 = count2 = 0
 6 
 7 for line in sys.stdin:
 8     data = line.strip().split('\t')
 9     if len(data) == 3 and data[1] == 'a':# This is the pangerank value
10         count1 += 1
11         if count1 &gt;= 2:
12             print '%s\t%s' % (id1,0.0)
13             
14         id1 = data[0]
15         value = float(data[2]) 
16     else:#This the link relation
17         id2 = data[0]
18         heros = data[1:]
19     if id1 == id2 and id1:
20         v = value / len(heros)
21         for hero in heros:
22             print '%s\t%s' % (hero,v)
23         print '%s\t%s' % (id1,0.0)
24         id1 = id2 = None
25         count1 = 0
</code></pre>
<p>　　PageRankReducer.py代码:</p>
<pre><code class="language-python"> 1 ''' reducer of pagerank algorithm'''
 2 import sys
 3 last = None
 4 values = 0.0
 5 alpha = 0.8
 6 N = 4# Size of the web pages
 7 for line in sys.stdin:
 8     data = line.strip().split('\t')
 9     hero,value = data[0],float(data[1])
10     if data[0] != last:
11         if last:
12             values = alpha * values + (1 - alpha) / N
13             print '%s\ta\t%s' % (last,values)
14         last = data[0]
15         values = value
16     else:
17         values += value #accumulate the page rank value
18 if last:
19     values = alpha * values + (1 - alpha) / N
20     print '%s\ta\t%s' % (last,values)
</code></pre>
<p>　　在linux下模仿Map-Reduce的过程：</p>
<pre><code class="language-python"> 1 #!/bin/bash
 2 PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games
 3 export PATH
 4 max=10
 5 for i in `seq 1 $max`
 6 do
 7     echo &quot;$i&quot;
 8     cat links.txt pangerank.value &gt; tmp.txt 
 9     cat tmp.txt |sort|python PageRankMapper.py |sort|python PageRankReducer.py &gt;pangerank.value
10 done
</code></pre>
<p>　　这个代码不用改动就可以直接在hadoop上跑起来。调用hadoop命令：</p>
<pre><code class="language-python"> 1 #!/bin/bash
 2 
 3 #sort
 4 mapper=SortMapper.py
 5 reducer=SortReducer.py
 6 input=&quot;yours HDFS dir&quot;/links.txt
 7 input=&quot;yours HDFS dir&quot;/pagerank.value
 8 output=&quot;yours HDFS dir&quot;/tmp.txt
 9 
10 hadoop jar contrib/streaming/hadoop-*streaming*.jar \
11     -mapper /home/hduser/mapper.py \
12     -reducer /home/hduser/reducer.py -file *.py\
13     -input $input \
14     -output $output
15     
16     
17 #Caculator PageRank
18 mapper=PageRankMapper.py
19 reducer=PageRankReducer.py
20 input=&quot;yours HDFS dir&quot;/tmp.txt
21 output=&quot;yours HDFS dir&quot;/pagerank.value
22 
23 hadoop jar contrib/streaming/hadoop-*streaming*.jar \
24     -mapper /home/hduser/mapper.py \
25     -reducer /home/hduser/reducer.py -file *.py\
26     -input $input \
27     -output $output
</code></pre>
<p>　　关于使用python操作hadoop可以查看参考文献。python代码写得浓浓的C味，望海涵！</p>
<p>　　第四步中带环的陷阱图，迭代40次，权值a取0.8，计算结果如下：</p>
<pre><code class="language-python"> 1 A            B                C                D
 2 0.15    0.216666666667    0.416666666667    0.216666666667    
 3 0.136666666666    0.176666666666    0.51    0.176666666666    
 4 0.120666666666    0.157111111111    0.565111111111    0.157111111111    
 5 0.112844444444    0.145022222222    0.597111111111    0.145022222222    
 6 0.108008888889    0.138100740741    0.615789629629    0.138100740741    
 7 0.105240296296    0.134042666667    0.62667437037    0.134042666667    
 8 0.103617066667    0.131681145679    0.633020641975    0.131681145679    
 9 0.102672458272    0.130303676049    0.636720189629    0.130303676049    
10 0.10212147042    0.129500792625    0.638876944329    0.129500792625    
11 0.10180031705    0.129032709162    0.640134264625    0.129032709162    
12 0.101613083665    0.128759834878    0.640867246578    0.128759834878    
13 0.101503933951    0.128600756262    0.641294553524    0.128600756262    
14 0.101440302505    0.128508018225    0.641543661044    0.128508018225    
15 0.10140320729    0.128453954625    0.64168888346    0.128453954625    
16 0.10138158185    0.128422437127    0.641773543895    0.128422437127    
17 0.101368974851    0.128404063344    0.64182289846    0.128404063344    
18 0.101361625338    0.128393351965    0.641851670733    0.128393351965    
19 0.101357340786    0.128387107543    0.641868444129    0.128387107543    
20 0.101354843017    0.128383467227    0.64187822253    0.128383467227    
21 0.101353386891    0.128381345029    0.641883923053    0.128381345029    
22 0.101352538012    0.128380107849    0.641887246292    0.128380107849    
23 0.10135204314    0.128379386609    0.641889183643    0.128379386609    
24 0.101351754644    0.128378966148    0.641890313062    0.128378966148    
25 0.101351586459    0.128378721031    0.641890971481    0.128378721031    
26 0.101351488412    0.128378578135    0.64189135532    0.128378578135    
27 0.101351431254    0.128378494831    0.641891579087    0.128378494831    
28 0.101351397932    0.128378446267    0.641891709536    0.128378446267    
29 0.101351378507    0.128378417955    0.641891785584    0.128378417955    
30 0.101351367182    0.128378401451    0.641891829918    0.128378401451    
31 0.10135136058    0.128378391829    0.641891855763    0.128378391829    
32 0.101351356732    0.12837838622    0.64189187083    0.12837838622    
33 0.101351354488    0.12837838295    0.641891879614    0.12837838295    
34 0.10135135318    0.128378381043    0.641891884735    0.128378381043    
35 0.101351352417    0.128378379932    0.64189188772    0.128378379932    
36 0.101351351973    0.128378379284    0.64189188946    0.128378379284    
37 0.101351351714    0.128378378906    0.641891890474    0.128378378906    
38 0.101351351562    0.128378378686    0.641891891065    0.128378378686    
39 0.101351351474    0.128378378558    0.64189189141    0.128378378558    
40 0.101351351423    0.128378378483    0.641891891611    0.128378378483    
41 0.101351351393    0.128378378439    0.641891891728    0.128378378439    
</code></pre>
<p>　　可以看到pagerank值已经基本趋于稳定，并与第四步的分数表示一致。</p>
<p>　　2014.11.16注：上面写的map-reduce计算过程在多节点集群下有问题，在第二个map输入时，由于数据分片导致一部分结点的出链与pagerank值不在同一个块中，导致该结点对其他结点的贡献被忽略。单节点下不会出现这个问题。（感谢网友@桔子 的指正）。</p>
<p>　　PageRank的简介就介绍到这里了，如果想深入可以参考原论文或者下面的参考文献</p>
<p>参考文献</p>
<p>　　1.《Mining of Massive Datasets》</p>
<p>　　2.《An introduction to information retrival》</p>
<p>　　3.使用python操作Hadoop</p>
<p>　　4.js可视化展示PageRank计算过程(可能需要梯子)，可访问作者博客.</p>
