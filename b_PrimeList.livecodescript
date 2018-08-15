script "b_PrimeList"
on mouseUp
   put the long seconds into T
   put primeList(fld 2) into pList
   put the long seconds - T
   put pList is fld 1 into fld 3
   put pList into fld 1
end mouseUp
