function pos = realcheckbounds(pos,lb,hb)
pos(pos<lb) = lb;
pos(pos>hb) = hb;
end