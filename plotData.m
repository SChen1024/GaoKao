% �� ԭʼ���ݻ��Ƴ��� ������ƽ��ֵ����ֵ

% ��ȡ excel ����  ��ȡ�����Լ���������
data_file = 'Data/res-100.xlsx';
res_ratio = xlsread(data_file,1,'B2:X501');
res_name = {'�����Ŀ�',	   '�������',	    '����',	    '�Ϻ�',    '�ӱ��Ŀ�',    '�ӱ����',    'ɽ��',    '�㶫�Ŀ�'    '�㶫���'    '�����Ŀ�',    '�������',    '�����Ŀ�',    '�������',    '�Ĵ��Ŀ�',    '�Ĵ����',    '�����Ŀ�',    '�������',    '�����Ŀ�',    '�������',    '�����Ŀ�',    '�������',    '�����Ŀ�',    '�������'};

figure()
hold on
[rows,cols] = size(res_ratio);
% ƽ������������ ����
avg = zeros(cols,1);
media =zeros(cols,1);
max1 = zeros(cols,1);
for i=1:cols
    % ���ưٷֱ���ͼ
    plot(res_ratio(:,i)*100);
    
    % ����ƽ��ֵ  ��ֵ ����
    media_l = 0.5;
    media_find_flg = 0;
    max_l = 1;
    for j = 1:rows
        avg(i) = avg(i) + j*res_ratio(j,i);
        
        % ͳ�Ʊ��ʳ���һ��� ��֮�������ֵ �ҵ���Ͳ�������
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

% ���� xlabel
xlabel({'��һ����100�ֺ�ɼ�'});

% ���� title
title({'��ʡ�й�һ���ɼ��ֲ�����'});

% ���� ylabel
ylabel({'��λ�ɼ��ֲ�����'});


