function [indexStop,listeStop] = SearchIndex(listeStop,nameStop)
  indexStop=size(listeStop,2)+1;
  % if nameStop is not found, it will be added at the end of the list
  for i = 1:size(listeStop,2)
    % for each stop already stored in the liste
    if strcmp(listeStop{i},nameStop)
      % if it's the stop searched
      indexStop = i;
      % get it index
      break;
      % stop the seach
    endif
  endfor
  listeStop(indexStop)= nameStop;
  % useful if stop not found, add it in the list
endfunction