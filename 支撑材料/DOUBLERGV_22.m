tempt=0;
temppos=1;
MT=zeros(1,4);
jiagong1=400;
jiagong2=378;
qinxi=25;
yidong=20;
N=100; 
aa=0;%1gongxu 1weizhi
ab=0;%1gongxu 2weizhi
ba=0;%2gongxu 1weizhi
bb=0;%2gongxu 2weizhi
for i=1:2*N
 if temppos==1
        if(mod(i,2)==0)
         %%%����ǵڶ���������
          if tempt>=MT(1,2)
              MT(1,2)=tempt+shangxialiao(2)+qinxi+jiagong2;
              tempt=tempt+qinxi+shangxialiao(2);
%              MT(1,2)=te+shangxialiao(2)+jiagong2;
             ab=ab+1;
             continue;
          end
         
         %%% 
          if tempt<MT(1,2)
             if(tempt+yidong<MT(1,4))
               if(MT(1,4)<MT(1,2))%ֵ���ƶ�
                   tempt=TM(1,4)+qinxi+shangxialiao(4);
                   MT(1,4)=MT(1,4)+shangxialiao(4)+jiagong2;
                   temppos=2;
                   
                   continue;
               else%��ֵ���ƶ���
%                    tempt=tempt+qinxi+shangxialiao(2);
                   tempt=TM(1,2)+shangxialiao(2)+qinxi;
                   MT(1,2)=MT(1,2)+shangxialiao(2)+jiagong2;
                   continue;
               end
             end
              
          else     %�������2�Ż����� ��ԭ������
                    MT(1,2)=tempt+jiagong2+shangxialiao(2);
                    tempt=tempt+qinxi+shangxialiao(2);
%                    MT(1,2)=MT(1,2)+shangxialiao(2)+jiagong2;
                   continue;
          end  %%%%%%%%%%�ڶ��������
        end
          %��һ�����
       if(mod(i,2)~=0)
         %%%����ǵ�һ��������
          if tempt>=MT(1,1)
              MT(1,1)=tempt+shangxialiao(1)+jiagong1; 
              tempt=tempt+shangxialiao(1);
%              MT(1,1)=MT(1,1)+shangxialiao(1)+jiagong1;
             continue;
          end
         
         %%% 
          if tempt<MT(1,1)
             if(tempt+yidong<MT(1,3))
               if(MT(1,3)<MT(1,1))%ֵ���ƶ�
                   tempt=MT(1,1)+shangxialiao(3);
                   MT(1,3)=MT(1,3)+shangxialiao(3)+jiagong1;
                    temppos=2;
                   continue;
               else%��ֵ���ƶ���
                   tempt=MT(1,1)+shangxialiao(1);
                   MT(1,1)=MT(1,1)+shangxialiao(1)+jiagong1;
                   continue;
               end
             end
              
          else     %�������1�Ż����� ��ԭ������
                   tempt=tempt+qinxi+shangxialiao(1);
                   MT(1,1)=tempt+shangxialiao(1)+jiagong1;
                   continue;
          end  %%%%%%%%%%��һ�������           
        end
            
 end
    if temppos==2
            
        if(mod(i,2)==0)
         %%%����ǵڶ���������
          if tempt>=MT(1,4)
              MT(1,4)=tempt+shangxialiao(4)+jiagong2;
              tempt=tempt+qinxi+shangxialiao(4);
%              MT(1,4)=MT(1,4)+shangxialiao(4)+jiagong2;
             continue;
          end
         
         %%% 
          if tempt<MT(1,4)
             if(tempt+yidong<MT(1,2))
               if(MT(1,2)<MT(1,4))%ֵ���ƶ�
                   tempt=MT(1,2)+qinxi+shangxialiao(2);
                   MT(1,2)=MT(1,2)+shangxialiao(2)+jiagong2;
                    temppos=1;
                   continue;
               else%��ֵ���ƶ���
                   tempt=MT(1,4)+qinxi+shangxialiao(4);
                   MT(1,4)=MT(1,4)+shangxialiao(4)+jiagong2;
                   continue;
               end
             end
              
          else     %�������2�Ż����� ��ԭ������
                   tempt=MT(1,4)+qinxi+shangxialiao(4);
                   MT(1,4)=MT(1,4)+shangxialiao(4)+jiagong2;
                   continue;
         end  %%%%%%%%%%�ڶ��������
       end
          %��һ�����
       if(mod(i,2)==1)
         %%%����ǵ�һ��������
          if tempt>=MT(1,3)
              MT(1,3)=tempt+shangxialiao(3)+jiagong1;
             tempt=tempt+qinxi+shangxialiao(3);
%              MT(1,3)=MT(1,3)+shangxialiao(3)+jiagong1;
             continue;
          end
         
         %%% 
          if tempt<MT(1,3)
             if(tempt+yidong<MT(1,1))
               if(MT(1,1)<MT(1,3))%ֵ���ƶ�
                   tempt=MT(1,1)+qinxi+shangxialiao(1);
                   MT(1,1)=MT(1,1)+shangxialiao(1)+jiagong1;
                    temppos=1;
                   continue;
               else%��ֵ���ƶ���
                   tempt=MT(1,3)+shangxialiao(3);
                   MT(1,3)=MT(1,3)+shangxialiao(3)+jiagong1;
                   continue;
               end
             end
              
          else     %�������1�Ż����� ��ԭ������
                     MT(1,3)=tempt+shangxialiao(3)+jiagong1;
                     tempt=tempt+qinxi+shangxialiao(3);
%                    MT(1,3)=MT(1,3)+shangxialiao(3)+jiagong1;
                   continue;
          end  %%%%%%%%%%��һ�������           
        end
            
            
            
   end  
    
end