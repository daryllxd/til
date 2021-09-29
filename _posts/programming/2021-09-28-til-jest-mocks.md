---
layout: post
title:  "TIL, 2021-09-28, Jest Mocks"
date:   2021-09-28 11:08:57 +0800
categories: programming
summary: "Jest Mocks"
---

# JavaScript Functions vs Methods (and other helpful tips)
[Reference](https://medium.com/predict/javascript-functions-vs-methods-and-other-helpful-tips-e58a621b1d27)

- Methods have a receiver, functions do not.
- Method: `someObject.someMethod()`. Function: `someFunction(arg)`.
- *Whenever a function is declared on the global scope, it becomes a property of the global object.*
- Explicit context - when the context is explicitly defined and passed in - referring to `this`.

```
function context() {
  console.log('the context is ' + this);
}
var someObject = {};
context.call(someObject);
  // Logs: 'the context is [object Object]'
  // This is explicit context. The context is explicitly defined.
context();
  // Logs: 'the context is [object Window]'
  // This is implicit context. The context is not defined.
```

# The Jest Object
[Reference](https://jestjs.io/docs/jest-object)

- The `jest` object is automatically in scope within every test file.
- `jest.disableAutomock()` - disables automatic mocking in the module loader.
- Automock: No need to explicitly mock everything at the beginning of the file.

```
module.exports = {
  automock: true
}
```

- When you use jest.mock on a module. Every exported values will be transformed like this (recursively):
  - Function will be transformed to spy function doing noop (like, the `jest.fn()`)
  - Array will be transformed to empty array.
  - ES6 Class will be transformed like function
  - Number, Object, String won’t be affected.

## Mock functions

- `jest.fn()` - takes in a new, unused mock function, and optionally takes in a mock implementation.
- `jest.spyOn` - tracks calls to `object[methodName]`. This actually still calls the method, so you do a `mockImplementation`.
- 3rd argument is like if we are mocking a `get` or `set` method, we can then access it.
- `detectOpenHandles` [Reference](https://stackoverflow.com/questions/53539990/are-there-side-effects-of-running-jest-with-detectopenhandles-forceexit)
  - Attempt to collect and print open handles - this is just used for debugging, hopefully.
  - `forceExit` - should not be used, you will use if an async function didn't finish, a Websocket connection is still open, a DB connection is still open.
- Expect to throw - `toThrow`- you need 2 types of tests, 1 to assert what type of error, and 1 to assert what the error message was.

```
expect(() => {
  // Code block that should throw error
}).toThrow(TypeError) // Or .toThrow('expectedErrorMessage')
```

# Understanding Jest Mocks
[Reference](https://medium.com/@rickhanlonii/understanding-jest-mocks-f0046c68e53c)

- Mocking libraries: `testdouble` and `sinon`.
- Simplest way to create a Mock Function: `jest.fn()`.
- Mock return value: `mock.mockReturnValue("bar");`
- Mock promise resolution:

```
mock.mockResolvedValue("bar");

expect(mock("foo")).resolves.toBe("bar");
```

- Mock dependency injection:

```
const doAdd = (a, b, callback) => {
  callback(a + b);
};

test("calls callback with arguments added", () => {
  const mockCallback = jest.fn();
  doAdd(1, 2, mockCallback);
  expect(mockCallback).toHaveBeenCalledWith(3);
});
```

- `jest.fn` -> mock a function
- `jest.mock` -> mock a module
  - `jest.mock` -> Used in Hermes - this is what happens when you do `automock: true`.
- `jest.spyOn` -> spy or mock a function
  - The function actually literally gets called - we just want to see that the function got called.
- `jest.mock` -> does it for all functions in a module
- `jest.spyOn` -> does the same thing but allows restoring the original function

- Subject under test
- Dependency
- Unit test - Exercises a private API by mocking a method.
- Obvious abuse:
  - Partially mocking something - you want to either mock the entire thing, or not mock at all.
  - Don't fake parts of the thing being tested ("but `x.js` is 900 lines long") - if the thing is too long, then poking it with mocks worsens the situation
    - You have a big thing that no one understands, and tests of it that nobody trusts
