function [centroids, labels,iterations] = unlabelled_clustering(dat, num_classes)
    max_iterations=100;
    
    dat = dat(1:2,:);

    scatter(dat(1,:),dat(2,:))
    hold on
    
    prototypes = [];

    %initialize prototypes
    for i=1:num_classes
        prototypes = [prototypes; dat(1:2,randi(length(dat)))'];
    end
    
    scatter(prototypes(:,1),prototypes(:,2),40,'x');
    hold on
    pause(0.5);
    
    distances = [];
    labels = [];
    
    %measure Euclidean distance between prototypes and each data point
    for i=1:length(dat)
        for j=1:num_classes
            distances(j,i) = sqrt( (dat(1,i)-prototypes(j,1)).^2 + (dat(2,i)-prototypes(j,2)).^2 );
        end
        
    end
   
    [Y, labels] = min(distances);
    dat(3,:) = labels;
    
    
    for iterations=1:max_iterations
    
        centroids=[];

        for i=1:num_classes    
            centroids = [centroids; mean(dat(1:2,dat(3,:)==i)')];
        end

        % measure Euclidean distance between centroids and each data point
        for i=1:length(dat)
            for j=1:num_classes
                distances(j,i) = sqrt( (dat(1,i)-centroids(j,1)).^2 + (dat(2,i)-centroids(j,2)).^2 );
            end
        end

        [Y, labels] = min(distances);
        dat(3,:) = labels;

        new_centroids = [];

        for i=1:num_classes
            new_centroids = [new_centroids; mean(dat(1:2,dat(3,:)==i)')];
        end
        
        disp(abs(sum(sum(new_centroids - centroids))));
        
        scatter(new_centroids(:,1),new_centroids(:,2),40,'x');
        hold on
        pause(0.5);

        %if abs(sum(sum(new_centroids - centroids))) < 0.001
        if new_centroids == centroids;
            break;
        end
    end
    
    disp('Completed k-means clustering in this many iterations');
    disp(iterations)
end