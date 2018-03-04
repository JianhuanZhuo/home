<%@ page contentType="text/html; charset=UTF-8" %><p>Grunt 不是一句粗话，而是一个 JavaScript 自动构建工具</p>
<!-- more -->
<h2>安装</h2>
<p>需要用到 node.js</p>
<ol>
<li>使用 <code>npm install -g grunt-cli</code> 全局安装 grunt</li>
<li>创建一个 grunt 工程所需的文件夹，文件夹名不要是 grunt，如 tires</li>
<li>进入这个文件夹后，<code>npm init</code> 初始化工程文件夹，</li>
<li>使用 <code>npm install grunt --save-dev</code> 添加 grunt 依赖</li>
<li>编写 Gruntfile.js，在文件内加入下节内容。</li>
<li>使用 <code>grunt</code> 命令即可运行默认任务，得到 <code>Hello World</code> 的输出！</li>
</ol>
<h2>任务注册语法</h2>
<pre><code class="language-js">// Gruntfile.js 文件，放置在项目根目录，用于配置任务
// 暴露模块接口
module.exports = function (grunt) {
    // 注册默认任务
    grunt.registerTask('default', function(){
        console.log(&quot;Hello World&quot;);
    });

    // 注册一个 greet 任务，接受一个参数
    // 调用方法为：grunt greet:param
    grunt.registerTask('greet', function(name){
        grunt.log.writeln('Hi there, ' + name);
    });

    // 注册一个 addNumbers 任务，接受多个参数
    // 这里在调用时可以使用 --force 参数在发生错误时，继续执行，如下：
    // grunt addNumbers:a:b --force
    grunt.registerTask('addNumbers', function(first, second){
        if(isNaN(Number(first))){
            grunt.warn('The first argument must be a number.');
        }
        var answer = Number(first) + Number(second);
        grunt.log.writeln(first + ' + ' + second + ' is ' + answer);
    });

    // 注册一个 all 任务，其后跟着任务列表，表示一次性调用多个任务
    grunt.registerTask('all', ['default', 'greet:Brian', 'addNumbers:2:3']);

    // registerTask 可以带一个描述性的参数，在使用 grunt --help 时查看
    grunt.registerTask('praise', 'Just a description.', function () {
        // 这里可以使用 grunt.log 代替 console
        grunt.log.writeln('Hello using grunt.log');
    });
}
</code></pre>
<h2>文件管理</h2>
<pre><code class="language-js">// 在指定文件中写入 content 内容
grunt.file.write(workingDirectory + '/version.txt', content);

// 指定路径创建目录
grunt.file.mkdir('directory');

// 删除指定路径（及其下的文件）
grunt.file.delete(grunt.config.get('copyFiles.options.workingDirectory'));

// 检查 source 是否为一个文件夹
if(grunt.file.isDir(source)){ /*...*/ }

// 对 source 下的每个文件和子文件夹，调用传入的回调函数，相当于遍历
grunt.file.recurse(source, function(file){
        recursiveCopy(file, destination);
      });


// 读 JSON 文件
grunt.file.readJSON('package.json'),

// 从 destination 向 source 拷贝文件
grunt.file.copy(source, destination);  
</code></pre>
<h2>其他</h2>
<p>使用局部变量</p>
<pre><code class="language-js">module.exports = function(grunt){
  grunt.config.init({
    // 定义变量 pkg
    pkg: grunt.file.readJSON('package.json'),
    copyFiles: {
      options: {
        workingDirectory: 'working',
        manifest: [
          'index.html', 'stylesheets/', 'javascripts/'
        ]
      }
    }
  });
  //...

  // 局部变量 pkg 的使用
  var content = '&lt;%=pkg.name %&gt; version &lt;%= pkg.version %&gt;';
}
</code></pre>
<h2>多任务注册</h2>
<pre><code class="language-js">module.exports = function (grunt) {

    // 配置任务的初始化属性，
    grunt.config.init({
        // 配置多目标及其对应的参数数据
        // 这里的任务名要与下面注册的任务名一致
        multiTask: {
            t1: 'd1',
            't2': 123
        }
    });

    // 使用 registerMultiTask 方法注册多任务
    // 使用 this.target 和 this.data 获得目标和任务
    grunt.registerMultiTask('multiTask', function () {
        console.log(this.target + &quot; -&gt;&quot; + this.data);
    });
}
</code></pre>
<p>使用 <code>grunt multiTask</code> 命令得到的输出如下：</p>
<pre><code class="language-bash">D:\book\代码\tires&gt;grunt multiTask
Running &quot;multiTask:t1&quot; (multiTask) task
t1 -&gt;d1

Running &quot;multiTask:t2&quot; (multiTask) task
t2 -&gt;123

Done.
</code></pre>
