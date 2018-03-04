<%@ page contentType="text/html; charset=UTF-8" %><h3>参考网站</h3>
<ol>
<li>Java的爸爸，Oracle官方网站：<a href="http://www.oracle.com/technetwork/java/javase/tech/index-jsp-138252.html">http://www.oracle.com/technetwork/java/javase/tech/index-jsp-138252.html</a></li>
<li>Java3D的官方网站：<a href="http://www.java3d.org/index.html">http://www.java3d.org/index.html</a></li>
</ol>
<h3>install</h3>
<p>选择安装目录：
<img src="${pageContext.request.contextPath}/\img\Java3D1.png" alt="安装" /></p>
<h3>config</h3>
<ol>
<li>将安装目录中的lib/ext文件夹内的文件都复制到jre的lib/ext文件夹下
<img src="${pageContext.request.contextPath}/\img\Java3D2.png" alt="" /></li>
<li>将安装目录中的bin文件夹内的文件都复制到jre的bin文件夹下
<img src="${pageContext.request.contextPath}/\img\Java3D3.png" alt="" /></li>
</ol>
<h3>test</h3>
<pre><code class="language-java">import com.sun.j3d.utils.universe.SimpleUniverse;
import com.sun.j3d.utils.geometry.ColorCube;
import javax.media.j3d.BranchGroup;
public class Hello3d {
    public static void main( String[] args ) {
        new Hello3d();
    }
public Hello3d(){
           SimpleUniverse universe = new SimpleUniverse();
           BranchGroup group = new BranchGroup();
           group.addChild(new ColorCube(0.3));
           universe.getViewingPlatform().setNominalViewingTransform();
           universe.addBranchGraph(group);
        }
} // end of class Hello3d
</code></pre>
<p>该代码将输出一个3D的红色方块，测试成功。
<img src="${pageContext.request.contextPath}/\img\Java3D4.png" alt="运行成功" /></p>
