function index = greatestLessThan(list,value,low,high)
    if(high < low)
        index = high;
        return
    end
    index = floor((low + high)/2);
    if(list(index) > value)
        index = greatestLessThan(list,value,low,index-1);
        return
    elseif (list(index) < value)
        index = greatestLessThan(list,value,index+1,high);
        return
    else
        return
    end
end