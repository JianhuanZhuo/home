package cn.keepfight.services.mdService.MathBlock;

import com.vladsch.flexmark.ast.Paragraph;
import com.vladsch.flexmark.parser.block.ParagraphPreProcessor;
import com.vladsch.flexmark.parser.block.ParagraphPreProcessorFactory;
import com.vladsch.flexmark.parser.block.ParserState;
import com.vladsch.flexmark.util.sequence.BasedSequence;

import java.util.List;
import java.util.Set;

/**
 * MathJax 块解析器
 * Created by tom on 2018/2/16.
 */
public class MathParagraphPreProcessor implements ParagraphPreProcessor {

    @Override
    public int preProcessBlock(Paragraph block, ParserState state) {
        List<BasedSequence> lines = block.getContentLines();

        if (!lines.get(0).trim().equalsIgnoreCase("$$")){
            return 0;
        }

        int i = 1;
        while (true){
            if (i>=lines.size()){
                return 0;
            }
            if (lines.get(i).trim().equalsIgnoreCase("$$")){
                MathBlock mathBlock = new MathBlock(lines.subList(0, i+1));
                block.insertBefore(mathBlock);
                state.blockAdded(mathBlock);
                return mathBlock.getChars().length();
            }
            i++;
        }
    }


    public static ParagraphPreProcessorFactory Factory() {
        return new ParagraphPreProcessorFactory() {

            @Override
            public Set<? extends Class> getAfterDependents() {
                return null;
            }

            @Override
            public Set<? extends Class> getBeforeDependents() {
                return null;
            }

            @Override
            public boolean affectsGlobalScope() {
                return false;
            }

            @Override
            public ParagraphPreProcessor create(ParserState state) {
                return new MathParagraphPreProcessor();
            }
        };
    }
}
