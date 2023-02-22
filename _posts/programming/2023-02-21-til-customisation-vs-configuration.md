---
layout: post
title:  "TIL, 2023-02-21, Customisation vs Configuration"
date:   2023-02-21 11:15:30 +0800
categories: programming
summary: "Customisation vs Configuration"
---

# Customization vs. Configuration in Evolving Design Systems
[Reference](https://engineering.atspotify.com/2021/04/customization-vs-configuration-in-evolving-design-systems/)

- Abstraction - obscuring low-level implementation details in favor of a more high-level representation.
  - Low-level means touching CSS or HTML directly.
  - High-level means changing custom properties.
- Current landscape
  - Customisation: Pass custom styles externally from the component (Radix-like UI).
  - Configuration: Pass parameters in (ex: MUI side nav, parameter for which direction it's coming from).

- Options:
  - **Powerhouse definitions** (ex: our Footer - `Variant1`, `Variant2`) - assign a definition without a lot of input from the end user.
    - Use for inert components like footer.
  - **Prepacked-guidelines** (ex: our Tailwind colors - `text-primary-100`) - don't touch the underlying style guide.
    - Use for components that product says can change.
  - **Property pass through** (ex: Input component, Select component) - anything gets passed through, but we add additional styling and properties.
    - Ex: Our input - we add the border, the focus state, etc.
    - Ex: Our select - we add rendering the chevron, which flips when the select is opened.
    - Use for modification to library components that **all clients will follow.**
  - **Direct overrides** (ex: Our Layout component). Just pass `w-[800px]` or something inside. We should probably not use it these much.
    - Ex: RD pages (`/projects/bnz/gift-card-listing` vs `/projects/hyundai/gift-card-listing`).
    - Use for things only one client needs. (RD uses a lot, RC should try to not use as much as possible).

## Customisation

- Pros:
  - Autonomy - developers can do whatever (ex: someone can write a WL in their own way).
  - Speed - no need to check "what configurations are there" - just code.
- Cons
  - Lack of coherency - Wild wild west
  - Loss of maintainability, potential duplication  - this is because everyone can just write whatever

## Configuration

- Pros:
  - Consistency, maintainable
- Cons:
  - Bottleneck - Need to update the system for a "new variant"
  - Rigidness - Fewer options

## How to decide which approach to use

- Spotify uses more customisation - this is because teams work more autonomously
- Ascenda - configuration among teams (most teams have base components which are configurable), with overrides via customisation (`anz-global.scss`, `/projects/anz/something` overrides).

# 10 Web Development Trends in 2023
[Reference](https://www.robinwieruch.de/web-development-trends/)

- Meta-frameworks: Next.
- SSR (server-side rendering) vs SSG (static site generation).
- Serverless/cloud functions - infrastructure scaling on demand.
  - Pros: Best time to interactive experience for the end users. Edge functions are not only serving SSG/SSR content faster, but they can also cache their results closer, too.
- Databases:
  - Serverless - these cause the problem of opening up too many DB connections.
  - Can do connection pooling, but need 3rd party solution.
- JS Runtimes
  - Node, Deno, Cloudflare workers.
- Monorepo: Turborepo, Nx, Rush.
- Utility-first CSS: Tailwind.
  - Styled components and Emotion are 12 KB, 8 KB.
- Typescript.

# TypeScript + React: Component patterns
[Reference](https://fettblog.eu/typescript-react-component-patterns/)

- Props: Use `Props` suffix.
- Default props: do it like this:

```
type LoginMsgProps = {
  name?: string;
};

function LoginMsg({ name = "Guest" }: LoginMsgProps) {
  return <p>Logged in as {name}</p>;
}
```

- Children type - `React.ReactNode`.
- We can also never pass children:

```
type SaveButtonProps = {
  //... whatever
  children: never
}
```

- `WithChildren` helper type:

```
type WithChildren<T = {}> =
  T & { children?: React.ReactNode };

type CardProps = WithChildren<{
  title: string;
}>;
```

- Spread attributes to HTML elements: `JSX.IntrinsicElements["button"]`.
- Preset attributes (ex: only type="button" for buttons)

```
type ButtonProps =
  Omit<JSX.IntrinsicElements["button"], "type">;

function Button({ ...allProps }: ButtonProps) {
  return <button type="button" {...allProps} />;
}

// 💥 This breaks, as we omitted type
const z = <Button type="button">Hi</Button>;
```

- Forcing to style specific components

```
type StyledButton = Omit<
  JSX.IntrinsicElements["button"],
  "type" | "className"
> & {
  type: "primary" | "secondary";
};

function StyledButton({ type, ...allProps }: StyledButton) {
  return <Button className={`btn-${type}`} />;
}
```

- Forcing require properties:

```
type MakeRequired<T, K extends keyof T> = Omit<T, K> &
  Required<{ [P in K]: T[P] }>;

type ImgProps
  = MakeRequired<
    JSX.IntrinsicElements["img"],
    "alt" | "src"
  >;

export function Img({ alt, ...allProps }: ImgProps) {
  return <img alt={alt} {...allProps} />;
}

const zz = <Img alt="..." src="..." />;
```
