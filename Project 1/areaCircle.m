function area = areaCircle(r)

   negind = r < 0;
   area = pi*r.^2;
   area(negind) = -1;


        
    