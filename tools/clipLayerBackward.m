function dX =  clipLayerBackward(~, dZ, X, ceiling)

dX = dZ;

dX(X<-ceiling | X>ceiling) = 0;

end