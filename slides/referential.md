# Referential Transparency

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
