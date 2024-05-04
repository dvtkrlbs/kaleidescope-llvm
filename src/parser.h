/// ExprAST -  Base class for all expression nodes.

class ExprAST {
public:
    virtual ~ExprAST() = default;
};

/// NumberExprAST - Expression class for numeric literals like '1.0
class NumberExprAST : public ExprAST