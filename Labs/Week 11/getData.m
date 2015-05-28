function pressureData = getData(id, skip, count)
% getData() reads in a week 11 lab data file
%
% INPUTS: id is one of the letters P v u to select the desired file type
%         skip is the number if images to skip
%         count is the number of images to read into…
% OUTPUT: pressureData is a cell array of images

  pressureData = cell(count, 1);
  if ((id~='P') && (id~='v') && (id~='u'))
    id='u';
    warning('Value does not exist');
  end
  for file = skip:count+skip-1
    fid = fopen(sprintf('data/%s_0%03i.bin', id, file), 'r');
    pressureData{file + 1 - skip} = fread(fid, [202 122],'single')';
    fclose(fid);
  end
end
