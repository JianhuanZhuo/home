package cn.keepfight.services.mdService.MathBlock;

import com.vladsch.flexmark.ast.Block;
import com.vladsch.flexmark.parser.block.AbstractBlockParser;
import com.vladsch.flexmark.parser.block.BlockContinue;
import com.vladsch.flexmark.parser.block.ParserState;

/**
 * Created by tom on 2018/2/16.
 */
public class MathBlockParser extends AbstractBlockParser {
    @Override
    public Block getBlock() {
        return null;
    }

    @Override
    public BlockContinue tryContinue(ParserState state) {
        return null;
    }

    @Override
    public void closeBlock(ParserState state) {

    }
}
