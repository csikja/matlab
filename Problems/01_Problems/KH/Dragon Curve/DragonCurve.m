function DcNew = DragonCurve(cycles)

    DcOriginal = [];
    while cycles>0
    
     DcNew = 1;
    
     while (size(DcNew,2) < size(DcOriginal,2)*2)
       % add 1 element from old vector
       DcNew(end+1) = DcOriginal(ceil(size(DcNew,2)/2));
       % add 1 new element
       new_el = [1,0];
       DcNew(end+1) = new_el(mod(size(DcNew,2)/2,2)+1);
       end
    
       DcOriginal = DcNew;
       cycles = cycles-1;
    end

    %disp(DcNew);

end