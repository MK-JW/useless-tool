clc
clear
%web的数据
% x = 2024:-1:2010;
% y = [8994, 8592, 6382, 3491, 1960, 1045, 472, 244, ...
%           141, 141, 123, 99, 94, 115, 92];
% EV的数据
% x = 2024:-1:2010;
% 
% % 对应的引用次数
% y = [6750, 6901, 4863, 2972, 1635, 991, 441, 237, 137, 102, 97, 89, 75, ...
%     69, 73];
%scopus的数据
x = 2024:-1:2010;
y = [6112, 6157, 4320, 2794, 1657, 895, 305, 110, 24, 5, ...
           2, 7, 10, 1, 1];
figure(1);
bar(x,y);
% 在每个柱形上显示对应的数值
for i = 1:length(x)
    text(x(i), y(i) + max(y)*0.02, num2str(y(i)), 'HorizontalAlignment', 'center', 'FontSize', 8);
end
xlabel('年份');
ylabel('相关论文记录量');
title('scopus论文年份数据统计');
ylim([0,0.7*10^4])

% 设置横坐标标签的间隔
xticks(2010:2:2024);
path = 'C:\Users\Mjw\Desktop\先进制造技术\scopus\scopus_year_fig.png';
saveas(gcf,path);

