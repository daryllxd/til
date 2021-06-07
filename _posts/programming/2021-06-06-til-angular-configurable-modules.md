---
layout: post
title:  "TIL, 2021-06-06"
date:   2021-06-06 22:58:05 +0800
categories: programming
summary: "Angular Configurable Modules"
---

# Angular: Writing Configurable Modules
[Reference](https://michelestieven.medium.com/angular-writing-configurable-modules-69e6ea23ea42)

- `useClass`: Swapping services with other ones.
- `useValue`: When you don't want to provide a class, but a value or object.
- `useFactory`: Uses a factory function and Angular provides the returned value of the function.
- `InjectionToken`:  This creates a token to use in the provide field, instead of strings or classes. Since every instance is different, we  don't have to worry about naming collisions, even if we specify the same value at initialisation phase.
- Configuring a module from the outside:
  - You can do something like create a module with a service inside.

```

interface ContentfulConfig {
  spaceId: string;
  accessToken: string;
}

const ContentfulConfigService = new InjectionToken<ContentfulConfig>("ContentfulConfig");

@NgModule()
export class ContentfulModule {
  static forRoot(config: ContentfulConfig): ModuleWithProviders {
    return {
      ngModule: ContentfulModule,
      providers: [
        ContentfulService,
        { provide: ContentfulConfigService, useValue: config }
      ]
    }
  }
}

AppModule

const contentfulConfig: ContentfulConfig = {
  spaceId: '12345678',
  accessToken: '99999'
}

@NgModule({
  imports: [
    ContentfulModule.forRoot(contentfulConfig)
  ]
});
export class AppModule {
}

@Injectable()
export class ContentfulService {
  private client;

  constructor(@Inject(ContentfulConfigService) private config) {
    this.client = contentful.createClient({
      space: config.spaceId,
      accessToken: config.accessToken
    });
  }
}

```

# Angular: Understanding Modules and Services
[Reference](https://michelestieven.medium.com/organizing-angular-applications-f0510761d65a)

- Feature Modules:
  - Must declare all the components, directives, and pipes it needs.
  - *Every module which is not the `AppModule` is technically a Feature Module, and it has to declare all the components, directives, and pipes that it needs.*
  - It is not enough to declare a component once in the declarations array of `AppModule` - in order to use a component in a module, it MUST be declared in that specific module.
  - `BrowserModule` must be imported in `AppModule` (it's required in order to run the app in the browser), this module must not be imported elsewhere: we must import `CommonModule`.
  - Feature Modules define all of the views, as each view will have its own module. Also, each "view module" can be lazy loaded by the route via `loadChildren`.
  - `preloadingStrategy` - Check out `preloadingStrategy: PreloadAllModules`.
- `CoreModule`
  - Global services should be `AppModule.`
  - Every laze module has its own injector. A service provided in a lazy module is only accessible in that module. But it can still access the services provided by non-lazy modules.
- Shared modules
  - `exports` makes components, directives, pipes, and even other modules available to the importing modules!

# Using the Angular Router to navigate to external links
[Reference](https://medium.com/@adrianfaciu/using-the-angular-router-to-navigate-to-external-links-15cc585b7b88)
