   function max_time=jiema(bianmaA,bianmab)
%  bianmaA=zeros(1,500);%%������ ����
   bianmaB=zeros(1,600);%%������
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
    %rgv�ƶ���ʱ��
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
       MT(1,machine)=tempt;%���Ͽ�ʼʱ�� 
                           %����ǵڶ������� ���Ͽ�ʼʱ��
  
                           
     if n==1
         MT(1,machine)=MT(1,machine)+gongxu1;%�ӹ�ʱ��
     else 
         MT(1,machine)=MT(1,machine)+gongxu2;
         tempt=tempt+qinxi;%����ǵڶ����������� ����Ҫ��ϴ
     end
   

end   


  max_time=max(MT);
   end



