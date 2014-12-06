function err = svmwrapper(xTrain, yTrain)
  model = svmtrain(yTrain, xTrain,'-c 1 -g 0.07 -b 1 -t 3');
  err = sum(svmpredict(yTrain, xTrain, model) ~= yTrain);
end


