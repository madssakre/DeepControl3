function Z = clipLayerForward(X, ceiling)

Z = min(max(-ceiling, X), ceiling);

end