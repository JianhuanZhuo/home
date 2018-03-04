<%@ page contentType="text/html; charset=UTF-8" %><p>转自：<a href="http://www.programcreek.com/2014/01/concat-streams-in-java-8/">Concat Streams in Java 8</a></p>
<p>You may often need to concat or merge two streams. In the Stream class, there is a static method <code>concat()</code> that can be used for this purpose.</p>
<!--more-->
<h2>Merge Two Streams</h2>
<pre><code class="language-java">String[] arr1 = { &quot;a&quot;, &quot;b&quot;, &quot;c&quot;, &quot;d&quot; };
String[] arr2 = { &quot;e&quot;, &quot;f&quot;, &quot;g&quot; };
Stream&lt;String&gt; stream1 = Stream.of(arr1);
Stream&lt;String&gt; stream2 = Stream.of(arr2);
 
Stream&lt;String&gt; stream3 = Stream.concat(stream1, stream2);
String[] arr = stream3.toArray(String[]::new);
System.out.println(Arrays.toString(arr));
</code></pre>
<p>Output:</p>
<pre><code class="language-bash">[a, b, c, d, e, f, g]
</code></pre>
<h2>Merge a Filtered Stream to Another</h2>
<p>If you need to filter a stream before concatting to another stream:</p>
<pre><code class="language-python">TString[] arr1 = { &quot;abc&quot;, &quot;bcd&quot;, &quot;cdef&quot;, &quot;defgh&quot; };
String[] arr2 = { &quot;af&quot;, &quot;fg&quot;, &quot;gh&quot; };
Stream&lt;String&gt; stream1 = Stream.of(arr1);
Stream&lt;String&gt; stream2 = Stream.of(arr2);
 
Stream&lt;String&gt; stream3 = Stream.concat(stream1.filter(x -&gt; x.length()&lt;4), stream2);
String[] arr = stream3.toArray(String[]::new);
System.out.println(Arrays.toString(arr));
</code></pre>
<p>Output:</p>
<pre><code class="language-bash">[a, b, c, d, e, f, g, h, i, j]
</code></pre>
<p>Note that elements returned by Stream.concat() method is ordered. For example, the following two lines returns the same result:</p>
<pre><code class="language-java">Stream.concat(Stream.concat(stream1, stream2), stream3);
Stream.concat(stream1, Stream.concat(stream2, stream3));
</code></pre>
<p>But the result for the following two are different.</p>
<pre><code class="language-java">Stream.concat(Stream.concat(stream1, stream2), stream3); //[a, b, c, d, e, f, g, h, i, j]
Stream.concat(Stream.concat(stream2, stream1), stream3); //[e, f, g, a, b, c, d, h, i, j]
</code></pre>
<h2>Use Stream.of(...).flatMap() for Merging</h2>
<p>To make the code more readable, you can also use Stream.of() method to merge more than two streams.</p>
<pre><code class="language-java">String[] arr1 = { &quot;a&quot;, &quot;b&quot;, &quot;c&quot;, &quot;d&quot; };
String[] arr2 = { &quot;e&quot;, &quot;f&quot;, &quot;g&quot; };
String[] arr3 = { &quot;h&quot;, &quot;i&quot;, &quot;j&quot; };
Stream&lt;String&gt; stream1 = Stream.of(arr1);
Stream&lt;String&gt; stream2 = Stream.of(arr2);
Stream&lt;String&gt; stream3 = Stream.of(arr3);
 
//use Stream.of(T... values)
Stream&lt;String&gt; stream = Stream.of(stream1, stream2, stream3).flatMap(x -&gt; x);
 
String[] arr = stream.toArray(String[]::new);
System.out.println(Arrays.toString(arr));
</code></pre>
