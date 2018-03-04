<%@ page contentType="text/html; charset=UTF-8" %><h2>基于 MySQL 官方插件的 menmcached 实现</h2>
<p>一般是通过开发人员开发中间件实现的，MySQL 考虑到中小型公司没有能力做 memcache 插件的开发，通过 MySQL 官方提供的解决方案。</p>
<h3>参考资料</h3>
<ul>
<li><a href="http://www.memcached.org/">memcached.org 网站</a></li>
<li><a href="https://dev.mysql.com/doc/refman/8.0/en/innodb-memcached.html">MySQL Reference Manual - InnoDB memcached Plugin</a></li>
<li><a href="https://dev.mysql.com/doc/ndbapi/en/ndbmemcache.html">MySQL NDB - Memcache API for NDB Cluster</a></li>
</ul>
<h3>安装</h3>
<p>如果使用官方发布的 RPM 包，则 memcached 插件已附带在 MySQL-server 包中，如果是源代码编译，则应该在编译过程中加入如下的配置项：</p>
<blockquote>
<p>cmake . -DWITH_INNODB_MEMCACHED=ON</p>
</blockquote>
<p>在安装的过程中，需要注意的是 memcached 插件依赖于 libevent 包</p>
<h3>加载插件</h3>
<p>MySQL 插件需要通过加载才能使用，<code>select @@plugin_dir</code> 命令查看插件存储目录</p>
<blockquote>
<p>mysql&gt; select @@plugin_dir;
+--------------------------+
| @@plugin_dir             |
+--------------------------+
| /usr/lib64/mysql/plugin/ |
+--------------------------+
1 row in set</p>
</blockquote>
<p>在上述得到的目录中，应该包含有 libmemcached.so 文件</p>
<p>此外，还需预先导入表结构，这些表用于控制、配置 memcache。可使用如下语句导入：</p>
<blockquote>
<p>#mysql -p &lt; /usr/share/mysql/innodb_memcached_config.sql</p>
</blockquote>
<p>这个导入过程中，如果你的数据库中有 <code>test</code> 数据库，则会在 <code>test</code> 数据库中添加一个范例表 <code>demo_test</code>，用于官方范例演示。</p>
<p>导入完成后，会创建一个 <code>innodb_memcache</code> 数据库，数据库中应该有如下三个表：</p>
<ul>
<li>cache_policies 定义缓冲策略的表</li>
<li>config_options 定义分割符号</li>
<li>containers 定义容器</li>
</ul>
<p>至此，可以使用 MySQL 的 <code>install</code> 命令加载插件了，相对的 <code>uninstall</code> 命令用于卸载插件，重启插件（例如让新的配置生效）则先卸载再加载即可。</p>
<blockquote>
<p>mysql&gt; install plugin daemon_memcached soname 'libmemcached.so'
mysql&gt; uninstall pligin daemon_memcached</p>
</blockquote>
<p>加载后，便可以使用如下命令查看插件配置信息了</p>
<blockquote>
<p>mysql&gt; show variables like '%memcache';
+----------------------------------+------------------+
| Variable_name                    | Value            |
+----------------------------------+------------------+
| daemon_memcached_enable_binlog   | OFF              |
| daemon_memcached_engine_lib_name | innodb_engine.so |
| daemon_memcached_engine_lib_path |                  |
| daemon_memcached_option          |                  |
| daemon_memcached_r_batch_size    | 1                |
| daemon_memcached_w_batch_size    | 1                |
+----------------------------------+------------------+
5 rows in set (0.00 sec)</p>
</blockquote>
<p>其中：</p>
<ul>
<li>enable_binlog 表示是否将 memcache 的操作记录至二进制日志</li>
<li>engine_lib_name 指定支持的数据库引擎，貌似支持 innodb</li>
<li>engine_lib_path 指定引擎所在的路径，空则为默认路径</li>
<li>option 指定 memcache 启动参数，如内存大小等</li>
<li>r_batch_size 指定读合并大小</li>
<li>w_batch_size 指定些合并大小</li>
</ul>
<p>可以通过查看<code>11211</code>端口查看 memcache 是否已经成功启动。</p>
<blockquote>
<p>netstat -an | grep 11211</p>
</blockquote>
<h3>cache_polices 表</h3>
<p>在 cache_polices 表中定义了缓存策略，包含了如下的选择：</p>
<ul>
<li>innodb_only 只选择 InnoDB 作为数据存储</li>
<li>cache_only 只使用 传统的 Memcached 引擎作为后端存储</li>
<li>caching 二者皆使用，如果在 Memcached 里找不到，就查询 InnoDB</li>
<li>disabled 关闭该功能</li>
</ul>
<p>也就起到了<strong>缓冲区</strong>的功能</p>
<ul>
<li>policy_name 表示策略名</li>
<li>get_policy 读策略</li>
<li>set_policy 写策略</li>
<li>delete_policy 删除策略</li>
<li>flush_policy 清空策略</li>
</ul>
<h3>config_options</h3>
<ul>
<li>separator Memcached 只识别单值，使用此分割符 <code>|</code> 来连接多个字段的值</li>
<li>table_map_delimiter 通过此分割符 <code>.</code> 来确认表和键，如 <code>@@table.key</code></li>
</ul>
<p>flags : 附加信息
cas_column ： 版本号，防止误写操作操作新旧数据冲突
expire_time_column : 过期时间，表示缓存在 Memcache 中的数据多久后会失效</p>
<h2>Memcache 语法</h2>
<p>在 MySQL 中需要添加容器的名称</p>
<h3>基本语法</h3>
<p>SET 设置指定键的值，对已存在的值会覆盖。</p>
<p>ADD 仅当缓存中不存在键时，<code>add</code> 命令才会添加键值对，否则不存入并返回 <code>NOT_STORED</code> 响应。</p>
<blockquote>
<p>set userID 0 0 5
12345
STORED</p>
</blockquote>
<p>再次添加时</p>
<blockquote>
<p>add userID 0 0 5
55555
NOT_STORED</p>
</blockquote>
<p>REPLACE 存在则修改命令</p>
<p>GET 检索命令</p>
<blockquote>
<p>get @@aaa.cc
VALUE @@aaa.cc 9 6
thanks
END</p>
</blockquote>
<p>DELETE 删除命令，删除存在的键值对，不存在则返回 <code>NOT_FOUND</code> 响应</p>
<blockquote>
<p>delete @@aaa.cc
DELETED</p>
</blockquote>
<h3>高级语法</h3>
<p>GETS 类似于 GET 命令，但可以返回额外的版本号信息</p>
<p>CAS 类似于 <code>check</code> 和 <code>set</code> 的结合。在设置之前会检查版本号，如果版本号比较低则不修改且返回 <code>EXISTS</code> 响应。</p>
<p>STATS 转存所连接的 memcache 实例的当前统计数据，服务器的状态。
其中两个重要的统计数据为：</p>
<ul>
<li>get_hits 找到键值对的次数</li>
<li>get_misses 未找到键值对的次数</li>
</ul>
<p>其中在 memcache 刚启动时，<code>get_misses</code> 快速增长很正常，而后命中率应该趋于平缓。</p>
<h3>Memcache 使用</h3>
<p>步骤1：扩展原有表的字段，使其符合 memcache 插件的要求
步骤2：在 containers 表中增加新的配置
步骤3：检查结果</p>
