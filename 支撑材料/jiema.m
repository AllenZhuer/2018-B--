   function max_time=jiema(bianmaA,bianmab)
%  bianmaA=zeros(1,500);%%工件号 工序
   bianmaB=zeros(1,600);%%机器号
%  bianmaA=A(1,:);
%  bianmaB=B(1,:);
%  bianmaA=best_op;
%  bianmaB=best_mc;
%  
gongxu1=400;
gongxu2=378;
 for i=1:300
%     OP=find(op);
%     k=OP(1,1);
    [~,pair]=find(bianmaA==i);
    
    bianmaB(1,pair(1,1))=bianmab(1,2*i-1);
    bianmaB(1,pair(1,2))=bianmab(1,2*i);    
    
 end
 shangliaokaishi=zeros(1,600);
B=zeros(1,600);
A=zeros(1,600);
MT=zeros(1,8);
% bianmaB(1,1)=1;
% bianmaB(1,2)=2;
% bianmaB(1,3)=2;

qinxi=30;
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


  max_time=max(MT);
   end



