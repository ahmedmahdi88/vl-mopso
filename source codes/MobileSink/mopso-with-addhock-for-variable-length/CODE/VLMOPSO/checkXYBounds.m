function pos=checkXYBounds(pos,lowerBound_pos,heighrerBounds_pos)
pos.x(pos.x<lowerBound_pos)=lowerBound_pos;
pos.y(pos.y<lowerBound_pos)=lowerBound_pos;
pos.x(pos.x>heighrerBounds_pos)=heighrerBounds_pos;
pos.y(pos.y>heighrerBounds_pos)=heighrerBounds_pos;
end