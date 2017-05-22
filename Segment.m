% road prepare
function str = Segment(file)
%file_path = 'F:/Caffe/test/';
%img_path_list = dir(strcat(file_path,'U35M.bmp'));
img_path_list = dir(file);
img_num = length(img_path_list);
img_path_list = img_path_list(randperm(img_num )) ;
for i=1:img_num
    image_name = img_path_list(i).name;% 图像名
    im = imread(file);
   % im = imread('F:\研一（2）\计算机视觉\project1\test\1RRX.bmp');
   % imshow(im)
    R=im(:,:,1);
    G=im(:,:,2);
    B=im(:,:,3);
    R0=im2bw(R);
    G0=im2bw(G);
    B0=im2bw(B);
    img0= B0&R0&G0 ;
%     figure(2)
%     subplot(4,1,1);
%     imshow(R0);
%     subplot(4,1,2)
%     imshow(B0);
%     subplot(4,1,3)
%     imshow(G0);
 
%     subplot(4,1,4)
%     imshow(img0);
 
    img = img0(:,3:length(img0),:) ;
    img = 1-img0;%颜色反转让字符成为联通域，方便去除噪点
    Bat = sum(img) ;%get the boundy
%     plot(sum(img))
    Left_0 = min(find((Bat>mode(Bat))==1)+2) ;
    Right_0 = max(find((Bat>mode(Bat))==1)+2) ;
    Left = Left_0-ceil((72-(Right_0-Left_0+1))/2)-1;
    Right = Left + 72 ;
    for j=0:3
       eval(['img_' num2str(j) '= im(:,(Left+18*j):(Left+18*(j+1)-1),:)']);
    end
end
str=[];
for num=0:3
   str=strcat(str,Bianshi(eval(['img_',num2str(num)])));
end

