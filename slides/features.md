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

<pre class="haskell"><code data-trim data-noescape>
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



## (Good&#8482;) Types