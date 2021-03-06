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
- Functor + Applicative + Monad

## Newtypes

##

```{.ts}
export type OrgId = string & { readonly __tag: unique symbol };
```

## fp-ts

- Functions to treat core JS types as immutable.
- Common FP data types.
- Typeclasses (kind of).

## Sums and products

##

```{.ts}
type Person = {
  name : Name;
  age : Age;
}
```

##

```{.haskell}
data Maybe a =
    Just a
  | Nothing
```

:::{.notes}
- If you just have this, you can at least replace nulls
:::

##

```{.haskell}
data Result e a =
    NotStarted
  | Pending
  | Success a
  | Error e
```

::: {.notes}
- Alternative is something like an enum, nullable success value, and nullable error.
:::

##

```{.haskell}
resultError :: Result e a -> Maybe e
resultError r = case r of
  NotStarted -> Nothing
  Pending -> Nothing
  Success _ -> Nothing
  Error e -> Just e
```

##

```{.haskell}
result ::
  b
  -> b
  -> (a -> b)
  -> (e -> b)
  -> Result e a
  -> b
result ns p s e r = case r of
  NotStarted -> ns
  Pending -> p
  Success a -> s a
  Error e' -> e e'
```

##

```{.ts}
export interface Success<A> {
  readonly _tag: "Success";
  readonly success: A;
}

// Define interfaces for other constructors...

export type Result<E, A> = NotStarted | Pending | Error<E> | Success<A>;

export const success = <A>(a: A): Success<A> => ({
  _tag: "Success",
  success: a,
});

// Define other constructor functions...
```

##

```{.ts}
export const fold = <E, A, B>(
  onNotStarted: () => B,
  onPending: () => B,
  onError: (e: E) => B,
  onSuccess: (a: A) => B
) => (r: Result<E, A>): B => {
  switch (r._tag) {
    case "NotStarted":
      return onNotStarted();
    case "Pending":
      return onPending();
    case "Error":
      return onError(r.error);
    case "Success":
      return onSuccess(r.success);
  }
};
```

## Functor

::: {.notes}
- Found for front end stuff that this is generally enough.
- Traversable is also a nice to have.
:::

##

```{.ts}
const [person, setPerson] = React.useState<Option<Person>>(O.none);

// Elsewhere...
const jsonResult = O.fromNullable(getSerializedPerson());
setPerson(O.map((j) => deserializePerson(j)))
```

## Applicative

##

```{.ts}
const ageDifference = (p1 : Person, p2 : Person) => Math.abs(p1.age - p2.age);

const foo = () =>
  (p1 !== null && p2 !== null)
  ? ageDifference(p1, p2)
  : null
```

##

```{.ts}
const ageDifference = (p1 : Person) => (p2 : Person) => Math.abs(p1.age - p2.age);

const foo = () =>
  pipe(O.some(ageDifference), O.ap(p1), O.ap(p2))
```

## Monad

##

```{.ts}
let discount = null;
if (p) {
  const oh = getOrderHistory(p)
  if (oh) {
    discount = getDiscount(oh)
  }
}
```

:::{.notes}
Promise chaining often cited.
:::

##

```{.ts}
const discount = pipe(p, O.chain(getOrderHistory), O.chain(getDiscount))
```

:::{.notes}
Like promise chaining, but better
:::
