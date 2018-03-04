<%@ page contentType="text/html; charset=UTF-8" %><h3>关于源代码中缩进是否使用tab问题的见解</h3>
<p>从我一开始接触C语言，到现在在做嵌入式，见过的关于编程语言（本人涉略的一些编程语言，如C，C++，PHP，Java等）的入门介绍或比较系统的书籍，都要求在编写源代码时要有良好的编程规范，或者说良好的编程风格。其中一点反复出现的是代码最好缩进成锯齿，这样可以很好地增强可读性，而在一条规范的旁边常常带有缩进最好使用空格的字眼，这一无存在感的词条却引起了我不少的兴趣。
回想之前阅读过所谓的“华为编程规范”“谷歌编程规范”等资料中，里面也有类似这样的字眼。但就我看来，让程序员用一个tab按键就能搞定的事，花四倍的时间按四次空格是十分无理的，特别是在代码中为了缩成锯齿状的风格，tab缩进可能在每一行都会用得到。</p>
<p>“缩进最好使用空格”这一“规范”存在的原因在这些权威书籍中给出的理由是：</p>
<blockquote>
<p>别人在使用你的代码的时候可能与你设置的tab数不同，导致代码错位，难以阅读。</p>
</blockquote>
<p>这也就是说，这一规范的存在仅仅是因为“兼容”“阅读器”的错误设置？
据我使用过的编译器基本上都是支持自定义tab制表符所占用的空格数，如微软SDK系列的产品，基于eclipse的各系列IDE等。再说，如果一个代码编辑器连自定义tab占用空格数都做不到那也该被淘汰了吧？
而如果为了仅仅只是兼容其他“阅读器”的阅读效果，那么在现在主流的编辑器中都支持一个Insert spaces的选项（一般在自定义tab制表符所占用的空格数选项的旁边），这个选项一般表示编辑器可以在保存代码时将tab制表符所占用的空间转换为空格。
当然我以上列举的都是我平时学习工作中使用或接触的，我在广工第一次学C程序设计语言时，老师教学推荐使用的IDE是一种特别神奇而古老的编译器，名字叫TurboC。这种编译器已是上个世纪的古董，仅在教学中使用，目的是无法使用提示功能，学生在打码上有些手感。那种东西在工作时使用，那简直就是“回到解放前”了。</p>
