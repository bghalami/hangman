# Hangman

#### Created By Ben Ghalami

This is an app to play hangman


## Initial Setup

1. Clone the repository into a directory of your choosing:
  ```shell
  git clone git@github.com:bghalami/hangman.git
  ```
2. Navigate into the directory you just cloned down ```/hangman/phangman```.

3. Install the dependencies:
 Run the following  ```mix do deps.get, compile```
 Navigate into ```../phangman/assets``` and run ```npm install```
 Navigate back up one level to ```../hangman/phangman```
  
  
## Running the Server Locally

To see your code in action locally, you need to fire up a development server. From ```../hangman/phangman``` use the command:

```shell
mix phx.server
```

Once the server is running, visit the following in your browser:

* `http://localhost:4000/hangman` to run your application.

* To play simply hit ```New Game```

* To quit the server simply press Ctrl + C to shut it down.


## Built With
#### Tech
* [Elixir 1.8.2](https://elixir-lang.org/)
* [Phoenix Framework 1.4.9](https://phoenixframework.org/)
* And last but CERTAINLY not least, [Stack Overflow](https://stackoverflow.com/)
#### Dependencies
 * [Jason](https://github.com/michalmuskala/jason)
 * [PlugCowboy](https://github.com/elixir-plug/plug_cowboy)
 
 #### Organic
 * [Food](https://en.wikipedia.org/wiki/Food)
 * [Coffee](https://en.wikipedia.org/wiki/Coffee)
 * [My Brain](https://en.wikipedia.org/wiki/Human_brain)
 * [My Hands](https://en.wikipedia.org/wiki/Hand)
