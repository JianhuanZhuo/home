<%@ page contentType="text/html; charset=UTF-8" %><pre><code class="language-java">// import package
import javafx.collections.ObservableSet;
import javafx.print.Printer;

// get printer list
ObservableSet&lt;Printer&gt; allPrinters = Printer.getAllPrinters();
for(Printer p : allPrinters) {
    System.out.println(p.getName());
}

//get default printer
Printer defaultprinter = Printer.getDefaultPrinter();
if (defaultprinter != null) {
    String name = defaultprinter.getName();
    System.out.println(&quot;Default printer name: &quot; + name);
} else {
    System.out.println(&quot;No printers installed.&quot;);
}
</code></pre>
<p>create a print job to print</p>
<pre><code class="language-java">// create a print job for default printer
public static PrinterJob PrinterJob.createPrinterJob()

// create a print job for specified printer
public static PrinterJob PrinterJob.reatePrinterJob(Printer printer)
</code></pre>
<h2>usage</h2>
<p>handle error by check return value of printPage</p>
<pre><code class="language-java">boolean printed = printerJob.printPage(node);
if (printed) {
    // End the printer job
    printerJob.endJob();
} else {
    System.out.println(&quot;Printing failed.&quot;);
}
</code></pre>
<p>set printer of printer-job</p>
<pre><code class="language-java">// Set a new printer for the printer job
// set null will use default printer
printerJob.setPrinter(myNewPrinter);
</code></pre>
<p>execute print action</p>
<pre><code class="language-java">boolean printPage(Node node)
boolean printPage(PageLayout pageLayout, Node node)
</code></pre>
<blockquote>
<p>You can call the  printPage() method on a  PrinterJob as many times as you want. Calling the endJob() method tells the job that no more printing will be performed. the method transitions the job status to  DONE and the job should no longer be reused.</p>
</blockquote>
<h2>printer attribute</h2>
<p>You cannot create a PrinterAttributes object directly. You need to get it from a Printer object using the getPrinterAttributes() method.</p>
<pre><code class="language-java">Printer printer = Printer.getDefaultPrinter();
PrinterAttributes attribs = printer.getPrinterAttributes();
// Read some printer attributes
int maxCopies = attribs.getMaxCopies();
PrintSides printSides = attribs.getDefaultPrintSides();
Set&lt;PageOrientation&gt; orientations = attribs.getSupportedPageOrientations();
Set&lt;Collation&gt; collations = attribs.getSupportedCollations();
// Print the printer attributes
System.out.println(&quot;Max. Copies: &quot; + maxCopies);
System.out.println(&quot;Print Sides: &quot; + printSides);
System.out.println(&quot;Supported Orientation: &quot; + orientations);
System.out.println(&quot;Supported Collations: &quot; + collations);
</code></pre>
<p>output of codes above is:</p>
<pre><code>Max. Copies: 999
Print Sides: ONE_SIDED
Supported Orientation: [PORTRAIT, LANDSCAPE, REVERSE_LANDSCAPE]
Supported Collations: [UNCOLLATED, COLLATED]
</code></pre>
<p>set print job</p>
<pre><code class="language-java">// Create a printer job for the default printer
PrinterJob job = PrinterJob.createPrinterJob();
// Get the JobSettings for the print job
JobSettings jobSettings = job.getJobSettings();
System.out.println(jobSettings.getPrintSides());
// Set the printSides to DUPLEX
jobSettings.setPrintSides(PrintSides.DUPLEX);
System.out.println(jobSettings.getPrintSides());
</code></pre>
<p>specify print page range</p>
<pre><code class="language-java">PrinterJob job = PrinterJob.createPrinterJob();
JobSettings jobSettings = job.getJobSettings();
jobSettings.setPageRanges(new PageRange(1, 5), new PageRange(20, 25));
</code></pre>
<p>The method returns true if the user confirms the settings on the dialog. It returns false if the user cancels the dialog. It also returns false if the dialog cannot be displayed, such as when the job is not in the NOT_STARTED state.</p>
