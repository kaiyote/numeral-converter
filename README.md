## Pillar Kata - Roman Numeral Converter

### NodeJS Setup
  1. [Install Node](http://nodejs.org) (This has been tested with Node v0.12.9, v4.4.6, and v6.2.1)
  2. Run `npm install` inside the project root folder
  3. To run the tests, run `npm test`
  4. To run the app, open index.html. This has only been tested in latest Chrome
    - You can also run `npm start` to fire up a console version. If the input contains a number, it will attempt to convert from Arabic to Roman, otherwise it'll go the other way.

### Elm Setup
  1. [Install Elm](http://elm-lang.org/install)
  2. Run `elm package install -y` inside the project root folder
    - If you don't include the `-y` flag, make sure to type 'y' at the prompt, or it won't install anything
  3. To run the application do one of the following:
    - Run `elm reactor` inside the project root folder and browse to [http://localhost:8000](http://localhost:8000)
      1. To run the tests, click on [Tests.elm](http://localhost:8000/Tests.elm)
      2. To run the app, click on [Main.elm](http://localhost:8000/Main.elm)
    - Simply open Main.html to run the app, or Tests.html to run the tests
