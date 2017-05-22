function Result=Bianshi(im)

scores = classification_vic(im, 0);
[score, class]  = max(scores);
if(class<11)
    Result = num2str(class-1) ;
else
    Result = char(class+54);
end

