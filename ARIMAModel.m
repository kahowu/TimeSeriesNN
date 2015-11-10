len = 20;
test_size = 5;
train_size = len - test_size;
train = input(1:train_size);
test = input ((train_size + 1):len);
window_size = test_size; 
 
googleModel = arima(2,1,2);
googleFit = estimate(googleModel, train);
[Y,YMSE] = forecast(googleFit, test_size,'Y0', train);
x1 = linspace (1, window_size, window_size);
x2 = linspace (window_size + 1, window_size  + test_size, test_size);
p1 = train(train_size - window_size + 1:train_size);
p2 = test;

plot(x1,p1,x2,p2, x2,Y);


% lower = Y - 1.96*sqrt(YMSE);
% upper = Y + 1.96*sqrt(YMSE);
% 
% figure
% % hold on
% % h1 = plot(2820:2829,lower,'r:','LineWidth',2);
% % h2 = plot(2820:2829,upper,'r:','LineWidth',2);
% % plot(Y,'k','LineWidth',2);
% % legend([h1 h2],'95% Interval','Forecast',...
% % 	     'Location','NorthWest')
% title('Google Forecast')
% hold off