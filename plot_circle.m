% %%  饼状图
% web数据
% fields = {'工程学', '计算机科学', '仪器与仪表学', '电信', '自动化控制系统', ...
%          '交通运输', '化学', '能源燃料', '商业经济学', '其他'};
% 
% % 对应的记录数
% record_counts_new = [25773, 22396, 7731, 5769, 4803, 1241, 1891, 2693, 2509, 3013, ...
%                  2870, 1711, 3608, 1496, 580, 1474, 1117, 1116, 980, 1278, ...
%scopus数据
fields = {
    '工程学', '计算机科学', '数学', '能源', '物理学与天文学', ...
    '材料科学', '决策科学', '社会科学', '环境科学','其他'};

record_counts_new = [
    14386, 11840, 4018, 2780, 2570, 2031, 1953, 1452, 1288, 1178, ...
    1079, 1048, 690, 582, 525, 300, 283, 207, 189, 142, 77, 68, 58, 35, 21, 8, 5
];
% 
% EV数据
% fields = {
%     '计算机软件、数据处理与应用', '数据处理与图像处理', '计算机应用', '人工智能', '管理学', '制造业', '数据通信、设备与技术', ...
%     '人因工程与人体工程学', '控制系统','其他'};
% 
% record_counts_new = [
%     5660, 4712, 3727, 3168, 2947, 2061, 1969, 1818, 1749, 1542, 1372, 1367, 1304, 1272, 1226, ...
%     1199, 1194, 1069, 1032, 1012, 1005, 937, 922, 903, 861, 853, 805, 802, 800];

record_counts = [record_counts_new(1:9),sum(record_counts_new(9:end))];

% 计算总记录数
total_records = sum(record_counts);

% 转换为百分比并生成标签
percentages = (record_counts / total_records) * 100;
labels = strcat(fields, " (", string(round(percentages, 2)), "%)");

% 找到前三大的比例部分
[~, idx] = maxk(record_counts(1:9), 3); % 找到前三大的索引

% 创建爆炸参数数组（1表示突出显示，0表示不突出）
explode = zeros(size(record_counts));
explode(idx) = 1; % 突出显示最大的三个

% 绘制饼状图
fig = figure(1);
h = pie(record_counts, explode, labels); % 绘制饼图并突出部分


% 调整字体大小
textHandles = findobj(gca, 'Type', 'text'); % 获取所有文本对象
set(textHandles, 'FontSize', 8); % 设置字体大小为 8
title('scopus研究领域记录分布');

% 初始化坐标容器
xStart = []; % 连线起点 x 坐标
yStart = [];
xEnd = [];   % 连线终点 x 坐标
yEnd = [];

% 遍历所有扇形部分，收集坐标数据
for j = 1:3 % 奇数索引是扇形 (patch 对象)
    i = idx(j)*2;
    patchObj = h(i-1); % 获取当前扇形对象
    
    % 获取扇形顶点坐标
    vertices = patchObj.Vertices;
    
    % 计算扇形的中点
    centerX = mean(vertices(:, 1));
    centerY = mean(vertices(:, 2));
    
    % 获取标签的位置
    labelPos = h(i).Position;
    
    % 保存连线的起点和终点
    xStart = [xStart, centerX];
    yStart = [yStart, centerY];
    xEnd = [xEnd, labelPos(1)];
    yEnd = [yEnd, labelPos(2)];
end

% 使用向量一次性绘制所有连线
line([xStart; xEnd], [yStart; yEnd], ...
    'Color', 'k', 'LineStyle', '-', 'LineWidth', 1.2);

% 保存图表到本地文件
outputPath = 'C:\Users\Mjw\Desktop\先进制造技术\scopus\scopus_area_fig.png'; % 替换为实际路径
exportgraphics(fig, outputPath);
disp(['饼状图已保存到：', outputPath]);