function [ c1,c2,c3,c4 ] = jiaocha_bianyi( A,B,f1,f2,exchange1,exchange2,exchange3 ,m,M)
%UNTITLED �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
    %��������pox
    %����Ⱦɫ��    
    p1=A(f1,:);%����
    p2=A(f2,:);
    seed1=1:m;
    J=seed1(randperm(numel(seed1)));
    job1=J(1:m/2);
    job2=J(m/2+1:m);%��������ֳ�����
    c1=zeros(1,M);%�Ӵ�
    c2=zeros(1,M);
    %����p1������job1�Ĺ�����c1,����λ��
    for i=1:M
        for j=1:m/2
            if p1(i)==job1(j)
                c1(i)=p1(i);
            end
        end
    end
    %����p2������job2�Ĺ�����c2������λ��
    for i=1:M
        for j=1:m/2
            if p2(i)==job2(j)
                c2(i)=p2(i);
            end
        end
    end

    %����p2������job2�Ĺ�����c1������λ��
    for i=1:M
        for j=1:m/2
            if p2(i)==job2(j)
                for k=1:M
                    if c1(k)==0
                        c1(k)=p2(i);
                        break;
                    end
                end
            end
        end
    end

    %����p1������job1�Ĺ�����c2������˳��
    for i=1:M
        for j=1:m/2
            if p1(i)==job1(j)
                for k=1:M
                    if c2(k)==0
                        c2(k)=p1(i);
                        break;
                    end
                end
            end
        end
    end

    %����Ⱦɫ�� ��㽻��
    p3=B(f1,:);
    p4=B(f2,:);
    c3=p3;
    c4=p4;
    exchange=floor(M*exchange1);%����10%�Ļ���
    for i=1:exchange
        point=randi(M);
        middle=c3(point);
        c3(point)=c4(point);
        c4(point)=middle;
    end

    %����
    %��������
    %����
    for i=1:floor(M*exchange2)%����10%
        point1=randi(M);
        point2=randi(M);
        middle=c1(point1);
        c1(point1)=c1(point2);
        c1(point2)=middle;
        point1=randi(M);
        point2=randi(M);
        middle=c2(point1);
        c2(point1)=c2(point2);
        c2(point2)=middle;
    end


    %����ѡ��
    for i=1:floor(M*exchange3)
        cross1=randi(M);
        cross2=randi(M);
        jishu=[1 3 5 7];
        oushu=[2 4 6 8];
        if c3(cross1)==1||c3(cross1)==3||c3(cross1)==5||c3(cross1)==7
            c3(cross1)=jishu(randi(4));
        else
            c3(cross1)=oushu(randi(4));
        end
        if c4(cross2)==1||c4(cross2)==3||c4(cross2)==5||c4(cross2)==7
            c4(cross2)=jishu(randi(4));
        else
            c4(cross1)=oushu(randi(4));
        end
        
    end
    
    
end

