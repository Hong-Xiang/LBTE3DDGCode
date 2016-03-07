function A = AssembleA()
global sigma
    A = -MatrixS() + sigma * MatrixM() - MatrixB();
end

