function [tileData, tileAve] = OptimizeData(tileData, tileAve, original)

    [~, ~, ~,numberOfTiles] = size(tileData);
    
    [height, width, channels] = size(original);
    
    maxValue = sqrt((original(1,1,1).^2 + original(1,1,2).^2 + original(1,1,3).^2));
    minValue = sqrt((original(1,1,1).^2 + original(1,1,2).^2 + original(1,1,3).^2));
    
    for i = 1: height
        for j = 1:width
            tempMax = sqrt((original(i,j,1).^2 + original(i,j,2).^2 + original(i,j,3).^2));
            tempMin = sqrt((original(i,j,1).^2 + original(i,j,2).^2 + original(i,j,3).^2));
           
            if tempMax > maxValue
                maxValue = tempMax;
                indexMaxwidth = j;
                indexMaxHeight = i;
            end
            if tempMin < minValue
                minValue = tempMin;
                indexMinwidth = j;
                indexMinHeight = i;
            end
        end
    end

    dist = zeros(1,numberOfTiles);	% Initialize distance vector


    for k = 1:numberOfTiles
        % Compute the euclidean distance
        dist(k) = max(max(sqrt((tileData(:,:,1,k).^2 + tileData(:,:,2,k).^2 + tileData(:,:,3,k).^2))));

    end  
   

    % Find the minium distance, minDist = value, match = index of that value
    i = 1;
    if dist(i)<maxValue
        tileData(:,:,:,i) = [];
        tileAve(:,i,:) = [];
        numberOfTiles = numberOfTiles - 1;
    end
    if dist(i)>minValue
        tileData(:,:,:,i) = [];
        tileAve(:,i,:) = [];
        numberOfTiles = numberOfTiles - 1;
    end
    

               
end