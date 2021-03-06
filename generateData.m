function [tileData, tileAve] = generateData(tileData, tileAve, dataSize)

    [~, numberOfTiles, ~] = size(tileAve);
    
    for y = 1:numberOfTiles
            
            [~, numberOfTiles, ~] = size(tileAve);
            dist = zeros(1,numberOfTiles);	% Initialize distance vector
            
            while numberOfTiles > dataSize
               
                for k = 1:numberOfTiles
                    % Compute the euclidean distance
                    dist = dist + sqrt(  (tileAve(:, y, 1) - tileAve(:, k, 1)).^2 + ...
                                         (tileAve(:, y, 2) - tileAve(:, k, 2)).^2 + ...
                                         (tileAve(:, y, 3) - tileAve(:, k, 3)).^2  );
                end  
                
                % Remove the first value 
                [minDist, match] = min(dist); 
                if minDist == 0
                    dist(match) = [];  
                end

                % Find the minium distance, minDist = value, match = index of that value
                [~, match] = min(dist); 

                tileData(:,:,:,match) = [];
                tileAve(:,match,:) = [];

                [~, numberOfTiles, ~] = size(tileAve);   
            end
    end
end

