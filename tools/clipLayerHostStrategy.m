classdef clipLayerHostStrategy < nnet.internal.cnn.layer.util.ExecutionStrategy

    methods
        function [Z, memory] = forward(~, X, ceiling)
            Z = clipLayerForward(X, ceiling);
            memory = [];
        end

        function [dX,dW] = backward(~, Z, dZ, X, ceiling)
            dX = clipLayerBackward(Z, dZ, X, ceiling);
            dW = [];
        end

    end
end
