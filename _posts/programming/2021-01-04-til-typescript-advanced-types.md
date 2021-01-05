---
layout: post
title:  "TIL, 2021-01-04, Typescript Advanced Types"
date:   2021-01-04 14:25:11 +0800
categories: programming
summary: "Typescript Advanced Types"
---

# Advanced Types in Typescript with examples
[Reference](https://medium.com/useful-advanced-typescript-tips/advanced-types-in-typescript-with-examples-148e1de3b989)

- Intersection types - `type W = X & Y` - will generate a type with all properties. (Then why intersection instead of union?)
- Union types - `type W = X | Y` - could be an instance of type `X` or an instance of type `Y`.
- Generic types: Allows the reuse of a given type based on a dynamic and generic type `T`.
- `Partial`: Allows user to construct a new type of given set `T` which all properties are optional.
- `Required`: All the properties of a given set `T` are required, even when the original interface has optional properties.
- `Pick`: Creates a new type from `T` by choosing properties `K` of this type. `type PenProduct = Pick<Product, 'id' | 'description' | 'price' | 'brand'>;`
- `Omit`: Build a new type by excluding: `type PenProduct = Omit<Product, 'author' | 'website' | 'editor' | 'year'>;`.
- `Extract`: Picking properties that exists in two distinct types. `type BookKeys = Extract<keyof AudioBook, keyof EBook>;`
- `Exclude`: Creating a new type by excluding properties that exists in two distinct types. `type DurationKey = Exclude<keyof AudioBook, keyof EBook>;`.
- `Record`

```
interface PersonID<T> {
  id: T;
}

type PersonTypes = "executive" | "manager" | "employee";

const peopleRecord: Record<PersonTypes, PersonID<string | number>> = {
  executive: { id: "001" },
  manager: { id: "254" },
  employee: { id: "875" },
};
```

- `NonNullable`: Removes `null` and undefined.
