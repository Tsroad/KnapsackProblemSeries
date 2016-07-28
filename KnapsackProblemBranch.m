% @file "KnapsackProblemBranch.m"
% @authors Keung Charteris & T.s.road CZQ
% @version 1.0 ($Revision$)
% @date 27/7/2016 $LastChangedDate$
% @addr. GUET, Gui Lin, 540001,  P.R.China
% @contact : cztsiang@gmail.com &  t.s.road@bk.ru
% @date Copyright(c)  2016-2020,  All rights reserved.
% This is an open access code distributed under the Creative Commons Attribution License, which permits 
% unrestricted use, distribution, and reproduction in any medium, provided the original work is properly cited. 

%  问题描述：
%  20个数，分成两组，要求两组数的和的差值最小。
%  问题分析
%  1. 判断第一个数放或不放；
%  2. 判断下一个数是放还是不放；M[i,c]=M[i-1,c] or M[i,c]= M[i-1,c-w(i)]+v(i)；
%  3. 重复2；
%  4. 找出这些数。

clc;  %清除所有
clear all;%清除变量
close all;%关闭图片

FirstGroup=[]; 
SecondGroup=[];
BagNumberPoints=[38,82,54,36,94,88,56,63,59,21,31,48,24,85,20,23,18,23,44,32];

Capacity=ceil(sum(BagNumberPoints)/2)+1;% 背包的容量
Weight=BagNumberPoints;% 数字的重量
Value=BagNumberPoints;% 数字对应的价钱。
NumberOfObject =length(Weight);% 数字的个数
TransferMatrix=[];%定义状态转移矩阵
ObjectState=[];%背包里数字的状态

%1.判断第一个数字放或不放；
for FlagTemp=1:Capacity
        if Weight(NumberOfObject)<FlagTemp
                TransferMatrix(NumberOfObject,FlagTemp)=Value(NumberOfObject) ;
        else
                TransferMatrix(NumberOfObject,FlagTemp)=0;
        end
end

% %2.判断下一个数字是放还是不放；不放时：F[i,v]=F[i-1,v]；放时：F[i,v]= F[i-1,v-C_i]+w_i；
% %3.重复2.
for FlagTempExternal=NumberOfObject-1:-1:1
        for FlagTemp=1:Capacity
                if FlagTemp<=Weight(FlagTempExternal)
                        TransferMatrix(FlagTempExternal,FlagTemp)=TransferMatrix(FlagTempExternal+1,FlagTemp);
                else
                        if TransferMatrix(FlagTempExternal+1,FlagTemp)>TransferMatrix(FlagTempExternal+1,FlagTemp-Weight(FlagTempExternal))+Value(FlagTempExternal)
                                TransferMatrix(FlagTempExternal,FlagTemp)=TransferMatrix(FlagTempExternal+1,FlagTemp);
                        else
                                TransferMatrix(FlagTempExternal,FlagTemp)=TransferMatrix(FlagTempExternal+1,FlagTemp-Weight(FlagTempExternal))+Value(FlagTempExternal);
                        end
                end
        end
end
% TransferMatrix

%4.找出这些数字。
FlagTempExternal=Capacity;
for FlagTemp=1:NumberOfObject-1
        if TransferMatrix(FlagTemp,FlagTempExternal)==TransferMatrix(FlagTemp+1,FlagTempExternal)
                ObjectState(FlagTemp)=0;
        else
                ObjectState(FlagTemp)=1;
                FlagTempExternal=FlagTempExternal-Weight(FlagTemp);
        end
end
if TransferMatrix(NumberOfObject,FlagTempExternal)==0
        ObjectState(NumberOfObject)=0;
else
        ObjectState(NumberOfObject)=1;
        
end

for FlagTemp=1:NumberOfObject
        
        if ObjectState(FlagTemp)==1
                FirstGroup=[FirstGroup,BagNumberPoints(FlagTemp)];
        else
                SecondGroup=[SecondGroup,BagNumberPoints(FlagTemp)];
        end
end

disp('两组数的和分别为：');
[sum(FirstGroup);sum(SecondGroup)]

disp('第一组为');
FirstGroup
disp('第二组为');
SecondGroup
