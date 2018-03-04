<%@ page contentType="text/html; charset=UTF-8" %><p>在嵌入式开发中，为了兼顾多种主控芯片，而迁就的兼容，需要众多的宏定义作为开关，而这些就如汤姆说的“耍魔术”，在一不留神的情况下就导致预编译时发生错误，而在一般情况下，发生在预编译的逻辑错误是很难发觉的，而必须与宏定义打交道的情况下则需要了解预编译之后生成的结果。</p>
<p>我现在主要使用的IDE还是keil4，这个开发环境使用的编译器是Cx51，也就比较少资料的一个。我在网上找了许久都不知道怎么解决这个问题。
后来在发现，作为Cx51编译器需在控制语句中加入PREPRINT即可。
打开Keil4中的Target Options
在user中加入 C51 ***.c PREPRINT即可，至于加在user选项卡中的那一栏，视需求而定，一般加在Before Build即可。
再进行编，便会运行上方加入的脚本，生成预编译文件。</p>
<h4>2015/01/06</h4>
<p>今天我发现Keil是支持生成预编译文件的，只是之前的英文渣渣，用的又是未汉化的，所以没注意到。打开Keil4中的Target Options，在Listing选项卡中，有一个C preprocessor Listing 的选项。它表示顺带生成***.i文件，也就是预编译文件。而在这个选项卡中有一个Select Folder for Listing的按钮，表示可以为Listing文件指定一个输出文件夹。</p>
<p>在编译器预编译得到预编译文件，打开之后是宏展开与去注释后的文件，第一次看到这东西的人都会觉得很是奇怪，因为基本上每一行的代码之后都是七八行的空行，这是由于在预编译时注释去掉了之后，留下的空行没有删除导致的，可以使用<strong>EditPlus</strong>的替换功能，选择使用正则表达式，将“^\s*\n”替换为&quot;\n&quot;，则会将多余的空行全部剃干净了。</p>
<h4>2015/01/06</h4>
<p>使用正则表达式：^(\s*(#.*)?\n)+ 可以一次性替换所有的空行与注释。</p>