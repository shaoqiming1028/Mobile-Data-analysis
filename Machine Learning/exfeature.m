function [features,time]=exfeature(data)

num=55;
window=16;
%window_m1=window-1;
window_2=window*2;

label_size=10;
labelList=zeros(label_size,1);
data_size=size(data,1);
%  ?9?
di_data=zeros(data_size-window,12);
sq_data=zeros(data_size,3);
features=zeros(data_size-window_2+1,num);
time=zeros(data_size-window_2,1);
%features=(data_size-window,);


% preprocessing phase: the first 31 records
for i=window+1:window_2-1
    i_win=i-window;
    sq_data(i,1)=sqrt(data(i,2)^2+data(i,3)^2+data(i,4)^2);
    sq_data(i,2)=sqrt(data(i,5)^2+data(i,6)^2+data(i,7)^2);
    sq_data(i,3)=sqrt(data(i,8)^2+data(i,9)^2+data(i,10)^2);
    
    di_data(i_win,1:9)=data(i,2:10) - data(i-16,2:10);
    di_data(i_win,10:12)=sq_data(i,:) - sq_data(i_win,:);
end


% start from 32
for i=window_2:data_size
    i_win=i-window;
    i_win_1=i_win+1;
    [~,label]=max(labelList);
    
    sq_data(i,1)=sqrt(data(i,2)^2+data(i,3)^2+data(i,4)^2);
    sq_data(i,2)=sqrt(data(i,5)^2+data(i,6)^2+data(i,7)^2);
    sq_data(i,3)=sqrt(data(i,8)^2+data(i,9)^2+data(i,10)^2);
    
    di_data(i-window,1:9)=data(i,2:10) - data(i-16,2:10);
    di_data(i-window,10:12)=sq_data(i,:) - sq_data(i-window,:);
    
    index=i-window_2+1;
    time(index)=data(i,1);
    
    % mean
    features(index,int32(FL.ax_mean):int32(FL.gvyz_mean))= ...
        mean(data(i_win_1:i,2:10));
    % std
    features(index,int32(FL.ax_std):int32(FL.gvyz_std))= ...
        std(data(i_win_1:i,2:10));
    
    %-------
    
    
    % square: mean, std
    features(index,int32(FL.sq_a_mean):int32(FL.sq_gvy_mean))= ...
        mean(sq_data(i_win_1:i,:));
    features(index,int32(FL.sq_a_std):int32(FL.sq_gvy_std))= ...
        std(sq_data(i_win_1:i,:));
    
    %++++++++
    
    % differential: mean, std
    features(index,int32(FL.di_ax_mean):int32(FL.di_gvy_mean))= ...
        mean(di_data(index:i_win,:));
    features(index,int32(FL.di_ax_std):int32(FL.di_gvy_std))= ...
        std(di_data(index:i_win,:));
    
    %*********
    
    %fft_ax
    fft_tmp=fft(data(i_win_1:i,2));
    features(index,int32(FL.fft_ax_energy))=sum(real(fft_tmp).^2)+sum(imag(fft_tmp).^2);
    tmp_sum=mean(abs(fft_tmp));
    fft_tmp=fft_tmp/tmp_sum;
    features(index,int32(FL.fft_ax_entropy))=sum(fft_tmp.*log2(fft_tmp));
    %fft_ay
    fft_tmp=fft(data(i_win_1:i,3));
    features(index,int32(FL.fft_ay_energy))=sum(real(fft_tmp).^2)+sum(imag(fft_tmp).^2);
    tmp_sum=mean(abs(fft_tmp));
    fft_tmp=fft_tmp/tmp_sum;
    features(index,int32(FL.fft_ay_entropy))=sum(fft_tmp.*log2(fft_tmp));
    %fft_az
    fft_tmp=fft(data(i_win_1:i,4));
    features(index,int32(FL.fft_az_energy))=sum(real(fft_tmp).^2)+sum(imag(fft_tmp).^2);
    tmp_sum=mean(abs(fft_tmp));
    fft_tmp=fft_tmp/tmp_sum;
    features(index,int32(FL.fft_az_entropy))=sum(fft_tmp.*log2(fft_tmp));
    
    for j=1:num
        if isnan(features(index,j))
            features(index,j)=0;
        end
    end
end

% the first column is label
%features(:,1)=time;
end


% model=libsvmtrain(y,X,'-t 0 -c 100');
% w_libsvm=model.SVs'*model.sv_coef;
% b_libsvm=-model.rho;
% 
% testdata=csvread('Patient2.csv',1,2);

