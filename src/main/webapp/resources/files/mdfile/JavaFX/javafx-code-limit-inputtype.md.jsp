<%@ page contentType="text/html; charset=UTF-8" %><h2>输入框限制输入类型和输入长度</h2>
<pre><code class="language-java">    public static void limitLength(TextInputControl textInputControl, int limit) {
        textInputControl.lengthProperty().addListener((observable, oldValue, newValue) -&gt; {
            if (newValue.intValue() &gt; oldValue.intValue()) {
                // Check if the new character is greater than LIMIT
                if (textInputControl.getText().length() &gt;= limit) {
                    // if it's 11th character then just setText to previous one
                    textInputControl.setText(textInputControl.getText().substring(0, limit));
                }
            }
        });
    }

    public static void limitPattern(TextInputControl textInputControl, String pattern) {
        textInputControl.focusedProperty().addListener((arg0, oldValue, newValue) -&gt; {
            if (!newValue) { //when focus lost
                if (!textInputControl.getText().matches(pattern)) {
                    //when it not matches the pattern (1.0 - 6.0) set the textField empty
                    textInputControl.setText(&quot;&quot;);
                }
            }
        });
    }

    /**
     *
     * 纯数字限制
     * @param textInputControl
     * @param inte 最大整数限制
     * @param deci 最大小数限制
     * @param allowNega 是否允许负数输入
     */
    public static void limitNum(TextInputControl textInputControl, int inte, int deci, boolean allowNega){
        if (inte &lt;1){
            return;
        }
        String pattern = &quot;\\d{0,&quot;+inte+&quot;}&quot;;
        if (allowNega){
            pattern = &quot;-?&quot;+pattern;
        }
        if (deci&gt;0){
            pattern += &quot;(\\.\\d{0,&quot;+deci+&quot;})?&quot;;
        }
        limitPattern(textInputControl, pattern);
    }
</code></pre>
