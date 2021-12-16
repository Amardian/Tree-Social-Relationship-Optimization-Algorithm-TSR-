function data = InsertData()

antennaDetails = [
      
510,169,450,123,456,369,789,564,123,111,365,123,457,369,874,512,469,235,369,456,328,975,412,365,123,457,369,874,512,469,235,510,169,450,123,456,369,789,564,123,111,365,123,457,369,874,512,469,235,369,456,328,510,169,450,123,456,369,789,564,123,111,365,123,457,369,874,512,469,235,369,456,328,975,412,365,123,457,369,874,512,469,235,510,169,450,123,456,369,789,564,123,111,365,123,457,369,874,512,469,235,369,456,328,975,412,365,123,891,143,321,234,178,167,245,190,510,169,450,123,456,369,789,564,123,111,365,123,457,369,874,512,469,235,369,456,328,975,412,365,123,457,369,874,512,469,235,510,169,450,123,456,369,789,564,123,111,365,123,457,369,874,512,469,235,369,456,328,975,412,365,123,891,143,321,234,178,167,245,190,248,190,457,369,874,512,469,235,248,190,457,369,874,512,469,235,144,987,124,891,222,901,345,190,164,201,178,245,190,326,148,199,975,412,365,123,891,143,321,234,178,167,245,190,510,169,450,123,456,369,789,564,123,111,365,123,457,369,874,512,469,235,369,456,328,975,412,365,123,457,369,874,512,469,235,510,169,450,123,456,369,789,564,123,111,365,123,457,369,874,512,469,235,369,456,328,975,412,365,123,891,143,321,234,178,167,245,190,248,190,457,369,874,512,469,235,248,190,457,369,874,512,469,235,144,987,124,891,222,901,345,190,164,201,178,245,190,326,148,199


158,6169,6287,178,450,8122,7158,2169,9287,9178,450,1122,191,189,543,178,450,12,191,109,543,178,345,213,900,870,567,891,345,178,900,678,453,201,167,791,178,345,213,900,870,567,891,345,178,900,678,453,201,167,791,178,450,12,191,19,543,178,450,12,191,19,543,178,345,213,900,870,567,891,345,178,900,678,453,201,167,791,178,345,213,900,870,567,891,345,178,900,678,453,201,167,791,178,450,12,191,19,543,178,450,12,191,19,543,178,345,213,900,870,567,891,345,178,900,678,453,201,167,791,178,345,213,900,870,567,891,345,178,900,678,453,201,167,791,178,450,12,191,19,543,178,450,12,191,19,543,178,345,213,900,870,567,891,345,178,900,678,453,201,167,791,178,345,213,900,191,189,1543,1178,450,9912,9191,1109,1543,178,345,213,900,870,567,891,345,178,900,678,453,201,167,791,178,345,213,900,870,567,891,345,178,900,678,453,201,167,791,178,450,12,191,19,543,178,450,12,191,19,543,178,345,213,900,870,567,891,345,178,900,678,453,201,167,791,178,345,213,900,870,567,891,345,178,900,678,453,201,167,3791,3178,450,12,191,19,543,178,2450,12,2191,19,543,178,345,213,900,870,567,891,345,178,900,678,453,201,167,791,178,345,213,900,870,567,891,345,178,900,678,453,201,167,791,178,450,12,191,19,543,178,450,12,191,19,543,178,345,213,900,870,567,891,345,178,900,678,453,201,167,791,178,345,213,900



678,453,6201,9167,1791,5178,450,7212,9191,9919,543,178,450,112,1191,19,543,178,345,213,900,870,567,891,345,178,900,678,453,201,167,791,178,345,313,900,158,169,287,178,450,122,191,189,543,178,450,12,191,109,543,178,345,213,900,870,567,891,345,178,900,678,453,201,167,79,133,450,122,191,189,543,178,450,12,191,109,543,178,345,3213,900,870,3567,2891,2345,178,900,678,453,201,678,453,201,167,791,178,450,12,191,19,543,178,450,12,191,19,543,178,345,213,900,870,567,891,345,178,900,678,453,201,167,791,178,345,313,900,158,169,287,178,450,122,191,189,543,178,450,12,191,109,543,178,345,213,900,870,567,891,345,178,900,678,453,201,167,79,133,450,122,191,189,543,178,450,12,191,109,543,178,345,213,900,870,567,891,345,178,900,678,453,201,167,791,178,345,213,900,235,510,169,450,123,456,369,789,564,123,111,365,123,457,369,874,512,469,235,369,345,178,900,678,453,201,167,791,178,450,12,191,19,543,178,450,12,191,19,543,178,345,213,900,870,567,891,345,178,900,678,453,201,248,190,457,369,874,512,469,235,144,987,167,1791,178,345,1213,7900,235,1510,169,450,123,456,369,789,564,123,111,365,123,457,369,874,512,469,235,369,345,178,900,678,453,201,167,791,178,450,12,191,19,543,178,450,12,191,19,543,178,345,213,900,870,567,891,345,178,900,678,453,201,248,190,457,369,874,512,469,235,144,987




    ];%% anten needs and locations

serverDetails =[
      
      10000,4000,5000,8000,9000,10000,10000,9000,8000,9000,5000,8000,7000,5000,5000,10000,4000
      12,187,265,789,936,456,126,896,788,145,635,789,981,456,378,146,1456
      14,163,359,897,120,1002,456,325,788,456,146,55897,896,359,421,111,1111
    ]; %server power and locations





Nantenna = size(antennaDetails,2);
Nserver = size(serverDetails,2);

ghzantenna = antennaDetails(1,:);
systembar=sum(ghzantenna);
xantenna = antennaDetails(2,:);
yantenna = antennaDetails(3,:);

ghzserver = serverDetails(1,:);
xserver = serverDetails(2,:);
yserver = serverDetails(3,:);
cap = [];
maxneed = max(ghzantenna);
bigserver = find(ghzserver==max(ghzserver));
Allway = 0;

for i = 1:Nserver
   cap(i) =floor(ghzserver(i)/maxneed); 
  
end
for ln=1:Nantenna
   for lnin = 1:Nserver
    Allway = Allway+sqrt(((xantenna(ln)-xserver(lnin))+(yantenna(ln)-yserver(lnin))).^2);       
   end
end
Allway = Allway/Nantenna;
%% ===================================


data.nantenna = Nantenna;
data.nserver = Nserver;
data.nvar = Nantenna;
data.n = Nantenna;
data.nvarserver=Nserver;
data.ghzantenna = ghzantenna;
data.ghzserver = ghzserver;
data.xantenna = xantenna;
data.yantenna = yantenna;
data.xserver = xserver;
data.yserver = yserver;
data.systembar = systembar;
data.maxneed = maxneed;
data.cap = cap;
data.bigserver = bigserver;
data.allway = Allway;

end





