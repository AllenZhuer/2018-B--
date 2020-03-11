function [ distance ] = haiming( op1,op2,mc1,mc2,M )
%UNTITLED2 此处显示有关此函数的摘要
%   此处显示详细说明
%小生境隔离策略
    distance=0;
    for i=1:M
        if op1(i)~=op2(i)
            distance=distance+1;
        end
    end
    for i=1:M
        if mc1(i)~=mc2(i)
            distance=distance+1;
        end
    end
end
