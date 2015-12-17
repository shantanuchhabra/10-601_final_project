function [data1, labels1, data2, labels2, data3, labels3, data4, labels4, data5, labels5, data1to5, labels1to5] = load_all_data()
  load '../subset_CIFAR10/small_data_batch_1.mat';
  data1 = data;
  labels1 = labels;
  load '../subset_CIFAR10/small_data_batch_2.mat';
  data2 = data;
  labels2 = labels;
  load '../subset_CIFAR10/small_data_batch_3.mat';
  data3 = data;
  labels3 = labels;
  load '../subset_CIFAR10/small_data_batch_4.mat';
  data4 = data;
  labels4 = labels;
  load '../subset_CIFAR10/small_data_batch_5.mat';
  data5 = data;
  labels5 = labels;
  data1to5 = [data1; data2; data3; data4; data5];
  labels1to5 = [labels1; labels2; labels3; labels4; labels5];
  run('/Users/shantanuchhabra/Desktop/ML Project/mlproject/vlfeat-0.9.20/toolbox/vl_setup');
end