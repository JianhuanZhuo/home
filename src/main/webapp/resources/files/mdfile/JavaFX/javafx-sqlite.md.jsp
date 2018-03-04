<%@ page contentType="text/html; charset=UTF-8" %><p>title : 为 JavaFx 应用 SQLite
date  : 2017/5/15</p>
<hr />
<pre><code class="language-bash">Exception in thread &quot;main&quot; java.lang.RuntimeException: java.sql.SQLException: No suitable driver found for jdbc.sqlite:localdb.sqlite
	at cn.keepfight.db.SqliteConnection.connect(SqliteConnection.java:18)
	at cn.keepfight.db.SqliteConnection.main(SqliteConnection.java:23)
Caused by: java.sql.SQLException: No suitable driver found for jdbc.sqlite:localdb.sqlite
	at java.sql.DriverManager.getConnection(DriverManager.java:689)
	at java.sql.DriverManager.getConnection(DriverManager.java:270)
	at cn.keepfight.db.SqliteConnection.connect(SqliteConnection.java:15)
	... 1 more
</code></pre>
