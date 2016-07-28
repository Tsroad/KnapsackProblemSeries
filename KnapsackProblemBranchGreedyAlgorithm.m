%  问题描述：
%  20个数，分成两组，要求两组数的和的差值最小。

% 问题分析
% 1.  对这组数进行排序；
% 2.  OrderMax1放第一组，OrderMax2放第二组；
% 3.  依次取数，放在和最小的一组；
% 4.  重复3.

clc;  %清除所有
clear all;%清除变量
close all;%关闭图片

FirstGroup=[];
SecondGroup=[];

BagNumberPoints=[38,82,54,36,94,88,56,63,59,21,31,48,24,85,20,23,18,23,44,32];

% 1.  对这组数进行排序；
BagNumberPointsOrder= fliplr(sort(BagNumberPoints));

% 2.  OrderMax1放第一组，OrderMax2放第二组；
FirstGroup=BagNumberPointsOrder(1);
SecondGroup=BagNumberPointsOrder(2);

% 3.  依次取数，放在和最小的一组；
for FlagTemp=3:length(BagNumberPointsOrder)%FlagTemp为临时标志
        if(sum(FirstGroup)>sum(SecondGroup))
            SecondGroup=[SecondGroup,BagNumberPointsOrder(FlagTemp)];
        else
            FirstGroup=[FirstGroup,BagNumberPointsOrder(FlagTemp)];
        end
end

disp('两组数的和分别为：');
[sum(FirstGroup);sum(SecondGroup)]

disp('第一组为');
FirstGroup
disp('第二组为');
SecondGroup
FirstGroup
