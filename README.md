# Rails Model Associations

This project is a Music Review web-app with User sign up, authentication, and third party signup/login options.
![rails](https://user-images.githubusercontent.com/73979053/117595830-b3ce0980-b0f6-11eb-84b0-b7ef118a01c1.jpg)


## Installation

Clone this repository and install all necessary gems

```bash
$ git clone git@github.com:Ernesto002/music-reviews.git
$ bundle install
```

## Database

To migrate the database run the following in your terminal:

```bash
$ rake db:migrate
```

## Omniauth

In order to use Omniauth within this app you will need to get a Google client ID, as well has Google clinet secret key.
You will also need a GitHub client ID, as well as GitHub client secret ID.

Inside your .env file set these varaiables equal to your associated client ID's and secrets:

```bash 
GOOGLE_CLIENT_ID, GOOGLE_CLIENT_SECRET
GITHUB_CLIENT_ID, GITHUB_CLIENT_SECRET
```

## Run app

In order to launch serber run the following in your terminal:

```bash
$ rails s
```

Then in your browser search:

```bash
localhost:3000
```

In order to view the site

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Ernesto002/music-reviews. This project is intended to be a safe, welcoming space for collaboration, and contributers are expected to adhere to the [Code of Conduct](https://github.com/Ernesto002/music-reviews/blob/master/CODE_OF_CONDUCT.MD).

## License 

This code is available for the general public under this [LICENSE](https://github.com/Ernesto002/music-reviews/blob/master/LICENSE.md).
