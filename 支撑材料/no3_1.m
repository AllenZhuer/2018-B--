%    function max_time=jiema(bianmaA,bianmab)
%   bianmaA=zeros(1,600);%%������ ����
  bianmaB=zeros(1,600);%%������
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
q=1;
for j=1:600
    [m,n]=find(A==A(1,j));%�ҵ����������ͬ�� n��ʾͬһ������ ��ͬ������λ���±�
   if (length(n)==2)
   
    gongxu1_m(1,q)=B(1,n(1,1));%�������� ��Ӧ������˳��
    k=B(1,n(1,1));
    gongxu2_m(1,q)=B(1,n(1,2));
    gongxu1_s(1,q)=shangliaokaishi(1,j);%����1���Ͽ�ʼ
    B(1,n(1,1))=0;%���һ������Ļ���Ϊ0 ��һ�β��ҵ�һ�����Ӧ�����ŵ�ʱ��ֱ���ҵ���һ���øû�����λ��   
    [c,d]=find(B==gongxu1_m(1,q));%�ҵ���һ�����ϵĵ�һ������Ķ�Ӧ������
       if length(d)>=2
       gongxu1_x(1,q)=shangliaokaishi(1,d(1,1));%��һ���������ϵĿ�ʼʱ�� �ڶ�����������ʱ��Ӧ��Ϊ��ʱ��+�ƶ�ʱ��
      else 
       if length(d)==1
       gongxu1_x(1,q)=shangliaokaishi(1,d);%��һ���������ϵĿ�ʼʱ�� �ڶ�����������ʱ��Ӧ��Ϊ��ʱ��+�ƶ�ʱ��
       end
      end
    
      if length(d)>=2
          gongxu2_s(1,q)=gongxu1_x(1,q)+dt(bianmaB(1,d(1,1)),bianmaB(1,d(1,2)))+shangxialiao(gongxu1_m(1,q));
      else 
          if length(d)==1
          gongxu2_s(1,q)=shangliaokaishi(1,d);
          end
      end 
    %����2������ʱ��͹���1����ʱ����һ��
     B(1,n(1,2))=0;
%       B(1,n(1,1))=0;
     [e,f]=find(B==gongxu2_m(1,q));%�ҵ���һ���øû�����λ��
     if length(f)>=2
         gongxu2_x(1,q)=shangliaokaishi(1,f(1,1));
     else 
         if length(f)==1
         gongxu2_x(1,q)=shangliaokaishi(1,f);
         end
     end
     %��� �����ظ����ֵĹ������ ��ֵΪ0 �´β������ҵ�
     A(1,n(1,1))=0;
     A(1,n(1,2))=0;
    q=q+1;
   end
    
end

  max_time=max(MT);
%    end



