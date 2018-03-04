<%@ page contentType="text/html; charset=UTF-8" %><p><img src="${pageContext.request.contextPath}/resources\files\mdfile\web\img\2017-08-10-14-08-52.png" alt="Method syntax: load" />
<img src="${pageContext.request.contextPath}/resources\files\mdfile\web\img\2017-08-10-14-31-54.png" alt="Method syntax: serialize" />
<img src="${pageContext.request.contextPath}/resources\files\mdfile\web\img\2017-08-10-14-33-27.png" alt="Method syntax: serializeArray" /></p>
<blockquote>
<p>ensuring that the query string is properly formatted and that the names and values of the request parameters are  URI-encoded. The JavaScript  encodeURIComponent() method is handy for this, or you can employ the services of the jQuery  $.param() utility function</p>
</blockquote>
<blockquote>
<p>collect information only from the form control elements in the set of matched elements and only from those qualifying elements that are deemed <strong>successful</strong></p>
</blockquote>
<pre><code class="language-js">var updates = 1;
function pollInfo() {
    $('#container').load(
        '/check-updates',
        function(responseText, textStatus, jqXHR) {
            if (textStatus === 'success') {
                $('#status-update').text('Data updated. Update #' + updates);
                updates++;
            }
            setTimeout(pollInfo, 1000);
        }
    );
}
pollInfo();
</code></pre>
<h2>$.get</h2>
<p><img src="${pageContext.request.contextPath}/resources\files\mdfile\web\img\2017-08-10-14-39-15.png" alt="Function syntax: $.get" />
<img src="${pageContext.request.contextPath}/resources\files\mdfile\web\img\2017-08-10-15-08-19.png" alt="Function syntax: $.getJSON" />
<img src="${pageContext.request.contextPath}/resources\files\mdfile\web\img\2017-08-10-15-09-16.png" alt="Function syntax: $.getScript" />
<img src="${pageContext.request.contextPath}/resources\files\mdfile\web\img\2017-08-10-15-18-17.png" alt="Function syntax: $.post" /></p>
<pre><code class="language-js">// $.get 方法实例
$('#boot-chooser-control')
    .change(function(event) {
        $.get(
            'actions/fetch-product-details.php',
            {
                model: $(event.target).val()
            },
            function(response) {
                $('#product-detail-pane').html(response);
                $('[value=&quot;&quot;]', event.target).remove();
            }
        );
    });
</code></pre>
