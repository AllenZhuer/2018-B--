function [ c1,c2,c3,c4 ] = jiaocha_bianyi( A,B,f1,f2,exchange1,exchange2,exchange3 ,m,M)
%UNTITLED 此处显示有关此函数的摘要
%   此处显示详细说明
    %交叉算子pox
    %工序染色体    
    p1=A(f1,:);%父代
    p2=A(f2,:);
    seed1=1:m;
    J=seed1(randperm(numel(seed1)));
    job1=J(1:m/2);
    job2=J(m/2+1:m);%工序集随机分成两半
    c1=zeros(1,M);%子代
    c2=zeros(1,M);
    %复制p1包含在job1的工件到c1,保留位置
    for i=1:M
        for j=1:m/2
            if p1(i)==job1(j)
                c1(i)=p1(i);
            end
        end
    end
    %复制p2包含在job2的工件到c2，保留位置
    for i=1:M
        for j=1:m/2
            if p2(i)==job2(j)
                c2(i)=p2(i);
            end
        end
    end

    %复制p2包含在job2的工件到c1，保留位置
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

    %复制p1包含在job1的工件到c2，保留顺序
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

    %机器染色体 多点交叉
    p3=B(f1,:);
    p4=B(f2,:);
    c3=p3;
    c4=p4;
    exchange=floor(M*exchange1);%交换10%的基因
    for i=1:exchange
        point=randi(M);
        middle=c3(point);
        c3(point)=c4(point);
        c4(point)=middle;
    end

    %变异
    %工序排序
    %互换
    for i=1:floor(M*exchange2)%变异10%
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


    %机器选择
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

