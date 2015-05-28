function getData(fileName, geom, skip, count)
figure();
colormap(hot(300));
ni = 101;
pressureData = cell(ni, 1);


for file = 0:(ni - 1)
    fid = fopen(sprintf('data/u_0%03i.bin', file), 'r');

    pressureData{file + 1} = fread(fid, [202 122], 'single')';

    fclose(fid);
end

for file = 0:(ni - 1) 
    im = image(pressureData{file + 1});
    axis([0 50 0 15]);
    im.CDataMapping = 'scaled';
    im.XData = [1 50];
    im.YData = [1 15];
    
    pause(0.01);
end