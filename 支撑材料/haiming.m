function [ distance ] = haiming( op1,op2,mc1,mc2,M )
%UNTITLED2 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
%С�����������
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
