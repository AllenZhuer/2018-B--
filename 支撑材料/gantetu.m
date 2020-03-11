clear;    
axis([0,2000,0,8.5]);           %x�� y��ķ�Χ
set(gca,'xtick',0:500:2000); %x�����������
set(gca,'ytick',0:1:8.5);       %y�����������
xlabel('ʱ��/s'),ylabel('CNC���');      %x�� y�������
title('��1��ǰʮ����������ͼ');     %ͼ�εı���
n_bay_nb=8;    %total bays   //������Ŀ
n_task_nb = 16;%total tasks  //������Ŀ
%x�� ��Ӧ�ڻ�ͼλ�õ���ʼ����x
n_start_time=xlsread('Case_1_result_1.xls','sheet1','j2:j17');    %  ÿ������Ŀ�ʼʱ��
%length ��Ӧ��ÿ��ͼ����x�᷽��ĳ���
n_duration_time=xlsread('Case_1_result_1.xls','sheet1','h2:h17'); % ÿ������ĳ���ʱ��
%y�� ��Ӧ�ڻ�ͼλ�õ���ʼ����y
n_bay_start=xlsread('Case_1_result_1.xls','sheet1','b2:b17');     % ������Ŀ��������һ�л���
%����ţ����Ը��ݹ����ѡ��ʹ����һ����ɫ
n_job_id=[0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0];
rec=[0,0,0,0];   
color=['r','g','b','c','m','y'];
for i =1:n_task_nb
  rec(1) = n_start_time(i);     %���εĺ�����
  rec(2) = n_bay_start(i)-0.2;  %���ε�������
  rec(3) = n_duration_time(i);  %���ε�x�᷽��ĳ���
  rec(4) = 0.6; 
  txt=sprintf('p(%d,%d)=%d',n_bay_start(i),n_job_id(i)+1,n_duration_time(i));%�������ţ�����ţ��ӹ�ʱ�������ַ���
   rectangle('Position',rec,'LineWidth',0.5,'LineStyle','-','FaceColor',color(n_job_id(i)+1));%draw every rectangle  
end  