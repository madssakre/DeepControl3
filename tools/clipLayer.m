classdef clipLayer < nnet.layer.Layer  & nnet.layer.Formattable %(Optional)

    properties


        LearnableParameters = nnet.internal.cnn.layer.learnable.PredictionLearnableParameter.empty();

        Ceiling


    end

    properties (Constant)

        DefaultName = 'clipLayer'
    end


    properties(Access = private)
        ExecutionStrategy
    end



    properties (SetAccess = protected)

        IsInFunctionalMode = false
    end

    properties(SetAccess=protected, GetAccess=?nnet.internal.cnn.dlnetwork)

        LearnablesNames
    end


    methods
        function this= clipLayer(ceiling,name)


            this.Name = char(name);
            this.Ceiling = ceiling;

            this.ExecutionStrategy = clipLayerHostStrategy();

        end

        function Z = predict( this, X )

            Z = this.ExecutionStrategy.forward(X, this.Ceiling);

        end




    end
end