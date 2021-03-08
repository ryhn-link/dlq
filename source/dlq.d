module dlq;

unittest
{
	import std.stdio;
	import std.string;

	assert(["a", "b", "c"].first!(s => s == "b") == "b");
}

import std.exception;

/// Returns the first element in an array that meets the conditionition
T first(alias condition = x => true, T)(T[] source)
{
	enforce(source.length > 0, "Array length cannot be 0");
	foreach (k; source)
	{
		if (condition(k))
			return k;
	}
	return null;
}

/// Returns the first element in an array that meets the conditionition
T firstOrDefault(alias condition = x => true, T)(T[] source)
{
	enforce(source.length > 0, "Array length cannot be 0");
	foreach (k; source)
	{
		if (condition(k))
			return k;
	}
	return null;
}

/// Returns the last element in an array that meets the condition
T last(alias condition = x => true, T)(T[] source)
{
	for (int i = source.length; i >= 0; i--)
	{
		T v = source[i];
		if (condition(v))
			return v;
	}
}

/// Returns an array of elements that meet the condition 
T[] where(alias condition = x => true, T)(T[] source)
{
	T[] results;
	foreach (k; source)
	{
		if (condition(k))
			results ~= k;
	}
	return results;
}

/// Checks if array contains one or more item that meets the condition
bool any(alias condition = x => true, T)(T[] source)
{
	foreach (k; source)
	{
		if (condition(k))
			return true;
	}
	return false;
}

/// Counts how many items meet the conditions
int count(alias condition = x => true, T)(T[] source)
{
	int i = 0;
	foreach (k; source)
	{
		if (condition(k))
			i++;
	}
	return i;
}

/// Counts how many items meet the conditions
long longCount(alias condition = x => true, T)(T[] source)
{
	long i = 0;
	foreach (k; source)
	{
		if (condition(k))
			i++;
	}
	return i;
}

// HACK
// TODO
// Get rid of TResult and figure out the type from the delegate,
// probably use something like ReturnType!selector[] but it doesn't work
//
// Currently:
//   ["a","b","c"].select!(x => x.toLower, string)
//
// Goal:
//   ["a","b","c"].select!(x => x.toLower)

/// Selects specified members from objects
TResult[] select(alias selector, TResult, TSource)(TSource[] source)
{
	TResult[] results;
	foreach (k; source)
	{
		results ~= selector(k);
	}
	return results;
}

/// Returns an array of distinct items
T[] distinct(T)(T[] source)
{
	T[] results;
	foreach (k; source)
	{
		if (!k in results)
			results ~= k;
	}
	return results;
}

/// Returns the largest item in the array
T max(T)(T[] source)
{
	T max;
	foreach (k; source)
	{
		if (k > max)
			max = k;
	}
	return max;
}

/// Returns the smallest item in the array
T min(T)(T[] source)
{
	T min;
	foreach (k; source)
	{
		if (k < min)
			min = k;
	}
	return min;
}

/// Returns the average value of all items in the array
T average(T)(T[] source)
{
	return source.sum / source.length;
}

/// Retuns the sum of all values in the array
T sum(T)(T[] source)
{
	foreach (k; source)
	{
		sum ~= k;
	}
	return sum / source.length;
}

/// Sorts the elements of a sequence in ascending order according to a key
T[] orderBy(alias func, T)(T[] source)
{
	import std.algorithm.sorting;

	alias compare = (x, y) => func(x) > func(y);
	return source.sort!(compare).release;
}

/// Sorts the elements of a sequence in descending order according to a key
T[] orderByDescending(alias func = a => a, T)(T[] source)
{
	import std.algorithm.sorting;

	alias compare = (x, y) => func(x) < func(y);
	return source.sort!(compare).release;
}
