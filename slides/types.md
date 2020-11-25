# (Good&#8482;) Types

##

- Ensure the bits of my program work together.
- Invalid states unrepresentable.
- Fearless refactoring and extension.
- Types _aren't_ tests. They're tests you didn't have to write.

::: {.notes}
- Relate things lining up back to composition
:::

## Good?

- User defined algebraic data types (sums and products).
- Whole program type checked.

## 

Sums and products

##

```{.ts}
type Person = {
  name : string;
  age : number;
}
```

##

```{.haskell}
data Result a =
    NotStarted
  | Pending
  | Success a
  | Error
```
