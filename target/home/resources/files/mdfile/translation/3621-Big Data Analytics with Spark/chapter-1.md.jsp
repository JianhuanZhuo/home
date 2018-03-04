<%@ page contentType="text/html; charset=UTF-8" %><p>title: 大数据技术概览
date : 2018/1/20</p>
<hr />
<h1>1. 大数据技术概览</h1>
<p>We are in the age of big data. Data has not only become the lifeblood of any organization, but is also growing exponentially. Data generated today is several magnitudes larger than what was generated just a few years ago. The challenge is how to get business value out of this data. This is the problem that big data–related technologies aim to solve. Therefore, big data has become one of the hottest technology trends over the last few years. Some of the most active open source projects are related to big data, and the number of these projects is growing rapidly. The number of startups focused on big data has exploded in recent years. Large established companies are making significant investments in big data technologies.
Although the term “big data” is hot, its definition is vague. People define it in different ways. One definition relates to the volume of data; another definition relates to the richness of data. Some define big data as data that is “too big” by traditional standards; whereas others define big data as data that captures more nuances about the entity that it represents. An example of the former would be a dataset whose volume exceeds petabytes or several terabytes. If this data were stored in a traditional relational database (RDBMS) table, it would have billions of rows. An example of the latter definition is a dataset with extremely wide rows. If this data were stored in a relational database table, it would have thousands of columns. Another popular definition of big data is data characterized by three Vs: volume, velocity, and variety. I just discussed volume. Velocity means that data is generated at a fast rate. Variety refers to the fact that data can be unstructured, semi-structured, or multi-structured.
Standard relational databases could not easily handle big data. The core technology for these databases was designed several decades ago when few organizations had petabytes or even terabytes of data. Today it is not uncommon for some organizations to generate terabytes of data every day. Not only the volume of data, but also the rate at which it is being generated is exploding. Hence there was a need for new technologies that could not only process and analyze large volume of data, but also ingest large volume of data at a fast pace.
Other key driving factors for the big data technologies include scalability, high availability, and fault tolerance at a low cost. Technology for processing and analyzing large datasets has been extensively researched and available in the form of proprietary commercial products for a long time. For example, MPP (massively parallel processing) databases have been around for a while. MPP databases use a “shared-nothing” architecture, where data is stored and processed across a cluster of nodes. Each node comes with its own set of CPUs, memory, and disks. They communicate via a network interconnect. Data is partitioned across a cluster of nodes. There is no contention among the nodes, so they can all process data in parallel. Examples of such databases include Teradata, Netezza, Greenplum, ParAccel, and Vertica. Teradata was invented in the late 1970s, and by the 1990s, it was capable of processing terabytes of data. However, proprietary MPP products are expensive. Not everybody can afford them.
This chapter introduces some of the open source big data–related technologies. Although it may seem that the technologies covered in this chapter have been randomly picked, they are connected by a common theme. They are used with Spark, or Spark provides a better alternative to some of these technologies. As you start using Spark, you may run into these technologies. In addition, familiarity with these technologies will help you better understand Spark, which we will introduce in Chapter 3.</p>
<p>当前正是大数据时代。数据不仅成为任何机构不可缺失的东西，而且还在成倍增长。今天新生的数据比几年前产生的数据大几个数量级。面临的挑战是如何从这些数据中获得商业价值。这是大数据相关技术所要解决的问题。因此，大数据已经成为过去几年最热门的技术趋势之一。一些最活跃的开源项目与大数据有关，而且这些项目的数量正在迅速增长。关注大数据的创业公司数量近年来呈爆炸式增长。大型公司正在对大数据技术进行重大投资。
尽管「大数据」这个词很热，但其定义却是模糊的。人们用不同的方式来定义它。一个定义与数据量有关;另一个定义涉及数据的丰富性。有些将大数据定义为传统标准“太大”的数据;而另一些人则把大数据定义为能够捕捉它所代表的实体的细微差别的数据。前者的一个例子是一个数据集，其数据量超过了PB或者几个TB。如果这些数据存储在传统的关系数据库（RDBMS）表中，则会有数十亿行。后一个定义的例子是具有极宽行的数据集。如果这些数据存储在关系数据库表中，则会有数千列。大数据的另一个流行定义是以三个Vs为特征的数据：音量，速度和多样性。我刚才讨论的量。速度意味着数据以很快的速度生成。数据是指数据可以是非结构化的，半结构化的或多结构的。
标准的关系数据库不能轻易处理大数据。这些数据库的核心技术是几十年前设计的，当时很少有组织拥有PB级甚至TB级的数据。今天，一些组织每天产生数TB的数据并不罕见。不仅数据量大，而且数据的产生速度也在爆炸式增长。因此需要新的技术，不仅能够处理和分析大量的数据，而且能够快速地消化大量的数据。
大数据技术的其他主要驱动因素包括可扩展性，高可用性和低成本的容错性。用于处理和分析大型数据集的技术已经被广泛研究并且以专有商业产品的形式长期存在。例如，MPP（大规模并行处理）数据库已经有一段时间了。 MPP数据库使用“无共享”体系结构，数据在一组节点中存储和处理。每个节点都有自己的一组CPU，内存和磁盘。他们通过网络互连进行通信。数据通过节点集群进行分区。节点之间没有争用，所以它们都可以并行处理数据。这些数据库的例子包括Teradata，Netezza，Greenplum，ParAccel和Vertica。 Teradata是在20世纪70年代后期发明的，到20世纪90年代，它能够处理TB级的数据。但是，专有的MPP产品价格昂贵。不是每个人都能负担得起。
本章介绍一些开源的大数据相关技术。虽然看起来本章所涵盖的技术是随机挑选出来的，但它们之间却有一个共同的主题。它们与Spark一起使用，或者Spark为这些技术中的一些提供了更好的替代方案。当你开始使用Spark时，你可能会遇到这些技术。此外，熟悉这些技术将有助于您更好地理解Spark，我们将在第3章中介绍。</p>
