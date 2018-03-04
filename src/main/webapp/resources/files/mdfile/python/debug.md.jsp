<%@ page contentType="text/html; charset=UTF-8" %><p>在安装 <code>numpy</code> 扩展时出现了 ascii 码错误</p>
<pre><code class="language-bash">C:\Users\卓建欢&gt;pip install numpy
Collecting numpy
Exception:
Traceback (most recent call last):
  File &quot;c:\python27\lib\site-packages\pip\basecommand.py&quot;, line 215, in main
    status = self.run(options, args)
  File &quot;c:\python27\lib\site-packages\pip\commands\install.py&quot;, line 324, in run
    requirement_set.prepare_files(finder)
  File &quot;c:\python27\lib\site-packages\pip\req\req_set.py&quot;, line 380, in prepare_files
    ignore_dependencies=self.ignore_dependencies))
  File &quot;c:\python27\lib\site-packages\pip\req\req_set.py&quot;, line 620, in _prepare_file
    session=self.session, hashes=hashes)
  File &quot;c:\python27\lib\site-packages\pip\download.py&quot;, line 821, in unpack_url
    hashes=hashes
  File &quot;c:\python27\lib\site-packages\pip\download.py&quot;, line 659, in unpack_http_url
    hashes)
  File &quot;c:\python27\lib\site-packages\pip\download.py&quot;, line 880, in _download_http_url
    file_path = os.path.join(temp_dir, filename)
  File &quot;c:\python27\lib\ntpath.py&quot;, line 85, in join
    result_path = result_path + p_path
UnicodeDecodeError: 'ascii' codec can't decode byte 0xd7 in position 7: ordinal not in range(128)

</code></pre>
<p>原因和网上的一个贴陈述的类似，是我的用户命令文件夹名是中文名的，所以报了 ascii 解析错误。</p>
<p><a href="https://www.v2ex.com/t/90659">请教一个pip install 出现报asciii码错误的问题。</a></p>
<blockquote>
<p>原因是pip安装python包会加载我的用户目录，我的用户目录恰好是中文的，ascii不能编码。解决办法是：</p>
</blockquote>
<blockquote>
<p>python目录
Python27\Lib\site-packages 建一个文件sitecustomize.py
内容写：</p>
<pre><code>import sys 
sys.setdefaultencoding('gb2312')
</code></pre>
</blockquote>
<p>python会自动运行这个文件。</p>
