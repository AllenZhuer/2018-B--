% tempt1=0;
% temppos1=1;
% temppos2=4;
% tempt2=0;
tempt=0;
temppos=1;
MT=zeros(1,4);
jiagong=560;
qinxi=25;
yidong=20;
N=190;
mc=zeros(1,N);
op=zeros(1,N);
sl=zeros(1,N);
xl=zeros(1,N);
for i=1:N
   %%%%% 
    if temppos==1  %�ڵ�һ��λ�� ��1 2��̨���Ƿ����
        if(tempt>=MT(1,1))
            mc(1,i)=1;
            sl(1,i)=tempt;
           tempt=tempt+shangxialiao(1);
           if MT(1,1)~=0
               tempt=tempt+qinxi;
           end
           MT(1,1)=MT(1,1)+shangxialiao(1)+jiagong;
           continue;
        end
        if(tempt>=MT(1,2))
           tempt=tempt+shangxialiao(2);
           if MT(1,2)~=0
               tempt=tempt+qinxi;
           end
           MT(1,2)=MT(1,2)+shangxialiao(2)+jiagong;
            continue;
        end
        if(tempt+yidong>=MT(1,3))
            tempt=tempt+yidong+shangxialiao(3);
            if MT(1,3)~=0
               tempt=tempt+qinxi;
           end
            MT(1,3)=MT(1,3)+shangxialiao(3)+jiagong;
            temppos=2;
            continue;
        end
        if(tempt+yidong>=MT(1,4))
            tempt=tempt+yidong+shangxialiao(4);
            if MT(1,4)~=0
               tempt=tempt+qinxi;
           end
            MT(1,4)=MT(1,4)+shangxialiao(4)+jiagong;
             temppos=2;
              continue;
        end
        [a,b]=min(MT);
        if tempt<a
           if b==1||b==2 % ����ԭ�� �Ȼ�������
              tempt=MT(1,b)+shangxialiao(b)+qinxi;
              MT(1,b)=MT(1,b)+shangxialiao(b)+qinxi+jiagong;
               continue;
           
           else
               if tempt+yidong<a   %����ƶ�������rgv��ʱ��ͬ��С����Сֵ ��ֵ���ƶ�
                 tempt=MT(1,b)+shangxialiao(b)+qinxi;
                 MT(1,b)=MT(1,b)+shangxialiao(b)+qinxi+jiagong;
                 temppos=2;
                  continue;
               
               end
              
           end
               
            
        end
    end
    %%%%
       %%%%% 
    if temppos==2  %�ڵ�2��λ�� ��3 4��̨���Ƿ����
        if(tempt>=MT(1,3))
           tempt=tempt+shangxialiao(3);
           if MT(1,3)~=0
               tempt=tempt+qinxi;
           end
           MT(1,3)=MT(1,3)+shangxialiao(3)+jiagong;
           continue;
        end
        if(tempt>=MT(1,4))
           tempt=tempt+shangxialiao(4);
           if MT(1,4)~=0
               tempt=tempt+qinxi;
           end
           MT(1,4)=MT(1,4)+shangxialiao(4)+jiagong;
            continue;
        end
        if(tempt+yidong>=MT(1,1))
            tempt=tempt+yidong+shangxialiao(1);
            if MT(1,1)~=0
               tempt=tempt+qinxi;
           end
            MT(1,1)=MT(1,1)+shangxialiao(1)+jiagong;
            temppos=1;
            continue;
        end
        if(tempt+yidong>=MT(1,2))
            tempt=tempt+yidong+shangxialiao(2);
            if MT(1,2)~=0
               tempt=tempt+qinxi;
           end
            MT(1,2)=MT(1,2)+shangxialiao(2)+jiagong;
             temppos=2;
              continue;
        end
        [a,b]=min(MT);
        if tempt<a
           if b==3||b==4 % ����ԭ�� �Ȼ�������
              tempt=MT(1,b)+shangxialiao(b)+qinxi;
              MT(1,b)=MT(1,b)+shangxialiao(b)+qinxi+jiagong;
               continue;
           
           else
               if tempt+yidong<a   %����ƶ�������rgv��ʱ��ͬ��С����Сֵ ��ֵ���ƶ�
                 tempt=MT(1,b)+shangxialiao(b)+qinxi;
                 MT(1,b)=MT(1,b)+shangxialiao(b)+qinxi+jiagong;
                 temppos=1;
                  continue;
               
               end
              
           end
               
            
        end
    end
    %%%%
    
       
        
        
end
       
        
    
    
    
