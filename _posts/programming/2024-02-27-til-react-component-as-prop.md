---
layout: post
title:  "TIL, 2024-02-27"
date:   2024-02-27 16:13:34 +0800
categories: programming
summary: "Where I..."
---

# React component as prop: the right way™️
[Reference](https://www.developerway.com/posts/react-component-as-prop-the-right-way)

- **Ideal: "Give me an icon, I don't care which one, your choice, and I'll render it in the right place."**
- Pass component as element?

```
type ButtonProps = {
  children: ReactNode;
  icon: ReactElement<IconProps>;
};
```

- Pass as component itself?
```
type ButtonProps = {
  children: ReactNode;
  Icon: ComponentType<IconProps>;
};

export const ButtonWithIconComponent = ({
  children,
  Icon,
}: ButtonProps) => {
  return (
    <button>
      // our button is a component // its name starts with a
      capital letter to signal that // so we can just render
      it here as any other component
      <Icon />
      {children}
    </button>
  );
};
```

- Pass as function?

```
type ButtonProps = {
  children: ReactNode;
  renderIcon: () => ReactElement<IconProps>;
};

export const ButtonWithIconRenderFunc = ({
  children,
  renderIcon,
}: ButtonProps) => {
  // getting the Element from the function
  const icon = renderIcon();
  return (
    <button>
      // adding element like any other element here
      {icon}
      {children}
    </button>
  );
};
```

## Having default values for some props of the passed-in Icon

- React Element - you have to do `cloneElement`.
