function showImage(pressureData)
% pressureData() displays the images

  figure();
  colormap(jet(300));

  % obtain min and max pixel values
  ni = length(pressureData);
  imax=max( max(pressureData{1}) );
  imin=min( min(pressureData{1}) );
  for cnt = 2:ni
    imax=max(imax,max(max(pressureData{cnt})));
    imin=min(imin,min(min(pressureData{cnt})));
  end
 
  % display all images
  for cnt = 1:ni
    im = image(pressureData{cnt}, 'CDataMapping', 'scaled',...
                                  'XData', [0 50], 'YData', [0 15]);
    axis equal;
    axis([0 50 0 15]);
    set(gca, 'YDir', 'normal');
    caxis([imin imax]);
    colorbar;
    pause(0.01);
  end
