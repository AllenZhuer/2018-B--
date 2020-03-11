clear;    
axis([0,2000,0,8.5]);           %x轴 y轴的范围
set(gca,'xtick',0:500:2000); %x轴的增长幅度
set(gca,'ytick',0:1:8.5);       %y轴的增长幅度
xlabel('时间/s'),ylabel('CNC编号');      %x轴 y轴的名称
title('第1组前十六组调配甘特图');     %图形的标题
n_bay_nb=8;    %total bays   //机器数目
n_task_nb = 16;%total tasks  //任务数目
%x轴 对应于画图位置的起始坐标x
n_start_time=xlsread('Case_1_result_1.xls','sheet1','j2:j17');    %  每个工序的开始时间
%length 对应于每个图形在x轴方向的长度
n_duration_time=xlsread('Case_1_result_1.xls','sheet1','h2:h17'); % 每个工序的持续时间
%y轴 对应于画图位置的起始坐标y
n_bay_start=xlsread('Case_1_result_1.xls','sheet1','b2:b17');     % 工序数目，即在哪一行画线
%工序号，可以根据工序号选择使用哪一种颜色
n_job_id=[0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0];
rec=[0,0,0,0];   
color=['r','g','b','c','m','y'];
for i =1:n_task_nb
  rec(1) = n_start_time(i);     %矩形的横坐标
  rec(2) = n_bay_start(i)-0.2;  %矩形的纵坐标
  rec(3) = n_duration_time(i);  %矩形的x轴方向的长度
  rec(4) = 0.6; 
  txt=sprintf('p(%d,%d)=%d',n_bay_start(i),n_job_id(i)+1,n_duration_time(i));%将机器号，工序号，加工时间连城字符串
   rectangle('Position',rec,'LineWidth',0.5,'LineStyle','-','FaceColor',color(n_job_id(i)+1));%draw every rectangle  
end  