# drone-npm-auth
[![Build Status](https://travis-ci.org/robertstettner/drone-npm-auth.svg?branch=master)](https://travis-ci.org/robertstettner/drone-npm-auth)

Drone plugin for authenticating into NPM to install private dependencies.

## Configuration

The following parameters are used to configure the plugin:

- `username`: The NPM username. Required.
- `password`: The NPM password. Required.
- `email`: The NPM email. Required.
- `registry`: The NPM registry. Defaults to the default NPM registry.
- `scope`: Scope of the NPM authentication. Optional.
- `path`: Output path of the generated `.npmrc` file. Defaults to `./`.

### Drone configuration example

```yaml
pipeline:
  npm_auth:
    image: robertstettner/drone-npm-auth
    username: joebloggs
    password: mypass
    email: jb@me.com

  build:
    image: node:6
    commands:
      - npm install
      - npm test
    when:
      event: [push, pull_request]
```


## License

MIT