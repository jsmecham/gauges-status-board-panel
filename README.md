# Gauges Widget for Status Board

This Sinatra app can be used to pull in analytics from the excellent
[Gauges](http://gaug.es) service from GitHub and display them on your
[Status Board](http://panic.com/statusboard).

## Configuration

To configure your own instance of this widget, you should be familiar with
running Sinatra or Ruby on Rails instances. Of course, if you are not familiar
with setting up and running a Sinatra web application, the easiest route is to
use [Heroku](http://heroku.com). Please reference [this tutorial](https://devcenter.heroku.com/articles/git)
for more information about deploying to Heroku.

### Defining Your API Key

You will need to get an API key for your Gauges account by following the
instructions at [http://get.gaug.es/documentation/api/authentication/](http://get.gaug.es/documentation/api/authentication/).

Once you have your API key, you should update the `app.rb` file to include it,
like so:

    set :api_key, "<your api key>"

This step is optional, however, as you can always pass in your API key to the
app with the api_key request parameter. For example:

    https://gauges-status-board-widget.herokuapp.com/traffic/<your-gauge-id>?api_key=<your-api-key>

## Usage

Currently, the only supported endpoint is the Traffic endpoint. More endpoints
will be added soon.

To use, simply add a Graph widget to your Status Board with a URL similar to
the following:

    https://<your-deployment-location>/traffic/<your-gauge-id>

If you have not specified your API key in `app.rb`, your URL should look like:

    https://<your-deployment-location>/traffic/<your-gauge-id>?api_key=<your-api-key>

## Live Example

The Gauges Widget is deployed on Heroku at
[https://gauges-status-board-widget.herokuapp.com](https://gauges-status-board-widget.herokuapp.com).

Feel free to use the widget at this location, however, please note that I
cannot make any guarantees about the reliability or security of this
deployment. If this is of concern to you, please host your own instance of
this widget.

To use this live example in your Status Board, use the following URL:

    https://gauges-status-board-widget.herokuapp.com/traffic/<your-gauge-id>?api_key=<your-api-key>


## Author

Written by Justin Mecham ([email](mailto:justin@mecham.me),
[twitter](http://twitter.com/jsmecham)).

## License

This project is licensed under the terms of the MIT License.
