script "primelist"
function primeList pN
   -- return a cr-list of primes up to pN
   -- is space/memory efficient (as livecode goes)
   -- storage scales only as the number of primes to return, not as pN
   if pN < 2 then return empty
   put "2" into tPrimes
   put trunc(sqrt(pN - 1)) into maxFactor
   repeat with tI = 3 to pN - 1 step 2
      if p[tI] is empty then
         if tI <= maxFactor then put (2*tI),"" after p[tI^2]
         put cr & tI after tPrimes
      else
         repeat for each item i in p[tI]
            put i,"" after p[tI + i]
         end repeat
      end if
      delete variable p[tI]
   end repeat
   return tPrimes
end primeList
