% 将 原始数据绘制出来 并计算平均值和中值

% 读取 excel 数据  获取名称以及各列名称
data_file = 'Data/res-100.xlsx';
res_ratio = xlsread(data_file,1,'B2:X501');
res_name = {'河南文科',	   '河南理科',	    '北京',	    '上海',    '河北文科',    '河北理科',    '山东',    '广东文科'    '广东理科'    '湖北文科',    '湖北理科',    '湖南文科',    '湖南理科',    '四川文科',    '四川理科',    '安徽文科',    '安徽理科',    '广西文科',    '广西理科',    '贵州文科',    '贵州理科',    '江西文科',    '江西理科'};

figure()
hold on
[rows,cols] = size(res_ratio);
% 平均数，中数， 众数
avg = zeros(cols,1);
media =zeros(cols,1);
max1 = zeros(cols,1);
for i=1:cols
    % 绘制百分比率图
    plot(res_ratio(:,i)*100);
    
    % 计算平均值  中值 众数
    media_l = 0.5;
    media_find_flg = 0;
    max_l = 1;
    for j = 1:rows
        avg(i) = avg(i) + j*res_ratio(j,i);
        
        % 统计比率超过一半的 数之后就是中值 找到后就不更新了
        if(media_find_flg ==0)
              if(media_l >0)
                  media_l = media_l - res_ratio(j,i);
              else
                  media(i) = j;
                  media_find_flg = 1;
            end
        end
        
        if res_ratio(j,i) > res_ratio(max_l,i)
            max_l = j;
        end
    end
    
    max1(i) = max_l;
end
legend(res_name);
% legend(res_name(1:6));

% 创建 xlabel
xlabel({'归一化到100分后成绩'});

% 创建 title
title({'各省市归一化成绩分布比率'});

% 创建 ylabel
ylabel({'单位成绩分布比率'});


