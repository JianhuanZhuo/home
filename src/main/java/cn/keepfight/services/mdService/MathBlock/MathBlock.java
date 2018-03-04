package cn.keepfight.services.mdService.MathBlock;

import com.vladsch.flexmark.ast.BlockContent;
import com.vladsch.flexmark.ast.CustomBlock;
import com.vladsch.flexmark.ast.HtmlBlockBase;
import com.vladsch.flexmark.util.sequence.BasedSequence;

import java.util.List;

/**
 * Created by tom on 2018/2/16.
 */
public class MathBlock extends CustomBlock {

    public MathBlock(BasedSequence chars) {
        super(chars);
    }

    public MathBlock(BasedSequence chars, List<BasedSequence> lineSegments) {
        super(chars, lineSegments);
    }

    public MathBlock(BlockContent blockContent) {
        super(blockContent);
    }

    public MathBlock(List<BasedSequence> lineSegments) {
        super(lineSegments);
    }
    @Override
    public BasedSequence[] getSegments() {
        return new BasedSequence[0];
    }
}
