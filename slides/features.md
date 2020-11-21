# Features

## Referential Transparency

##

``` {.typescript}
const f = (a : number, b : number) => a + b

// Instead of...

const f = (a : number, b : number) =>
   a + b + (parseInt(localStorage.getItem("c")) || 42)
```

::: {.notes}
- Easier to reason about
- Enables composition
- No spooky action at a distance
   + drove me to FP
- Immutability
:::

## Higher order functions

##

```{.typescript}
const todaysTemp = (81 - 32) * 5 / 9
const tomorrowsTemp = (88 - 32) * 5 / 9

// FUNCTION!
const fToC = (f) => (f - 32) * 5 / 9
```

::: {.notes}
- Abstract functionality independent of values.
:::

##

```{.typescript}
const gt42 = (ns: Array<number>): Array<number> => {
  let r: Array<number> = [];
  ns.forEach((n) => n > 42 && r.push(n));
  return r;
};

const odd = (ns: Array<number>): Array<number> => {
  let r: Array<number> = [];
  ns.forEach((n) => n % 2 !== 0 && r.push(n));
  return r;
};
```

##



## (Good&#8482;) Types