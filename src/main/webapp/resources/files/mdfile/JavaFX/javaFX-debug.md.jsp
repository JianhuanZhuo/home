<%@ page contentType="text/html; charset=UTF-8" %><h2>Location is not set.</h2>
<p>如果真的设置好，可能是未找到设置的文件而已。
注意 FXML 文件是否编译到目标文件夹中</p>
<h2>删除样式类后，节点的样式还在</h2>
<p>主要是因为之前多次添加了样式类 styleClass，然而节点存储样式列表时以 List 列表方式存储，所以。。
参考 <a href="https://stackoverflow.com/questions/23300053/applycss-doesnt-work-when-remove-a-styleclass">applyCss doesn't work when remove a styleClass</a></p>
