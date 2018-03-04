<%@ page contentType="text/html; charset=UTF-8" %><p>Spring MVC 框架下三种文件下载方法的代码示例。</p>
<!--more-->
<pre><code class="language-java">package com.memorynotfound.controller;

import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import javax.servlet.http.HttpServletResponse;
import java.io.*;

@Controller
@RequestMapping(&quot;/download&quot;)
public class DownloadController {

    private static final String FILE_PATH = &quot;/tmp/example.pdf&quot;;
    private static final String APPLICATION_PDF = &quot;application/pdf&quot;;

    @RequestMapping(value = &quot;/a&quot;, method = RequestMethod.GET, produces = APPLICATION_PDF)
    public @ResponseBody void downloadA(HttpServletResponse response) throws IOException {
        File file = getFile();
        InputStream in = new FileInputStream(file);

        response.setContentType(APPLICATION_PDF);
        response.setHeader(&quot;Content-Disposition&quot;, &quot;attachment; filename=&quot; + file.getName());
        response.setHeader(&quot;Content-Length&quot;, String.valueOf(file.length()));
        FileCopyUtils.copy(in, response.getOutputStream());
    }

    @RequestMapping(value = &quot;/b&quot;, method = RequestMethod.GET, produces = APPLICATION_PDF)
    public @ResponseBody HttpEntity&lt;byte[]&gt; downloadB() throws IOException {
        File file = getFile();
        byte[] document = FileCopyUtils.copyToByteArray(file);

        HttpHeaders header = new HttpHeaders();
        header.setContentType(new MediaType(&quot;application&quot;, &quot;pdf&quot;));
        header.set(&quot;Content-Disposition&quot;, &quot;inline; filename=&quot; + file.getName());
        header.setContentLength(document.length);

        return new HttpEntity&lt;byte[]&gt;(document, header);
    }

    @RequestMapping(value = &quot;/c&quot;, method = RequestMethod.GET, produces = APPLICATION_PDF)
    public @ResponseBody Resource downloadC(HttpServletResponse response) throws FileNotFoundException {
        File file = getFile();
        response.setContentType(APPLICATION_PDF);
        response.setHeader(&quot;Content-Disposition&quot;, &quot;inline; filename=&quot; + file.getName());
        response.setHeader(&quot;Content-Length&quot;, String.valueOf(file.length()));
        return new FileSystemResource(file);
    }

    private File getFile() throws FileNotFoundException {
        File file = new File(FILE_PATH);
        if (!file.exists()){
            throw new FileNotFoundException(&quot;file with path: &quot; + FILE_PATH + &quot; was not found.&quot;);
        }
        return file;
    }

}
</code></pre>
