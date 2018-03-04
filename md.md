---
title: flexmark-java
date: 2018/1/26
tag: {scvs, 2}
tagx: ['x', 'y']
hash: { name: Steve, foo: bar } 
animal: [Cat, Dog]
list_num: false
categories:
 - ☎ 经验累积
 - 其他

---

## maven 引入
``` xml
<dependency>
    <groupId>com.vladsch.flexmark</groupId>
    <artifactId>flexmark-all</artifactId>
    <version>0.22.4</version>
</dependency>
```



项目 github：[https://github.com/sirthias/pegdown](https://github.com/sirthias/pegdown)
API 文档：[http://sirthias.github.com/pegdown/api](http://sirthias.github.com/pegdown/api)



管理上需要

<!--more-->

## IDEA 创建分支 ##
创建分支之前你得需要在 SVN 上知道个可以存放分支的地方，一般来说，项目上应该有两个文件夹 `[pro_root]\trunk` 和 `pro_root\branches` 两个文件夹，trunk 文件夹存放项目的主干分支，而 branches 则存放各种小分支。

很不幸，虽然我现在的项目之前木有这么个设定，于是乎自己创建了个文件夹 `dap_branches` 用于存放分支。

接下来是创建一个分支，在使用命令行时使用如下命令
``` bash
$ svn copy [source_pro_url]\trunk \
           [target_pro_url]\branches\ [target_new_branch]
           -m "some message to log this change!"
```


命令 | 描述
------- | -------
tomcat:deploy | 部署一个web war包
tomcat:reload | 重新加载web war包
tomcat:start | 启动tomcat
tomcat:stop | 停止tomcat
tomcat:undeploy | 停止一个war包
tomcat:run | 启动嵌入式tomcat ，并运行当前项目


$$
xx < \{
fgs
$$
