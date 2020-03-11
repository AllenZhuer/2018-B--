clear;
move1=20;
move2=33;
move3=46;
machine_time=[0 0 0 0 0 0 0 0];
load1=28;
load2=31;
process_time=560;
wash_time=25;
machine_busy=[0 0 0 0 0 0 0 0];
%移动时间
arrive_time(1,:)=[0 0 move1 move1 move2 move2 move3 move3 ];
arrive_time(2,:)=[0 0 move1 move1 move2 move2 move3 move3 ];
arrive_time(3,:)=[move1 move1 0 0 move1 move1 move2 move2 ];
arrive_time(4,:)=[move1 move1 0 0 move1 move1 move2 move2 ];
arrive_time(5,:)=[move2 move2 move1 move1 0 0 move1 move1 ];
arrive_time(6,:)=[move2 move2 move1 move1 0 0 move1 move1 ];
arrive_time(7,:)=[move3 move3 move2 move2 move1 move1 0 0 ];
arrive_time(8,:)=[move3 move3 move2 move2 move1 move1 0 0 ];
%移动加上下料
arrive_timep(1,:)=[0+load1 0+load2 move1+load1 move1+load2 move2+load1 move2+load2 move3+load1 move3+load2 ];
arrive_timep(2,:)=[0+load1 0+load2 move1+load1 move1+load2 move2+load1 move2+load2 move3+load1 move3+load2 ];
arrive_timep(3,:)=[move1+load1 move1+load2 0+load1 0+load2 move1+load1 move1+load2 move2+load1 move2+load2 ];
arrive_timep(4,:)=[move1+load1 move1+load2 0+load1 0+load2 move1+load1 move1+load2 move2+load1 move2+load2 ];
arrive_timep(5,:)=[move2+load1 move2+load2 move1+load1 move1+load2 0+load1 0+load2 move1+load1 move1+load2 ];
arrive_timep(6,:)=[move2+load1 move2+load2 move1+load1 move1+load2 0+load1 0+load2 move1+load1 move1+load2 ];
arrive_timep(7,:)=[move3+load1 move3+load2 move2+load1 move2+load2 move1+load1 move1+load2 0+load1 0+load2 ];
arrive_timep(8,:)=[move3+load1 move3+load2 move2+load1 move2+load2 move1+load1 move1+load2 0+load1 0+load2 ];
%初始位置
AGV_position=1;
%now_arrive_time;
%物料
number=378;
metal=zeros(3,number);
total_time=0;
machine_metal=zeros(1,8);
for loop=1:number
now_arrive_time=(arrive_time(AGV_position,:));
%cha=now_arrive_time-machine_time;
cha=machine_time-now_arrive_time;
%判断是否有小于0的
minszero=0;
for ii=1:8
    if cha(ii)<=0
        minszero=1;
    end
end
xx=zeros(1,8);
xx(1,:)=inf;
need_wait=0;
if minszero==1%如果有小于零的
    for ii=1:8
        if cha(ii)<=0
            xx(ii)=arrive_timep(AGV_position,ii);            
        end
    end
    [~,next_position]=min(xx);
    needwait=0;
else
    [wait_time,next_position]=min(cha);     
    needwait=1;
end
%移动
AGV_position=next_position;
disp(next_position);
comsume_time=arrive_timep(next_position);
machine_time=machine_time-comsume_time;%预期完成时间减少
%total_time=total_time+arrive_time(next_position);
if need_wait==1
    machine_time=machine_time-wait_time;
    total_time=total_time+wait_time;
end
machine_time(next_position)=machine_time(next_position)+process_time;%上料的机器时间增加
metal(1,loop)=total_time+arrive_time(next_position);

if machine_busy==1
    metal(2,machine_metal(next_position))=total_time;
end
machine_metal(next_position)=loop;
metal(3,loop)=next_position;
total_time=total_time+comsume_time;

machine_busy(next_position)=1;
if machine_busy==1
    machine_time=machine_time-wash_time;
    
    total_time=total_time+wash_time;
end
end




