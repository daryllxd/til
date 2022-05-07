---
layout: post
title:  "TIL, 2022-05-05, Resolver with Params, Multiple Async pipes"
date:   2022-05-05 15:11:32 +0800
categories: programming
summary: "Resolver with Params, Multiple Async pipes"
---

- Angular - resolver with parameter on resolve method

```
{
  path: 'project/:id',
  component: ProjectComponent,
  resolve: { data: AppResolver },
  data: { resolvedata: 'myValue' }
}
```

- And in the resolver:

```
@Injectable()
export class AppResolver implements Resolve<MyComplexObject []> {
  constructor(private myService: MyService, private router: Router) {}
  resolve(route: ActivatedRouteSnapshot): Observable<MyComplexObject[]>|boolean {
    let myParam = route.data['resolvedata'];
    console.log(myParam);
  }
}
```

- [Reference](https://stackoverflow.com/questions/46792626/executing-resolvers-one-after-the-other-in-angular-2)
  - Resolvers are resolved in parallel. If Foo and Bar are supposed to be resolved in series they should be a single FooBar resolver. If they are supposed to be used by themselves in other routes, FooBar can wrap Foo and Bar resolvers:

```
class FooBarResolver implements Resolve<{ foo: any, bar: any }> {
  constructor(
    protected fooResolver: FooResolver,
    protected barResolver: BarResolver
  ) {}

  async resolve(route): Promise<{ foo: any, bar: any }> {
    const foo = await this.fooResolver.resolve(route);
    const bar = await this.barResolver.resolve(route);

    return { foo, bar };
  }
}
```

# How to avoid multiple async pipes in Angular
[Reference](https://medium.com/@yurykatkov/how-to-avoid-multiple-async-pipes-in-angular-ff0d51a8d368)
[Reference](https://dev.to/danywalls/how-to-simplify-multiple-async-pipes-39di)
[Reference](https://ofirrifo.medium.com/extract-multiple-observables-with-the-async-pipe-in-angular-b119d22f8e05)

- Async pipes - unsubscribe on component destroy, thus making it unnecessary to clean up manually.
- Problem with multiple subscriptions - well, we still have to have multiple observable.

```
<ng-container *ngIf="
  {
    obs1: obs1$ | async,
    obs2: obs2$ | async,
    obs3: obs3$ | async
  } as observables">
    <!--    already expanded observable!-->
    {{observables.obs1}}
</ng-container>
```

- Good approach if have a lot of observables and you need to user their values in a lot of places in the template.
