%   问题分析
% 1. 判断第一个物品放或不放；
% 2. 判断下一个物品是放还是不放；M[i,c]=M[i-1,c] or M[i,c]= M[i-1,c-w(i)]+v(i)；
% 3. 重复2；
% 4. 找出这些物品。


clc;  %清除所有
clear all;%清除变量
close all;%关闭图片

Capacity=10;% 背包的容量
Weight= [0,2,2,6,5,4];% 物品的重量，其中0号位置不使用 。
Value= [0,6,3,5,4,6];% 物品对应的价钱，0号位置置为空。
NumberOfObject =length(Weight);% n为物品的个数
TransferMatrix=[];%定义状态转移矩阵
ObjectState=[];%背包里物品的状态

%1.判断第一个物品放或不放；
for FlagTemp=1:11
        if Weight(NumberOfObject)<FlagTemp
                TransferMatrix(NumberOfObject,FlagTemp)=Value(NumberOfObject) ;
        else
                TransferMatrix(NumberOfObject,FlagTemp)=0;
        end
end

%2.判断下一个物品是放还是不放；不放时：F[i,v]=F[i-1,v]；放时：F[i,v]=max{F[i-1,v],F[i-1,v-C_i]+w_i}；
%3.重复2.
for FlagTempExternal=NumberOfObject-1:-1:1
        for FlagTemp=1:11
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
TransferMatrix

%4.找出这些物品。

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

ObjectState
