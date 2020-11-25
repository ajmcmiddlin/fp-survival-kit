# Higher order functions

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
