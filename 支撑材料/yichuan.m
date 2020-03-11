N=120;%种群规模
m=236;%工件个数
M=m*2;%总工序
machine=8;%八台机器
A=zeros(N,M);%工序顺序
B=zeros(N,M);%机器选择
best_op=zeros(1,M);
best_mc=zeros(1,M);
%初始解
seed=zeros(1,M);

for i=1:m
    seed(2*i-1)=i;
    seed(2*i)=i;
end%1122334455
seeds=zeros(1,M-8);

A(1,:)=seed(1,:);
A(2,1:16)=[1 2 3 4 5 6 7 8 1 2 3 4 5 6 7 8];
A(3,1:16)=[1 2 3 4 1 2 3 4 5 6 7 8 5 6 7 8];
A(4,1:16)=[1 2 3 4 1 2 3 4 5 6 7 8 5 6 7 8];
for i=9:m
    A(2,2*i-1)=i;
    A(2,2*i)=i;
    A(3,2*i-1)=i;
    A(3,2*i)=i;
    A(4,2*i-1)=i;
    A(4,2*i)=i;
end
for i=5:N
    A(i,:)=seed(randperm(numel(seed)));
end
machine1=1;
for i=1:M
    B(1,i)=machine1;
    machine1=machine1+1;
    if machine1==9
       machine1=1; 
    end
end
machine1=1;
for i=1:M
    B(2,i)=machine1;
    machine1=machine1+1;
    if machine1==9
       machine1=1; 
    end
end
for i=1:M/2
    B(3,2*i-1)=5;
    B(3,2*i)=6;
end
for i=1:M/2
    B(4,2*i-1)=7;
    B(4,2*i)=8;
end


for i=5:N
    for j=1:M/2
        jishu=[1 3 5 7];
        B(i,2*j-1)=jishu(randi(4));
        oushu=[2 4 6 8];
        B(i,2*j)=oushu(randi(4));
    end    
end
%jiaocha_bianyi(A,B,3,2,0.1,0.1,0.1,m,M);
%种群初始化结束
outcome=zeros(N,2);
outcome(:,:)=inf;%耗时
distance=zeros(1,N);%海明距离矩阵
best=inf;%最佳时间
for a=1:10000
    for i=1:N
        outcome(i,1)=jiema(A(i,:),B(i,:));%评价染色体适应值
    end
    %找当前种群最优解
    [now_best,now_position]=min(outcome(:,1));
    %与历史最优解比较
    if now_best<best
        best=now_best;
        position=now_position;
        disp(best);
        best_op(1,:)=A(position,:);
        best_mc(1,:)=B(position,:);
    end
    %种群所有点与最优点的海明距离
    op1=A(now_position,:);%精英个体
    mc1=B(now_position,:);
    for j=1:N
        op2=A(j,:);
        mc2=B(j,:);            
        distance(j)=haiming(op1,op2,mc1,mc2,M);        
    end
%     dmax=max(distance);
%     distance(now_postion,1)=inf;
%     dmin=min(distance);
%     distance(now_postion,1)=0;
%     d=(dmax+dmin)/2;
    %划分成两个子种群
%     pop1count,pop2count=0;
%     for k=1:N
%         if distance(k,1)<d
%             pop1_op(pop1count)=A(k,:);
%             pop1_mc(pop1count)=B(k,:);
%             pop1_outcome(pop1count)=outcome(k,1);
%         else
%             pop2_op(pop2count)=A(k,:);
%             pop2_mc(pop2count)=B(k,:);
%             pop2_outcome(pop2count)=outcome(k,1);
%         end        
%     end
   %划分成两个子种群
   %优质种群
   pop1_op=zeros(N/2,M);
   pop1_mc=zeros(N/2,M);
   %次优种群
   pop2_op=zeros(N/2,M);
   pop2_mc=zeros(N/2,M);
   [b,xx]=sort(distance);
   pop1outcome=zeros(N/2);
   pop2outcome=zeros(N/2);
   for i=1:N/2
       pop1_op(i,:)=A(xx(i),:);
       pop1_mc(i,:)=B(xx(i),:);
       pop1outcome(i)=outcome(xx(i),1);
   end
   for i=(N/2+1):N
       pop2_op(i-N/2,:)=A(xx(i),:);
       pop2_mc(i-N/2,:)=B(xx(i),:);
       pop2outcome(i-N/2)=outcome(xx(i),1);
   end
    %pop1
    
    %锦标赛选择产生pop1子代
    pop1_son_op=zeros(N/4,M);
    pop1_son_mc=zeros(N/4,M);
    for i=1:N/4
        x1=randi(N/4);
        x2=randi(N/4);
        if pop1outcome(x1)<pop1outcome(x2)
            if rand<0.8
                pop1_son_op(i,:)=pop1_op(x1,:);
                pop1_son_mc(i,:)=pop1_mc(x1,:);
            else
                pop1_son_op(i,:)=pop1_op(x2,:);
                pop1_son_mc(i,:)=pop1_mc(x2,:);
            end
        else
            if rand<0.8
                pop1_son_op(i,:)=pop1_op(x2,:);
                pop1_son_mc(i,:)=pop1_mc(x2,:);
            else
                pop1_son_op(i,:)=pop1_op(x1,:);
                pop1_son_mc(i,:)=pop1_mc(x1,:);
            end
        end
    end
    %pop2
    
    
    %锦标赛选择产生pop2子代
    pop2_son_op=zeros(N/4,M);
    pop2_son_mc=zeros(N/4,M);
    for i=1:N/4
        x1=randi(N/4);
        x2=randi(N/4);
        if pop2outcome(x1)<pop2outcome(x2)
            if rand<0.8
                pop2_son_op(i,:)=pop2_op(x1,:);
                pop2_son_mc(i,:)=pop2_mc(x1,:);
            else
                pop2_son_op(i,:)=pop2_op(x2,:);
                pop2_son_mc(i,:)=pop2_mc(x2,:);
            end
        else
            if rand<0.8
                pop2_son_op(i,:)=pop2_op(x2,:);
                pop2_son_mc(i,:)=pop2_mc(x2,:);
            else
                pop2_son_op(i,:)=pop2_op(x1,:);
                pop2_son_mc(i,:)=pop2_mc(x1,:);
            end
        end
    end
    
    %交叉，变异
%     AA=zeros(N,M);
%     BB=zeros(N,M);
    for i=1:N/4
        [A(i,:),A(i+N/4,:),B(i,:),B(i+N/4,:)]=jiaocha_bianyi(pop1_son_op,pop1_son_mc,randi(N/4),randi(N/4),0.1,0.1,0.1,m,M);        
    end
    
    for i=N/2+1:N/4*3
        [A(i,:),A(i+N/4,:),B(i,:),B(i+N/4,:)]=jiaocha_bianyi(pop2_son_op,pop2_son_mc,randi(N/4),randi(N/4),0.5,0.5,0.5,m,M); 
    end
    %精英放回种群
    A(N,:)=op1;
    B(N,:)=mc1;
end
disp('end');
%小生境隔离策略










