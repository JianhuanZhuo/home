<%@ page contentType="text/html; charset=UTF-8" %><p>参考 <a href="https://stackoverflow.com/questions/27470307/how-to-create-an-empty-row-in-a-tableview-in-javafx">StackOverFlow</a></p>
<pre><code class="language-java">// 给表格添加一个新的行构造器
 myTable.setRowFactory(new Callback&lt;TableView&lt;TableItem&gt;, TableRow&lt;TableItem&gt;&gt;() {

                @Override
                public TableRow&lt;TableItem&gt; call(TableView&lt;TableItem&gt; param) {
                    TableRow&lt;TableItem&gt; row = new TableRow&lt;TableItem&gt;();
                    row.setOnMouseClicked(new EventHandler&lt;MouseEvent&gt;() {

                            @Override
                            public void handle(MouseEvent event) {
                                if ((event.getClickCount() == 2)) {
                                    //create a new Item and intialize it ...
                                    TableItem myItem = new TableItem();
                                    myTable.getItems().add(myItem);
                                } 
                            }

                        });

                    return row;
                }
            });
</code></pre>
