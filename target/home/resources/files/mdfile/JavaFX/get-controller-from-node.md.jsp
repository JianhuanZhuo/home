<%@ page contentType="text/html; charset=UTF-8" %><p>参考<a href="https://stackoverflow.com/questions/40754454/get-controller-instance-from-node">Get Controller instance from Node</a>
控制器是 JavaFX 中使用 FXML 方式构造节点才存在的，所以对于普通的节点 Node 是不存在 <code>getController()</code> 这种方法的。</p>
<p>但是我们可以通过将控制器绑定到 Node 节点中的属性。</p>
<pre><code class="language-java">
@Override
public void initialize(URL location, ResourceBundle resources) {
    // 使用属性绑定控制器
    root.getProperties().put(OBJECT_PROPERTY_KEY, this);
}


// 获取控制器
ShopItemController controller = (ShopItemController) graphic.getProperties().get(ShopItemController.OBJECT_PROPERTY_KEY);
</code></pre>
