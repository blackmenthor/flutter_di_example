# flutter_di_example

This is an example of how to implement Dependency Injection in your own Flutter project.

This example is crafted by [Mozio](http://www.mozio.com)'s Mobile Team.
- Caio Landau (caioflandau@gmail.com)
- Matias Bzurovski (matibzurovski@gmail.com)
- Angga Arifandi (anggadwiarifandi96@gmail.com) 

<img src="https://user-images.githubusercontent.com/12998697/79983743-5c9ccd00-84d2-11ea-8f38-9e6429100fd8.png" width="200"/>

## How to Add Dependencies

To add a dependency, all you need to do is call this code below:

```
injector.registerDependency<Type>((_) => YourDependency())
```

or

```
registerDependency<Type>((_) => YourDependency());
```

depending on where do you want to add this dependency (Global, or Local).

But, what if I need another dependency for this dependency?
You can do that by using the `Injector` object that are supplied inside the 
`registerDependency` function.

So for example, you need object B to instantiate object A, so it will be:

```
registerDependency<Type>((Injector injector) {
    final b = injector.getDependency<B>();
    return A(b: b);
  }
);
```

Pretty easy right?
## How to Get Dependencies

To get dependency inside a widget, you need to make that widget implements 
a mixin called `InjectableWidget` and create another file called `pagename_graph.dart`
and just copy the content of `main_page_graph` that I've created in this project.

Fortunately, I've already created a script to automate the widget creation 
process inside the `scripts/create_widget.sh`, so you can just call

```
bash ./scripts/create_widget.sh ExamplePage
```

from your main directory. But please do note that you need to modify
 the script so it matches your project package, or else it'll fail.
 
Then, inside the widget, you'll just need to add a variable containing your
preferred dependency, for instance if I want to inject the EnvironmentConfig:

```
//injected
EnvironmentConfig config;
```

and then, inside the Graph's inject function, you'll need to assign that
variable using the one you got from the dependency. For instance:

```
subject.config = getDependency<EnvironmentConfig>();
```

And voila! The `InjectableWidget` will inject the needed dependency to your widget.

## Types of Dependencies
There are two ways we can inject dependencies in this project. Global dependencies 
and local dependencies. What are the difference, and how to do each of them?

- Global Dependencies

Global dependencies are dependencies that are available throughout the project, 
and can be accessed in every page inside the application.

To add Global dependencies, you can go to `di/injector.dart` an inject your
dependency there.

- Local Dependencies

Local dependencies are dependencies that are only available for one page only.
When do we use this local dependencies? usually this can be used for dependencies
that are only needed for a single page only (e.g. converter, utilization dependencies, etc).

To add Local dependencies, you can go to the respective pages and inside
 `page/di/page_graph.dart`, add your new dependency inside the `register`
 function.

# Contributing
If you have an idea about improving this example project (e.g. tests, documentation), 
or saw something wrong and you can fix it.

Feel free to create a PR, and I'll try my best to review it ASAP.