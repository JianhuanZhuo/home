package cn.keepfight.services.mdService.MathBlock;

import com.vladsch.flexmark.ast.BlockContent;
import com.vladsch.flexmark.ast.CustomBlock;
import com.vladsch.flexmark.ast.CustomNode;
import com.vladsch.flexmark.util.sequence.BasedSequence;

import java.util.List;

/**
 * Created by tom on 2018/2/16.
 */
public class MathNode extends CustomNode {

    protected BasedSequence text = BasedSequence.NULL;

    public BasedSequence getText() {
        return text;
    }

    public void setText(BasedSequence text) {
        this.text = text;
    }

    public MathNode() {
    }

    public MathNode(BasedSequence chars) {
        super(chars);
        setText(chars);
    }

    @Override
    public BasedSequence[] getSegments() {
        return new BasedSequence[]{text};
    }
}
