package cn.keepfight.services.mdService.YamlFrontMatter;

public interface YamlFrontMatterVisitor {
    void visit(final YamlFrontMatterNode node);
    void visit(final YamlFrontMatterBlock node);
}
