function [acc1, acc2, acc3] = autolab()
    %% Load data

    [data1, labels1, data2, labels2, data3, labels3, data4, labels4, data5, labels5, data1to5, labels1to5] = load_all_data();
    
    %% Gaussian Naive Bayes
    
    startGNB = 'Starting Gaussian Naive Bayes...'
    
    Model = train(data1to5, labels1to5);
    
    answers11 = classify(Model, data1);
    answers12 = classify(Model, data2);
    answers13 = classify(Model, data3);
    answers14 = classify(Model, data4);
    answers15 = classify(Model, data5);
    acc1 = (sum(answers11 == labels1) + sum(answers12 == labels2) + sum(answers13 == labels3) + sum(answers14 == labels4) + sum(answers15 == labels5))/50;
    
    accuracy_GNB = acc1
    
    endGNB = 'Finished Gaussian Naive Bayes.'
    
    %% K-Nearest Neighbors
    
    startknn = 'Starting KNN...'
    
    Model2 = train1(data1to5, labels1to5);
    answers21 = classify1(Model2, data1);
    answers22 = classify1(Model2, data2);
    answers33 = classify1(Model2, data3);
    answers34 = classify1(Model2, data4);
    answers35 = classify1(Model2, data5);
    acc2 = (sum(answers21 == labels1) + sum(answers22 == labels2) + sum(answers33 == labels3) + sum(answers34 == labels4) + sum(answers35 == labels5))/50;
    
    accuracy_knn = acc2
    
    endknn = 'Finished KNN.'
    
    %% K-means clustering
    
    startkmeans = 'Starting K-means...'
    
    Model3 = train2(data1to5, labels1to5);
    
    answers31 = classify2(Model3, data1);
    answers32 = classify2(Model3, data2);
    answers33 = classify2(Model3, data3);
    answers34 = classify2(Model3, data4);
    answers35 = classify2(Model3, data5);
    acc3 = (sum(answers31 == labels1) + sum(answers32 == labels2) + sum(answers33 == labels3) + sum(answers34 == labels4) + sum(answers35 == labels5))/50;
    
    accuracy_Kmeans = acc3
    
    endkmeans = 'Finished K-means.'
end