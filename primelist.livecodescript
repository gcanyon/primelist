script "primelist"
function primeList pN
   -- return a cr-list of primes up to pN
   -- is space/memory efficient (as livecode goes)
   -- storage scales only as the number of primes to return, not as pN
   -- optimized to skip 3s as well as 2s
   -- this could be extended to 5s with some challenge
   if pN < 2 then return empty
   if pN = 2 then return 2
   put "2" & cr & "3" into tPrimes
   if pN = 3 then return tPrimes
   put trunc(sqrt(pN - 1)) into maxFactor
   repeat with tIs = 5 to pN - 1 step 6
      repeat for each item tI in tIs,(tIs + 2)
         if p[tI] is empty then
            if tI <= maxFactor then 
               put (2*tI),"" after p[tI^2]
               put 3 - tI mod 3 into pFactor[2*tI]
            end if
            if tI <= pN then 
               put cr & tI after tPrimes
            end if
         else
            repeat for each item i in p[tI] 
               put i,"" after p[tI + i * pFactor[i]]
               put item pFactor[i] of "2,1" into pFactor[i]
            end repeat
         end if
         delete variable p[tI]
      end repeat
   end repeat
   return tPrimes
end primeList

function primeListPlain pN
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
end primeListPlain

function primeListSieve pN
   -- pretty standard sieve of Eratosthenes code
   -- faster than primeListPlain but takes more memory
   -- slower and more memory than primeList
   if pN < 2 then return empty
   put max(3,trunc(sqrt(pN)) - 1) into tMroot  
   put "2" into tPrimes
   repeat with tI = 3 to tMroot step 2
      if tIsItComposite[tI] is 1 then next repeat
      put cr & tI after tPrimes
      repeat with tJ = tI^2 to pN step tI
         put 1 into tIsItComposite[tJ]
      end repeat
   end repeat
   repeat with tI = tMroot + 2 - (tMroot + 1) mod 2 to pN - 1 step 2
      if tIsItComposite[tI] is empty then put cr & tI after tPrimes
   end repeat
   return tPrimes
end primeListSieve
