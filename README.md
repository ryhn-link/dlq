# dlq (D language query)
dlq is a `System.Linq` port to D.
Based on [corefx source code](https://github.com/dotnet/corefx/tree/master/src/System.Linq/src/System/Linq) and [official Microsoft documentation](https://docs.microsoft.com/en-us/dotnet/api/system.linq.enumerable?view=net-5.0)

## Ported functions
- [ ] Aggregate  
- [x] All  
- [x] Any  
- [x] Average  
- [ ] Cast  
- [x] Contains
- [ ] DefaultIfEmpty   
- [x] Distinct   
- [ ] Except
- [x] First
- [ ] FirstOrDefault
- [ ] GroupBy
- [ ] GroupJoin
- [ ] Intersect
- [ ] Join
- [x] Last
- [ ] LastOrDefault
- [x] LongCount
- [x] Max
- [x] Min
- [ ] OfType
- [x] OrderBy
- [x] OrderByDescending
- [ ] Prepend
- [x] Select (HACK)
- [ ] Skip
- [ ] SkipLast
- [ ] SkipWhile
- [x] Sum
- [ ] Take
- [ ] TakeLast
- [ ] TakeWhile
- [ ] ToDictionary
- [ ] Union
- [x] Where
- [ ] Zip

### Won't add
- Append - D already lets you append arrays using `~=`
- AsEnumerable - This project only uses arrays
- ElementAt - `[n]` gets the element at n-th position
- Empty - `[ ]` creates an empty array
- Reverse - `array` already has a property with the same name that does the same thing 
- SelectMany - Just run Select multiple times
- SequenceEqual - `[] == []` does the same thing
- Single - What's the point? Just check the length and use `first`
- ThenBy - D doesn't have deferred execution
- ThenByDescending - same as `ThenBy`
- ToArray - Same as `AsEnumerable`
- ToHashSet - Same as `AsEnumerable`
- ToList - Same as `AsEnumerable`
- ToLookup - Same as `AsEnumerable`