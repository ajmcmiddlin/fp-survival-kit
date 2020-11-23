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
- DRY --- LOC correlates with number of bugs
:::

##

<pre class="typescript"><code data-trim data-noescape>
<span class="fragment fade-out" data-fragment-index="1">const gt42 = (ns: Array&lt;number&gt;): Array&lt;number&gt; => {
  let r: Array&lt;number&gt; = [];
  ns.forEach((n) => </span>n > 42<span class="fragment fade-out" data-fragment-index="1"> && r.push(n));
  return r;
};</span>

<span class="fragment fade-out" data-fragment-index="1">const odd = (ns: Array&lt;number&gt;): Array&lt;number&gt; => {
  let r: Array&lt;number&gt; = [];
  ns.forEach((n) => </span>n % 2 !== 0<span class="fragment fade-out" data-fragment-index="1"> && r.push(n));
  return r;
};
</span></code></pre>

##

<pre class="ts"><code data-trim data-noescape>
const filter = (f : (n : number) => boolean, ns : Array&lt;number&gt;):
  Array&lt;number&gt; => {

  let r: Array&lt;number&gt; = [];
  ns.forEach((n) => f(n) && r.push(n));
  return r;
};
</code></pre>

##

<pre class="ts"><code data-trim data-noescape>
const filter = &lt;a&gt;(f : (a : a) => boolean, as : Array&lt;a&gt;): Array&lt;a&gt; => {
  let r: Array&lt;a&gt; = [];
  as.forEach((a) => f(a) && r.push(a));
  return r;
};
</code></pre>

::: {.notes}
Surprise benefit --- parametricity!
:::

##

```{.haskell}
foo = h . g . f
```

::: {.notes}
- RT and HOF mean we have first class functions without side effects.
- Composition becomes a no brainer.
:::

##

``` {.ts}
const bigExpensiveValueIMightNotNeed = () => 42;
```

::: {.notes}
Can also use HOFs to build thunks and evaluate things only when needed.
:::

## (Good&#8482;) Types

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

