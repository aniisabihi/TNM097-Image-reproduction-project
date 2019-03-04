%% Skapar en databas av 250 bilder - Detta tar tid!
% Skapar en mat fil av alla bilder (minibilderna blir storlek 25x25 pixlar)
for k=1:250
   %Läser in alla bilder från mappen
   image = imread(sprintf('ImageDatabase/%d.jpg',k));
   %Förstorar eller förminskar bilder till en bestämd storlek
   h(:,:,:,k) = imresize(image, [25 25], 'bicubic');
   %Konverterar från rgb till lab
   lab(:,:,:,k) = rgb2lab(h(:,:,:,k));
end
save ImageData h lab 

%% Mosaic

load ImageData

%%
im = imread('ImageDatabase/1.jpg'); %bilden som ska reproduceras
inImg = imresize(im, [1000 1000]); %1500x1500 pixlar
inImgLab = rgb2lab(inImg);

nBlocks = 3; % Anger antalet subblocks
tileAve = getAverages(lab,nBlocks);

%% Halverar databasen till 100 bilder
[hundra, hunAve] = generateData(h, tileAve, 100);

%% Halverar databasen till 50 bilder
[femtio, femAve] = generateData(h, tileAve, 50); 

%% Resultat
mosaicImg = mosaic(inImg, inImgLab, femtio, femAve); %skapar mosaicbilden 


