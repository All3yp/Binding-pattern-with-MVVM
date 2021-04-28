# Binding pattern with MVVM

To accomplish this whole binding and observable business we do want something that is going to represent and observable object we're also going to want a model and of course we'll want some view models and we're going to want a controller as well so in our controller we're going to be making and api call to get a list of users and once we have them once we update the view models we shoud see the view automatically update hence the whole concept of mvvm bindings.


Create an objetc that is capable of observing and bindings to values, so this is concept of when a value of something that's binded to has changes we shoud be informed of that change to update the UI

The magic underneath that bind is a thing that we covered in the  very beginning here is this bit of code here so we have a class observable which is capable of taking a generic value hence T? ans it'also capable of hanging on to a single listener so you can bind the observable to a single listener and whenever the value changes in the did set here we go ahead and invoke that listener letting the binded site know that the value has changed. You can bind a single value, a single observable object to multiple listeners.

## References 
[packtpub](https://subscription.packtpub.com/book/programming/9781789135565/10/ch10lvl1sec61/mvvm-and-data-binding)
[benoitpasquier](https://benoitpasquier.com/ios-swift-mvvm-pattern/)