%    function max_time=jiema(bianmaA,bianmab)
%   bianmaA=zeros(1,600);%%工件号 工序
  bianmaB=zeros(1,600);%%机器号
%  bianmaA=A(1,:);
%  bianmaB=B(1,:);
  bianmaA=best_op;
%  bianmaB=best_mc;
%  
 for i=1:300
%     OP=find(op);
%     k=OP(1,1);
    [~,pair]=find(best_op==i);
    
    bianmaB(1,pair(1,1))=best_mc(1,2*i-1);
    bianmaB(1,pair(1,2))=best_mc(1,2*i);    
    
end
 gongxu1_m=zeros(1,300);%
 gongxu1_s=zeros(1,300);%
 gongxu1_x=zeros(1,300);
 gongxu2_m=zeros(1,300);%
 gongxu2_s=zeros(1,300);
 gongxu2_x=zeros(1,300);
 shangliaokaishi=zeros(1,600);
B=zeros(1,100);
A=zeros(1,600);
MT=zeros(1,8);
% bianmaB(1,1)=1;
% bianmaB(1,2)=2;
% bianmaB(1,3)=2;
gongxu1=400;
gongxu2=378;
qinxi=25;
% [m,n]=find(bianmaB==1);
tempt=0;
for k=1:600
    %rgv移动的时间
    if k~=1
       tempt=tempt+dt(bianmaB(1,k),bianmaB(1,k-1));
    end
    machine=bianmaB(1,k); 
    if(tempt<MT(1,machine))
       tempt=MT(1,machine); 
    end
    
       
       A(1,k)=bianmaA(1,k);
       B(1,k)=bianmaB(1,k);
       n=sum(A(:)==bianmaA(1,k));
%        MT(1,machine)=MT(1,machine)+shangxialiao(machine);
       shangliaokaishi(1,k)=tempt;
       tempt=tempt+shangxialiao(machine);
       MT(1,machine)=tempt;%上料开始时间 
                           %如果是第二道工序 上料开始时间
      
                           
     if n==1
         MT(1,machine)=MT(1,machine)+gongxu1;%加工时间
     else 
         MT(1,machine)=MT(1,machine)+gongxu2;
         tempt=tempt+qinxi;%如果是第二道工序下料 还需要清洗
     end
   

end   
q=1;
for j=1:600
    [m,n]=find(A==A(1,j));%找到工件序号相同的 n表示同一个物料 不同机器的位置下标
   if (length(n)==2)
   
    gongxu1_m(1,q)=B(1,n(1,1));%两道工序 对应机器的顺序
    k=B(1,n(1,1));
    gongxu2_m(1,q)=B(1,n(1,2));
    gongxu1_s(1,q)=shangliaokaishi(1,j);%工序1上料开始
    B(1,n(1,1))=0;%令第一道工序的机器为0 下一次查找第一工序对应机器号的时候直接找到下一个用该机器的位置   
    [c,d]=find(B==gongxu1_m(1,q));%找到下一个物料的第一道工序的对应机器号
       if length(d)>=2
       gongxu1_x(1,q)=shangliaokaishi(1,d(1,1));%第一道工序被下料的开始时间 第二道工序上料时间应该为此时间+移动时间
      else 
       if length(d)==1
       gongxu1_x(1,q)=shangliaokaishi(1,d);%第一道工序被下料的开始时间 第二道工序上料时间应该为此时间+移动时间
       end
      end
    
      if length(d)>=2
          gongxu2_s(1,q)=gongxu1_x(1,q)+dt(bianmaB(1,d(1,1)),bianmaB(1,d(1,2)))+shangxialiao(gongxu1_m(1,q));
      else 
          if length(d)==1
          gongxu2_s(1,q)=shangliaokaishi(1,d);
          end
      end 
    %工序2的下料时间和工序1下料时间求法一样
     B(1,n(1,2))=0;
%       B(1,n(1,1))=0;
     [e,f]=find(B==gongxu2_m(1,q));%找到下一个用该机器的位置
     if length(f)>=2
         gongxu2_x(1,q)=shangliaokaishi(1,f(1,1));
     else 
         if length(f)==1
         gongxu2_x(1,q)=shangliaokaishi(1,f);
         end
     end
     %最后 对于重复出现的工件序号 赋值为0 下次不再能找到
     A(1,n(1,1))=0;
     A(1,n(1,2))=0;
    q=q+1;
   end
    
end

  max_time=max(MT);
%    end



