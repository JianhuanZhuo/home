<%@ page contentType="text/html; charset=UTF-8" %><p>title: angular 模块
date : 2017/8/3</p>
<hr />
<h2>指示器</h2>
<p>指示器附加到指定的 DOM 节点，并作用于该节点及其下的全部子孙元素。</p>
<p><code>ng-bind=&quot;variable&quot;</code> 与 <code>{{variable}}</code> 功能上等价。
<code>ng-show</code> 用于决定该节点是否显示
<code>ng-class</code> 用于选择 CSS 类应用，接受字符串类型或对象类型，字符串类型直接作为 class 名应用，对象则会根据 value 是否为 true，而选择性的应用对应的 key。</p>
<h2>模块</h2>
<p>模块 <code>module</code> 定义如下：</p>
<pre><code class="language-js">// 第一个参数是模块名
// 第二个参数是依赖列表数组
angular.module('noteApp', []);
</code></pre>
<p>加载已存在的模块，使得当前文件可以对它进行使用、添加或修改。</p>
<pre><code class="language-js">// 加载已存的名为 existApp 的模块
angular.module('existApp')
</code></pre>
<blockquote>
<p>如上，如果你在定义一个模块时忘了添加第二个参数（即使是空），那么就会变成加载模块。因而导致出现 <code>No module found</code> 错误。</p>
</blockquote>
<blockquote>
<p>Trying to load a module from another file to modify, but the file that defines the module has not been loaded first. Make sure the file that defines the module is loaded first in your HTML before you try to use it.</p>
</blockquote>
<h2>控制器</h2>
<p>MVC 模式下的控制创建，我们使用 module 对象的 <code>.controller</code> 方法创建控制器：</p>
<pre><code class="language-html">&lt;!-- File: chapter2/creating-controller.html --&gt;
&lt;html ng-app=&quot;notesApp&quot;&gt;
&lt;head&gt;&lt;title&gt;Hello AngularJS&lt;/title&gt;&lt;/head&gt;
&lt;body ng-controller=&quot;MainCtrl as ctrl&quot;&gt;
  Hello {{1 + 1}}nd time AngularJS

  &lt;br&gt;
  {{ctrl.message}} AngularJS.

  &lt;button ng-click=&quot;ctrl.changeMessage()&quot;&gt;
    Change Message
  &lt;/button&gt;
&lt;script
  src=&quot;https://ajax.googleapis.com/ajax/libs/angularjs/1.3.11/angular.js&quot;&gt;
&lt;/script&gt;
&lt;script type=&quot;text/javascript&quot;&gt;
  angular.module('notesApp', [])
    // 第一个参数表示控制器名
    // 第二个参数是由控制器的依赖列表和实际执行函数构成的数组
    .controller('MainCtrl', [function() {
      // Controller specific code goes here
      console.log('MainCtrl has been created');
    }]);
&lt;/script&gt;
&lt;/body&gt;
&lt;/html&gt;
</code></pre>
<p>在 <code>body</code> 节点上使用 <code>ng-controller</code> 指示器实例化 <code>MainCtrl</code> 控制器附加到该节点上，其中 <code>as ctrl</code> 表示给控制器实例起一个别名，可选的。
其中控制器的创建也可以有比较简洁的方式：</p>
<pre><code class="language-js">angular.module('notesApp', [])
    .controller('MainCtrl', function() {
      var self = this;
      self.message= 'Hello ';
      self.changeMessage = function() {
        self.message = 'Goodbye';
      };
    });
</code></pre>
<p>控制属性的可见性，对于使用 <code>this.</code> 进行绑定的属性可以在作为数据模型在视图中展现，而仅在控制器内声明的局部变量外部无法引用。然而在例子中，我们使用 <code>self</code> 对 <code>this</code> 进行代理，避免其他函数对 <code>this</code> 进行修改后影响函数。</p>
<p><code>ng-click</code> 指示器对按钮进行点击事件绑定。</p>
<h2>显示模型的数组数据</h2>
<p>在 AngularJS 中可使用 <code>ng-repeat</code> 指示器进行迭代，在 <code>ng-repeat</code> 指示器下的元素将作为模板，AngularJS 会使用这个模板进行复制和数据填充。</p>
<pre><code class="language-html">&lt;!-- File: chapter2/ng-repeat-example-1.html --&gt;
&lt;html ng-app=&quot;notesApp&quot;&gt;
&lt;head&gt;&lt;title&gt;Notes App&lt;/title&gt;&lt;/head&gt;
&lt;body ng-controller=&quot;MainCtrl as ctrl&quot;&gt;

  &lt;div ng-repeat=&quot;note in ctrl.notes&quot;&gt;
    &lt;span class=&quot;label&quot;&gt; {{note.label}}&lt;/span&gt;
    &lt;span class=&quot;status&quot; ng-bind=&quot;note.done&quot;&gt;&lt;/span&gt;
  &lt;/div&gt;

&lt;script
  src=&quot;https://ajax.googleapis.com/ajax/libs/angularjs/1.3.11/angular.js&quot;&gt;
&lt;/script&gt;
&lt;script type=&quot;text/javascript&quot;&gt;
  angular.module('notesApp', [])
    .controller('MainCtrl', [function() {
      var self = this;
      self.notes = [
        {id: 1, label: 'First Note', done: false},
        {id: 2, label: 'Second Note', done: false},
        {id: 3, label: 'Done Note', done: true}
      ];
    }]);
  &lt;/script&gt;
&lt;/body&gt;
&lt;/html&gt;
</code></pre>
<h3>跨元素迭代</h3>
<p>如果是跨元素进行迭代的话，使用 <code>ng-repeat-start</code> 和 <code>ng-repeat-end</code> 迭代器的组合，如：</p>
<pre><code class="language-html">&lt;table&gt;
    &lt;tr ng-repeat-start=&quot;note in ctrl.notes&quot;&gt;
        &lt;td&gt;{{note.label}}&lt;/td&gt;
    &lt;/tr&gt;
    &lt;tr ng-repeat-end&gt;
        &lt;td&gt;Done: {{note.done}}&lt;/td&gt;
    &lt;/tr&gt;
&lt;/table&gt;
</code></pre>
<h3>迭代辅助变量</h3>
<p><code>$first</code> 这类变量是在 AngularJS 在复制模板时顺带产生的辅助类变量，指明该次迭代的状态。</p>
<pre><code class="language-html">&lt;div ng-repeat=&quot;note in ctrl.notes&quot;&gt;
    &lt;div&gt;First Element: {{$first}}&lt;/div&gt;
    &lt;div&gt;Middle Element: {{$middle}}&lt;/div&gt;
    &lt;div&gt;Last Element: {{$last}}&lt;/div&gt;
    &lt;div&gt;Index of Element: {{$index}}&lt;/div&gt;
    &lt;div&gt;At Even Position: {{$even}}&lt;/div&gt;
    &lt;div&gt;At Odd Position: {{$odd}}&lt;/div&gt;

    &lt;span class=&quot;label&quot;&gt; {{note.label}}&lt;/span&gt;
    &lt;span class=&quot;status&quot; ng-bind=&quot;note.done&quot;&gt;&lt;/span&gt;
    &lt;br/&gt;&lt;br/&gt;
&lt;/div&gt;
</code></pre>
